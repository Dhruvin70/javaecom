package com.user.servlet;

import java.io.IOException;

import com.entity.Order;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Order", urlPatterns = { "/order" })
public class OrderFormDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	String orderuserid = req.getParameter("orderuid");
        String orderfirst = req.getParameter("orderfirst");
        String orderlast = req.getParameter("orderlast");
        long orderphone = Long.parseLong(req.getParameter("orderphone"));
        String orderemail = req.getParameter("orderemail");
        String orderaddress = req.getParameter("orderaddress");
        double ordertotal = Double.parseDouble(req.getParameter("total"));
        double tax = Double.parseDouble(req.getParameter("tax"));
        double orderprice = Double.parseDouble(req.getParameter("price"));
        
        
        

        // Create an Order object
        Order orderDetail = new Order();
        orderDetail.setUser_id(Integer.parseInt(orderuserid));
        orderDetail.setAddress(orderaddress);
        orderDetail.setEmail(orderemail);
        orderDetail.setTotal(ordertotal);
        orderDetail.setFirst(orderfirst);
        orderDetail.setLast(orderlast);
        orderDetail.setPhone(orderphone);
        System.out.println("----------------------------------------------------");
        System.out.println("--------------------At order Form detail"+orderDetail);
        System.out.println("----------------------------------------------------");

        // You can perform further actions here, e.g., store in the database, send emails, etc.
        
        
        
        
        
        
        HttpSession session = req.getSession();
        
        session.setAttribute("total", ordertotal);
        session.setAttribute("tax", tax);
        session.setAttribute("orderprice", orderprice);
        
        
        session.setAttribute("orderDetail", orderDetail);
        
       

        // Forward to a confirmation page (you need to create this JSP)
        resp.sendRedirect("jsp/checkout.jsp");
        
        
        
    }
}
