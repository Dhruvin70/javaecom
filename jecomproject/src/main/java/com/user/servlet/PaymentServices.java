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

	private static final String CLIENT_ID = "AbKjmBOvyL_pvq9036Z6PWq3-dfnOTx";
	private static final String CLIENT_SECRET = "";
	private static final String MODE = "sandbox";

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String total = (String) session.getAttribute("total");

		// Retrieve the Order object from the request attribute
		Order orderDetail = getPayersInfo(req);
		orderDetail.setTotal(Double.parseDouble(total));
		System.out.println("-----------------------------------------------------------");
		System.out.println("Order details in PaymentServices: " + orderDetail);
		System.out.println("-----------------------------------------------------------");

		authorizedPayment(orderDetail, req);
		// Use the Order object as needed

		// Your code here...
	}

	public String authorizedPayment(Order o, HttpServletRequest req) {

		// Retrieve the Order object from the request attribute
		Order orderDetail = getPayersInfo(req);

		System.out.println("-------------------------****************************----------------------------------");

		System.out.println("_________________________o at authorized payment" + orderDetail);
		RedirectUrls redirectUrls = getRedirectURLs();

		System.out.println("---------------------------***************************--------------------------------");

		List<Transaction> transactions = getTransactionInformation(orderDetail, req);

		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		Payment payment = new Payment();

		payment.setIntent("authorize");
		payment.setPayer(payer);
		payment.setRedirectUrls(redirectUrls);
		payment.setTransactions(transactions);

		try {
			APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
			Payment createdPayment = payment.create(apiContext);
			String approvalUrl = getApprovalUrl(createdPayment);

			System.out.println(approvalUrl);

			return approvalUrl;

			// Redirect to the PayPal approval URL
//			resp.sendRedirect(approvalUrl);
		} catch (PayPalRESTException e) {
			e.printStackTrace(); // Log or handle the exception appropriately
		}

		return null;
	}

	private String getApprovalUrl(Payment payment) {
		for (Links link : payment.getLinks()) {
			if ("approval_url".equals(link.getRel())) {
				return link.getHref();
			}
		}
		throw new RuntimeException("No 'approval_url' link found");
	}

	private List<Transaction> getTransactionInformation(Order o, HttpServletRequest req) {

		System.out.println("Printing from list transaction" + o);

		Details details = new Details();
		details.setSubtotal(String.valueOf(o.getTotal() - 2.99 - (o.getTotal() * 0.07)));
		details.setTax(String.valueOf((o.getTotal() * 0.07)));
		details.setShipping("2.99");

		Amount amount = new Amount();
		amount.setCurrency("USD");
		amount.setTotal(String.valueOf(o.getTotal()));
		amount.setDetails(details);

		Transaction transaction = new Transaction();
		transaction.setDescription("Payment for User_id #" + o.getUser_id());
		transaction.setAmount(amount);

		System.out.println("Details: " + details);
		System.out.println("Amount: " + amount);
		System.out.println("Transaction: " + transaction);

		return List.of(transaction);
	}

	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/jecomproject/jsp/cancel.jsp");
		redirectUrls.setReturnUrl("http://localhost:8080/jecomproject/review_payment");

		return redirectUrls;
	}

	private Order getPayersInfo(HttpServletRequest req) {
		HttpSession session = req.getSession();
		return (Order) session.getAttribute("orderDetail");
	}

}
