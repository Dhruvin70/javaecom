package com.admin.servlet;

import java.io.IOException;

import com.DAL.ItemsImplement;
import com.DB.DBConnect;
import com.entity.Items;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//@WebServlet(name = "DeleteItem", urlPatterns = { "/deleteItem" })
public class DeleteItem extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			ItemsImplement dao = new ItemsImplement(DBConnect.getConn());
			HttpSession session = req.getSession();

			boolean del = dao.deleteById(id);
			resp.setContentType("application/json"); // Set content type to JSON
			resp.setCharacterEncoding("UTF-8"); // Set character encoding
			if (del) {
				String message = "Item Deletion Successfully";

				session.setAttribute("deletionsmessage", message);
				resp.getWriter().write("{\"message\": \"" + message + "\"}");

			} else {
				String message = "Item Deletion Failed";
				resp.getWriter().write("{\"message\": \"" + message + "\"}");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
