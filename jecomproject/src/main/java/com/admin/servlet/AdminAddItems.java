package com.admin.servlet;

import java.io.File;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.FileAlreadyExistsException;
import java.util.List;

import com.DAL.ItemsImplement;
import com.DB.DBConnect;
import com.entity.Items;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(name = "AdminAddItems", urlPatterns = { "/adminAddItems" })
@MultipartConfig
public class AdminAddItems extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {

			String name = req.getParameter("name");
			String product = req.getParameter("product");
			String product_code = req.getParameter("product_code");
			String price = req.getParameter("price");
			String itemStatus = req.getParameter("itemStatus");
			Part itemimg = req.getPart("itemimg");
			String imgFileName = itemimg.getSubmittedFileName();

			HttpSession session = req.getSession();

			


			ItemsImplement ii = new ItemsImplement(DBConnect.getConn());
			Items item = new Items();
			item.setItemimg(imgFileName);
			item.setName(name);
			item.setProduct(product);
			item.setPrice(price);
			item.setProduct_code(product_code);
			item.setStatus(itemStatus);
			
			System.out.println(item);


			boolean implemented = ii.itemInsertion(item);

			if (implemented) {

				String path = getServletContext().getRealPath("") + "items";

				File file = new File(path);

				System.out.println(file);

				itemimg.write(path + File.separator + imgFileName);

				String successMsg = "Item Added Successfully.\n" + item;
				session.setAttribute("smessage", successMsg);
//				req.getRequestDispatcher("admin/add_item.jsp").forward(req, res);
				res.sendRedirect("admin/add_item.jsp");
				return;
			} else {
				String failureMsg = "Unable to add item something went wrong";
				session.setAttribute("fmessage", failureMsg);
//				req.getRequestDispatcher("admin/add_item.jsp").forward(req, res);
				res.sendRedirect("admin/add_item.jsp");
				return;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
