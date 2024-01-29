package com.user.servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Search", urlPatterns = { "/search" })
public class SearchBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	   try {
		   System.out.println("-------------------------------------------------------------");
		   System.out.println("-------------------------------------------------------------");
		   System.out.println("-------------------------------------------------------------");

		   String ch = request.getParameter("ch");
		   ch.trim();
		   if(!ch.equals(null)) {
		   HttpSession session = request.getSession();
		   session.setAttribute("ch", ch);
		   session.setAttribute("search", "search");
		   }
		   
		   response.sendRedirect("index.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
}
