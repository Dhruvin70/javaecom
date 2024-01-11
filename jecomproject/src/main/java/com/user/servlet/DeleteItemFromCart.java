 package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import com.DAL.CartImplementation;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "RemoveItem", urlPatterns = { "/removecid" })
public class DeleteItemFromCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int cid = Integer.parseInt(req.getParameter("cid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			System.out.println("At deletion wuth cid and uid: " + cid + " " + uid);
			
			CartImplementation dao = new CartImplementation(DBConnect.getConn());
			boolean deleted = dao.deleteItembycartid(cid,uid);
			HttpSession session = req.getSession();

			if(deleted) {
				session.setAttribute("deleteCartItem", "Item Deleted");
			}else {
				session.setAttribute("deletionFailed", "Someting went wrong!");

				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

}
