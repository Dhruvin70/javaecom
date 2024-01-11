package com.user.servlet;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;

import com.entity.Order;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PaymentServices {

	private static final String CLIENT_ID = "AbKjmBOvyL_pvq9036Z6PWqaKgxl2YJ3BofFyE3OHD6MqjD2OKkZb_bXLsfpdgNOamGU4QkO3-dfnOTx";
	private static final String CLIENT_SECRET = "EAkCSvRDW1fb8sAfAyALoGt2_aJ-_5LsHylupm5Z1ilRBDLLz3vGWJOAOQAdNej5AKQ0NhbabfDUepvg";
	private static final String MODE = "sandbox";

	public String authorizedPayment(Order o, HttpServletRequest req) throws PayPalRESTException {

		Payer payer = getPayersInfo(req);
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> transactions = getTransactionInformation(o, req);

		Payment requestPayment = new Payment();
		requestPayment.setIntent("authorize");
		requestPayment.setPayer(payer);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setTransactions(transactions);

		try {
			APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
			Payment createdPayment = requestPayment.create(apiContext);
			String approvalUrl = getApprovalUrl(createdPayment);

			System.out.println("This is approval link   " + approvalUrl);

			return approvalUrl;

			// Redirect to the PayPal approval URL
//			resp.sendRedirect(approvalUrl);
		} catch (PayPalRESTException e) {
			e.printStackTrace(); // Log or handle the exception appropriately
		}

		return null;
	}

	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}

	private Payer getPayersInfo(HttpServletRequest req) {
		HttpSession session = req.getSession();

		Order o = (Order) session.getAttribute("orderDetail");

		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(o.getFirst());
		payerInfo.setLastName(o.getLast());
		payerInfo.setEmail(o.getEmail());

		payer.setPayerInfo(payerInfo);

		return payer;
	}

	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/jecomproject/jsp/cancel.jsp");
		redirectUrls.setReturnUrl("http://localhost:8080/jecomproject/review_payment");

		return redirectUrls;
	}

	private List<Transaction> getTransactionInformation(Order o, HttpServletRequest req) {

		System.out.println("Printing from list transaction" + o);

		Details details = new Details();
		details.setSubtotal(String.format("%.2f", o.getTotal() - 2.99 - (o.getTotal() * 0.07)));
		details.setTax(String.format("%.2f", o.getTotal() * 0.07));
		details.setShipping("2.99");

		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(String.format("%.2f", o.getTotal()));
		amount.setDetails(details);

		Transaction transaction = new Transaction();
		transaction.setDescription("Payment for User_id #" + o.getUser_id());
		transaction.setAmount(amount);

		System.out.println("Details: " + details);
		System.out.println("Amount: " + amount);
		System.out.println("Transaction: " + transaction);

		return List.of(transaction);
	}

	private String getApprovalUrl(Payment payment) {
		for (Links link : payment.getLinks()) {
			if ("approval_url".equals(link.getRel())) {
				return link.getHref();
			}
		}
		throw new RuntimeException("No 'approval_url' link found");
	}

}
