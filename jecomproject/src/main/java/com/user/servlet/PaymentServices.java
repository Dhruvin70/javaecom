package com.user.servlet;

import java.io.IOException;

import com.DAL.OrderImplements;
import com.DB.DBConnect;
import com.entity.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PaymentServices {

	private static final String MODE = "sandbox";

	public String authorizedpayment(Order o) {

		Order order = new Order();

		return null;

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Retrieve the Order object from the request attribute
		Order orderDetail = (Order) req.getAttribute("orderDetail");

		if (orderDetail != null) {
			// Use the Order object as needed
			System.out.println("Order details in PaymentServices: " + orderDetail);
		} else {
			// Handle the case when the Order object is not found in the request
		}
		
		
		private String authorizedPayment()

		// Your code here...
	}
}
