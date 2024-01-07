package com.user.servlet;

import java.io.IOException;



import com.DAL.UserDAlIMplement;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateUserProfile", urlPatterns = { "/editUserProfile" })
public class EditUserProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int userid = Integer.parseInt(req.getParameter("uid"));
			String fieldId = req.getParameter("fieldId");
			String newData = req.getParameter("newData");

			UserDAlIMplement dao = new UserDAlIMplement(DBConnect.getConn());

			boolean updated = dao.updateDatabase(fieldId, newData, userid);
			User us = dao.getUserById(userid);
			if (updated) {

				System.out.println("At EditUserPofile: " + us);

				System.out.println();
				// Inform the client about the successful update
				resp.sendRedirect("jsp/account.jsp");
				req.getSession().setAttribute("email", us.getEmail());
				req.getSession().setAttribute("uid", String.valueOf(us.getId()));
				req.getSession().setAttribute("first", us.getFirst());
				req.getSession().setAttribute("last", us.getLast());
				req.getSession().setAttribute("address", us.getAddress());
				req.getSession().setAttribute("phone", us.getPhone());


				System.out.println("User updated successfully");
			} else {
				// Inform the client about the update failure
				resp.sendRedirect("/account.jsp?updateSuccess=false");
				System.out.println("User not updated");
			}

			// Update the User object (optional, depends on your requirements)

		} catch (NumberFormatException e) {
			// Handle the NumberFormatException, log the error, send a response, etc.
			e.printStackTrace();
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID");
		} catch (Exception e) {
			// Handle other exceptions, log the error, send a response, etc.
			e.printStackTrace();
			resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
		}
	}
}
