package com.admin.servlet;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import com.entity.Items;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("adminAddItems")
public class AdminAddItems extends HttpServlet{


protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
	try {
		
		String name = req.getParameter("name");
		String product = req.getParameter("product");
		String product_code = req.getParameter("product_code");
		String itemStatus = req.getParameter("itemStatus");
		Part itemimg = req.getPart("itemimg");
		String imgFileName = itemimg.getSubmittedFileName();
		Double price = Double.parseDouble(req.getParameter("price"));
		
		Items itm1 = new Items(price, name, product, product_code, itemStatus, imgFileName);
		
		System.out.println(name + product + product_code+ itemStatus+itemimg+imgFileName+price);
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
}
	
}
