package com.DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.Items;
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
				i.setPrice(set.getString(4));
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
			
			String sql = "SELECT * FROM admin_add_items WHERE product_code=?";
			PreparedStatement ps = coon.prepareStatement(sql);
			ps.setString(1,code);
			ResultSet set = ps.executeQuery();
			
			while (set.next()) {
				
				i = new Items();
				
				i.setName(set.getString(1));
				i.setProduct_code(set.getString(3));
				i.setProduct(set.getString(2));
				i.setPrice(set.getString(4));
				i.setStatus(set.getString(5));
				i.setItemimg(set.getString(6));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return i;
	}
	


}
