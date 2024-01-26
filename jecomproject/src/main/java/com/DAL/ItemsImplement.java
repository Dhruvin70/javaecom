package com.DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Items;

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

				i.setName(set.getString("name"));
				i.setProduct_code(set.getString("product_code"));
				i.setProduct(set.getString("product"));
				double priceDouble = set.getDouble("price");
				i.setPrice(String.valueOf(priceDouble));
				i.setStatus(set.getString("status"));
				i.setItemimg(set.getString("file_name"));
				i.setId(set.getInt("id"));
				list.add(i);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Items getItemsById(int id) {

		Items i = null;

		try {
			String sql = "SELECT * FROM `dmaven`.`admin_add_items` WHERE id=?";

			PreparedStatement ps = coon.prepareStatement(sql);
			ps.setInt(1, id);
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
				i.setId(set.getInt("id"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

//	public boolean updateByCode(String code, String file)
	public boolean updateById(Items id) {
		boolean edited = false;

		try {

			String sqlUpdate = "UPDATE `dmaven`.`admin_add_items` SET name=?,product=?,product_code=?,price=?,status=? WHERE id=?";

			PreparedStatement ps1 = coon.prepareStatement(sqlUpdate);

			ps1.setString(1, id.getName());
			ps1.setString(2, id.getProduct());
			ps1.setString(3, id.getProduct_code());
			ps1.setDouble(4, Double.parseDouble(id.getPrice()));
			ps1.setString(5, id.getStatus());
			ps1.setInt(6, id.getId());

			int x = ps1.executeUpdate();

			if (x == 1) {

				edited = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return edited;
	}

	public boolean deleteById(int id) {

		System.out.println("I am at delete function");

		boolean deleted = false;

		try {
			String sqldelete = "Delete From `dmaven`.`admin_add_items` WHERE id=? ";
			PreparedStatement ps = coon.prepareStatement(sqldelete);
			ps.setInt(1, id);

			int i = ps.executeUpdate();

			if (i == 1) {
				// Drop column
				String dropId = "ALTER TABLE `dmaven`.`admin_add_items` DROP COLUMN id";
				PreparedStatement psDrop = coon.prepareStatement(dropId);
				psDrop.executeUpdate();

				// Recreate id column as primary key
				String recreateId = "ALTER TABLE `dmaven`.`admin_add_items` ADD COLUMN id INT PRIMARY KEY AUTO_INCREMENT";
				PreparedStatement psRecreate = coon.prepareStatement(recreateId);
				psRecreate.executeUpdate();
				deleted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleted;
	}

	@Override
	public List<Items> getNewBooks() {

		List<Items> list = new ArrayList<Items>();
		Items item = null;
		try {

			String sql = "SELECT * FROM admin_add_items WHERE status=? ORDER BY id DESC";
			PreparedStatement ps = coon.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 0;
			while (rs.next() && i <= 4) {
				item = new Items();
				item.setName(rs.getString("name"));
				item.setProduct(rs.getString("product"));
				item.setProduct_code(rs.getString("product_code"));
				double priceDouble = rs.getDouble("price");
				item.setPrice(String.valueOf(priceDouble));
				item.setStatus(rs.getString("status"));
				item.setItemimg(rs.getString("file_name"));
				item.setId(rs.getInt("id"));
				list.add(item);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

}
