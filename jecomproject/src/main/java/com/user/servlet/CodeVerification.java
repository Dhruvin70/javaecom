package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DAL.UserDAlIMplement;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet(name = "Verification", urlPatterns = { "/otp-verification" })
public class CodeVerification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CodeVerification() {

		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String input1 = request.getParameter("input1");
		String input2 = request.getParameter("input2");
		String input3 = request.getParameter("input3");
		String input4 = request.getParameter("input4");
		String input5 = request.getParameter("input5");
		String input6 = request.getParameter("input6");


		int concated = Integer.parseInt(input1 + input2 + input3 + input4 + input5 + input6);
		HttpSession session = request.getSession();
		String requestURL = (String) session.getAttribute("/req-email");
		System.out.println(requestURL);

		try {

			String storedOTP = (String) session.getAttribute("otp");
			User usr = (User) session.getAttribute("user");

			if (storedOTP != null && Integer.parseInt(storedOTP) == concated) {
				session.removeAttribute("otp");
				if (!requestURL.equals("/req-email")) {
					UserDAlIMplement dal = new UserDAlIMplement(DBConnect.getConn());
					boolean success = dal.userRegistration(usr);
					if (success) {
						// Registration successful, set success message
						String successMessage = "Registration successful. Redirecting to login page...";
						session.setAttribute("successMessage", successMessage);
						response.setStatus(HttpServletResponse.SC_OK);
						response.sendRedirect("jsp/login.jsp");
						return;

					} else {
						String message = "Registration failed. Please try again.";
						session.setAttribute("message", message);
						response.sendRedirect("jsp/register.jsp");
						return;
					}
				} else if (requestURL.equals("/req-email")) {
					
					response.setStatus(HttpServletResponse.SC_OK);
					response.sendRedirect("jsp/newpassword.jsp");
					
				} else {
					response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
					response.sendRedirect("jsp/404.jsp");
				}
			} else {
				String otpmsg = "Invalid OTP";
				session.setAttribute("otpmsg", otpmsg);
				response.sendRedirect("jsp/otp-verification.jsp");
				return;

			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}

	}

}
