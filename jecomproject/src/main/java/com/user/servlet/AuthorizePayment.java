package com.user.servlet;

import jakarta.servlet.ServletException;
import com.user.servlet.PaymentServices;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.entity.Order;

@WebServlet(name = "Authorization", urlPatterns = { "/authorize" })
public class AuthorizePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AuthorizePayment() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Order orderDetail = (Order) session.getAttribute("orderDetail");

		try {

			PaymentServices paymentServices = new PaymentServices();
			String approvalLink = paymentServices.authorizedPayment(orderDetail, request);

			System.out.println(approvalLink);

			response.sendRedirect(approvalLink);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
