package com.user.servlet;

import jakarta.servlet.ServletException;
import com.user.servlet.PaymentServices;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.bouncycastle.ocsp.Req;

import com.entity.Order;
import com.paypal.api.payments.Payment;


/**
 * Servlet implementation class AuthorizePayment
 */

@WebServlet(name = "Authorization", urlPatterns = { "/authorize" })
public class AuthorizePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;    
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Order orderDetail = (Order) session.getAttribute("orderdetails");
		
		try {
			
			PaymentServices paymentServices = new PaymentServices();
			String approvalLink = paymentServices.authorizedPayment(orderDetail, request);
			
			response.sendRedirect(approvalLink);
			
		} catch (Exception e) {

			e.printStackTrace();
		}
			
		
	}

}
