package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

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

@WebServlet(name = "Delete", urlPatterns = { "/deleteItem" })
public class DeleteItem extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			System.out.println(id);

			ItemsImplement dao = new ItemsImplement(DBConnect.getConn());
			Items i = dao.getItemsById(id);
			String imgfile = i.getItemimg();

			HttpSession session = req.getSession();

			boolean del = dao.deleteById(id);
			resp.setContentType("application/json"); // Set content type to JSON
			resp.setCharacterEncoding("UTF-8"); // Set character encoding
			if (del) {

				String realPath = getServletContext().getRealPath("/items/" + imgfile);
				System.out.println(realPath);
				Path filePath = Paths.get(realPath);

				try {
					// Delete the file
					Files.delete(filePath);
					String message = "Item Deletion Successfully";

					System.out.println("File deleted successfully.");

					session.setAttribute("deletionsmessage", message);
					resp.getWriter().write("{\"message\": \"" + message + "\"}");
				} catch (IOException e) {
					System.err.println("Error deleting the file: " + e.getMessage());
				}

			} else {
				String message = "Item Deletion Failed";
				resp.getWriter().write("{\"message\": \"" + message + "\"}");
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
