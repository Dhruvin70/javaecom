package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.DAL.UserDAlIMplement;
import com.DB.DBConnect;

/**
 * Servlet implementation class NewPassword
 */
@WebServlet(name = "ResetNewPassword", urlPatterns = {"/reset-newpassword" })

public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String LOGIN_PAGE = "jsp/login.jsp";
	private static final String PASSWORD_RESET = "jsp/newpassword.jsp";

	

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String new_password = req.getParameter("new-password");
		String confirm_new = req.getParameter("confirm-new");
		HttpSession session = req.getSession();

		try {
			if (new_password.equals(confirm_new)) {
				String hashedPassword = BCrypt.hashpw(new_password, BCrypt.gensalt(12));
				UserDAlIMplement dao = new UserDAlIMplement(DBConnect.getConn());
				String email = (String) session.getAttribute("resetemail");
				boolean updated = dao.resetPassword(email, hashedPassword);

				if (updated) {
					session.removeAttribute("resetemail");
					res.setStatus(HttpServletResponse.SC_OK);
					res.sendRedirect(LOGIN_PAGE);
					return;
				} else {
					res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					return;
				}

			} else {
				String message = "Passwords do not match";
				session.setAttribute("newpassmessage", message);
				res.sendRedirect(PASSWORD_RESET);
				return;
			}
		} catch (Exception e) {
			// Log the exception
			e.printStackTrace();
			res.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		} 
	}
}
