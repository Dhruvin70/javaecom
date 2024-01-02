package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditUserProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			int userid = Integer.parseInt(req.getParameter("uid"));
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
