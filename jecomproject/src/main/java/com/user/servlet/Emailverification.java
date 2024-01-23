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
import com.entity.Mailer;

/**
 * User set new password only if email exists Servlet implementation class
 * Emailverification
 */
@WebServlet(name = "Registered-Email", urlPatterns = { "/regemail" })

public class Emailverification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String regemail = request.getParameter("reg-email");
	
		try {
			UserDAlIMplement dao = new UserDAlIMplement(DBConnect.getConn());
			boolean exists = dao.isUserExists(regemail);
			HttpSession session = request.getSession();
			String emailmsg = "If Email is registered you will recive OTP-code";
			session.setAttribute("resetemail", regemail);
			session.setAttribute("reg-email", emailmsg);
			if (exists) {
				Mailer otpnewpass = new Mailer();
				String otp_gen = otpnewpass.generateOTP();
				otpnewpass.sendOTPEmail(regemail, otp_gen);
				session.setAttribute("otp", otp_gen);
				session.setAttribute("/req-email", "/req-email");
				response.sendRedirect("jsp/otp-verification.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
