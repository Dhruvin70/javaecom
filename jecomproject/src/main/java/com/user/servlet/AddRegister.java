package com.user.servlet;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.DAL.UserDAlIMplement;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "userRegister", urlPatterns = { "/register" })
public class AddRegister extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

		try {

			// Getting request from the client
			String first = req.getParameter("first");
			String last = req.getParameter("last");
			String country = req.getParameter("countryCode");
			long phone = Long.parseLong(req.getParameter("phone"));
			String companyname = req.getParameter("companyname");
			String address = req.getParameter("address");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			String hashedpassword = BCrypt.hashpw(password, BCrypt.gensalt(12));
			HttpSession session = req.getSession();

			if (UserDAlIMplement.isStrongPassword(password)) {
				String pmessage = "Passwords not strong";  
				req.setAttribute("message", pmessage);
				res.sendRedirect("register.jsp");
				return;
			}

			UserDAlIMplement dal = new UserDAlIMplement(DBConnect.getConn());
			if (DBConnect.getConn() == null) {
				String message = "Connection error";
				session.setAttribute("message", message);
				res.sendRedirect("register.jsp");
				return;
			}

			if (dal.isUserExists(email)) {
				String message = "Account with this email already registered";
				session.setAttribute("message", message);
				res.sendRedirect("register.jsp");
				return;
			}

			// Password equality check
			if (!req.getParameter("password").equals(req.getParameter("repassword"))) {
				String message = "Passwords do not match";
				session.setAttribute("message", message);
				res.sendRedirect("register.jsp");
				return;
			}

			// Created object of User class to implement the data to the database through
			// userRegistration class
			User userObj = new User();
			userObj.setFirst(first);
			userObj.setLast(last);
			userObj.setCountry(country);
			userObj.setPhone(phone);
			userObj.setCompanyName(companyname);
			userObj.setAddress(address);
			userObj.setEmail(email);
			userObj.setPassword(hashedpassword);
			

			// Message with data implementation status
			boolean success = dal.userRegistration(userObj);
			if (success) {
				// Registration successful, set success message
				String successMessage = "Registration successful. Redirecting to login page...";
				session.setAttribute("successMessage", successMessage);	

				// Forward to register.jsp to display the success message
				res.sendRedirect("jsp/login.jsp");
			} else {
				// Registration failed, set failure message
				String message = "Registration failed. Please try again.";
				session.setAttribute("message", message);
				res.sendRedirect("register.jsp");
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
