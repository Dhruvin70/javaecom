package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.DAL.UserDAlIMplement;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "userLogin", urlPatterns = { "/login" })

public class UserLogin extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

		try {

			UserDAlIMplement login = new UserDAlIMplement(DBConnect.getConn());
			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			System.out.println("No email" + email + "  " + password);

			try {

				if (email.equals("admin437@gmail.com") && password.equals("123456789")) {
					User us = new User();
					us.setFirst("Admin");
					req.setAttribute("userObj", us);
					res.sendRedirect("admin/adminhome.jsp");
				}

				else {
					User loggedInUser = login.userLogin(email, password);
					if (loggedInUser != null) {
						User us = new User();
						req.getSession().setAttribute("email", loggedInUser.getEmail());
						req.getSession().setAttribute("uid", String.valueOf(loggedInUser.getId()));
						req.getSession().setAttribute("first", loggedInUser.getFirst());
						req.getSession().setAttribute("last", loggedInUser.getLast());
						req.getSession().setAttribute("address", loggedInUser.getAddress());
						req.getSession().setAttribute("phone", loggedInUser.getPhone());

						// Authentication successful, set the user in the session
						req.getSession().setAttribute("loggedInUser", loggedInUser);
						System.out.println("-----------------------------------------------------");
						System.out.println( "At user login.java"+loggedInUser.getId());
						System.out.println("-----------------------------------------------------");
						// Redirect to a secure page or perform other actions
						res.sendRedirect("index.jsp");
					} else {
						// Authentication failed
						System.out.println("Login failed for: " + email);
						// You might want to redirect to a login page with an error message
						req.setAttribute("errorMessage", "Invalid email or password");
						req.getRequestDispatcher("/login.jsp").forward(req, res);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				// Log the exception or provide a user-friendly error message
				req.setAttribute("errorMessage", "An error occurred during login. Please try again later.");
				req.getRequestDispatcher("/login.jsp").forward(req, res);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
