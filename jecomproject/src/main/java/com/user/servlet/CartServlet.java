package com.user.servlet;

import java.io.IOException;

import com.DAL.CartImplementation;
import com.DAL.ItemsImplement;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Items;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Cart", urlPatterns = { "/addingToCart" })
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int itemid = Integer.parseInt(req.getParameter("itemId"));
			int uidfkid = Integer.parseInt(req.getParameter("uidfkid"));
			
			ItemsImplement dao = new ItemsImplement(DBConnect.getConn());
			Items item = dao.getItemsById(itemid);
			
			Cart c = new Cart();
			c.setUserId(uidfkid);
			c.setItemId(itemid);
			c.setArtist(item.getProduct());
			c.setArtName(item.getName());
			c.setPrice(Double.parseDouble(item.getPrice()));
			
			CartImplementation implemented = new CartImplementation(DBConnect.getConn());
			boolean added = implemented.addCart(c);
			
			HttpSession session = req.getSession();
		
			if(added) {
				session.setAttribute("addCart", "Added to Cart");
				System.out.println("Added Success");
				
				
				
			}else {
				session.setAttribute("addCartFailed", "Something went wrong!");
				System.out.println("Not added");
				
			}
			
			resp.sendRedirect("index.jsp#item" + item.getId());
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
}
