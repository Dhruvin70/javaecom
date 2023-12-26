package com.admin.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;

import com.DAL.ItemsImplement;
import com.DB.DBConnect;
import com.entity.Items;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(name = "EditItems", urlPatterns = { "/editItem" })
public class EditItems extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			System.out.println(id);
			String name = req.getParameter("name");
			String product = req.getParameter("product");
			String product_code = req.getParameter("product_code");
			String price = req.getParameter("price");
			String itemStatus = req.getParameter("status");
//			String itmimg = req.getParameter("itemimg");

			Items i = new Items();
			i.setId(id);
			i.setName(name);
			i.setPrice(price);
			i.setProduct(product);
			i.setProduct_code(product_code);
			i.setStatus(itemStatus);
//			i.setItemimg(itmimg);
	
			ItemsImplement dao = new ItemsImplement(DBConnect.getConn());

			boolean updatebyidFunc = dao.updateById(i);
			HttpSession session = req.getSession();
			if (updatebyidFunc) {
				String message = "Item updated Successfully";
				session.setAttribute("smessage", message);
				res.sendRedirect("admin/all_items.jsp");

			} else {
				String message = "Item update Failed";
				session.setAttribute("fmessage", message);
				res.sendRedirect("admin/all_items.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
