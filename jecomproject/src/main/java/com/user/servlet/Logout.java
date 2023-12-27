package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LogoutClient", urlPatterns = { "/logout" })
public class Logout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			session.removeAttribute("loggedInUser");
			session.removeAttribute("userObj");
			
			HttpSession session2 = req.getSession();
			session.setAttribute("logoutSuccessMsg", "Logout Successfully");
			
			resp.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}


