package com.DAL;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.Items;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

import java.sql.PreparedStatement;

public class ItemsImplement implements ItemsDAO {

	private Connection coon;

	public ItemsImplement(Connection coon) {
		super();
		this.coon = coon;
		// TODO Auto-generated constructor stub
	}

	public boolean itemInsertion(Items item) {
		boolean iteminsertion = false;
		try {

			String sql = "INSERT INTO dmaven.admin_add_items(name, product, product_code, price, status, file_name) VALUES (?,?,?,?,?,?)";
			PreparedStatement ps = coon.prepareStatement(sql);
			ps.setString(1, item.getName());
			ps.setString(2, item.getProduct());
			ps.setString(3, item.getProduct_code());
			ps.setDouble(4, Double.parseDouble(item.getPrice()));
			ps.setString(5, item.getStatus());
			ps.setString(6, item.getItemimg());

			int executionResult = ps.executeUpdate();

			if (executionResult == 1) {
				iteminsertion = true;

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return iteminsertion;

	}

	@Override
	public List<Items> getAllItems() {
		// TODO Auto-generated method stub
		List<Items> list = new ArrayList<Items>();
		Items i = null;

		try {

			String sql = "SELECT * FROM admin_add_items";
			PreparedStatement ps = coon.prepareStatement(sql);

			ResultSet set = ps.executeQuery();

			while (set.next()) {
				i = new Items();

				i.setName(set.getString(1));
				i.setProduct_code(set.getString(3));
				i.setProduct(set.getString(2));
				double priceDouble = set.getDouble(4);
				i.setPrice(String.valueOf(priceDouble));
				i.setStatus(set.getString(5));
				i.setItemimg(set.getString(6));

				list.add(i);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	@Override
	public Items getItemsByCode(String code) {

		Items i = null;

		try {
			String sql = "SELECT * FROM `dmaven`.`admin_add_items` WHERE product_code=?";

			PreparedStatement ps = coon.prepareStatement(sql);
			ps.setString(1, code);
			ResultSet set = ps.executeQuery();

			while (set.next()) {
				i = new Items();

				i.setName(set.getString("name"));

				i.setProduct(set.getString("product"));
				i.setProduct_code(set.getString("product_code"));
				double priceDouble = set.getDouble("price");
				i.setPrice(String.valueOf(priceDouble));
				i.setStatus(set.getString("status"));
				i.setItemimg(set.getString("file_name"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

//	public boolean updateByCode(String code, String file)
	public boolean updateByCode(Items code) {
		boolean edited = false;

		try {

//			String sqlFile = "SELECT file_name FROM  `dmaven`.`admin_add_items` WHERE product_code=?";
			String sqlUpdate = "UPDATE `dmaven`.`admin_add_items` set name=?,product=?,product_code=?,price=?,itemStatus=? WHERE product_code=?";

			PreparedStatement ps1 = coon.prepareStatement(sqlUpdate);
			ResultSet resultSet1 = ps1.executeQuery();
			ps1.setString(1, code.getName());
			ps1.setString(2, code.getProduct());
			ps1.setString(3, code.getProduct_code());
			ps1.setString(4, String.valueOf(code.getPrice()));
			ps1.setString(5, code.getStatus());

			// Select file name based on product code
			/*
			 * PreparedStatement ps2 = coon.prepareStatement(sqlFile); ps2.setString(1,
			 * code); ResultSet resultSet1 = ps2.executeQuery();
			 */

			// Assuming you want to retrieve the file name

			int x = ps1.executeUpdate();

			if (x == 1) {

				edited = true;
			}

			/*
			 * if (resultSet1.next()) {
			 *  Need updated for file
			 *  String fileName = resultSet1.getString("file_name"); // // Do something
			 * with the file name if needed // // String servletContextPathForItem = "C:" +
			 * File.separator + "Users" + File.separator + "dhruv" + File.separator + //
			 * "eclipse-workspace" + File.separator + ".metadata" + File.separator +
			 * ".plugins" + File.separator + // "org.eclipse.wst.server.core" +
			 * File.separator + "tmp0" + File.separator + "wtpwebapps" + File.separator + //
			 * "jecomproject" + File.separator + "items"; // // File filepath = new
			 * File(servletContextPathForItem); // // System.out.println(file);
			 * 
			 * }
			 */

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return edited;
	}

}
