package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.DAL.CartImplementation;
import com.DAL.OrderImplements;
import com.DB.DBConnect;
import com.entity.Order;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;

@WebServlet(name = "ExecutePayment", urlPatterns = { "/execute_payment" })

public class ExecutePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public ExecutePayment() {
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		try {

			PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.executePayment(paymentId, payerId);

			PayerInfo info = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);

			request.setAttribute("payer", info);
			request.setAttribute("transaction", transaction);
			
			if(payment != null) {
			
			HttpSession session = request.getSession();
			OrderImplements  dao = new OrderImplements(DBConnect.getConn());
			Order o = (Order) session.getAttribute("orderDetail");
			boolean added = dao.addOrderDetails(o);
			if(added) {
				try {
					dao.orderConfirmation(o);
					CartImplementation daoCart = new CartImplementation(DBConnect.getConn());
					daoCart.removeAllCartItems(o.getUser_id());

				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}

			}
			request.getRequestDispatcher("jsp/receipt.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
