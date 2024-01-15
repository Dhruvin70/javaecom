package com.DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Order;

public class OrderImplements implements OrderDAO {

	Connection coon;

	public OrderImplements(Connection coon) {
		super();
		this.coon = coon;

	}

	public boolean addOrderDetails(Order o) {
		boolean added = false;

		try {

			String sql = "INSERT INTO order_details (id,first,last,address,email,phone,total) VALUES (?,?,?,?,?,?,?)";
			PreparedStatement ps = coon.prepareStatement(sql);

			ps.setInt(1, o.getUser_id());
			ps.setString(2, o.getFirst());
			ps.setString(3, o.getLast());
			ps.setString(4, o.getAddress());
			ps.setString(5, o.getEmail());
			ps.setLong(6, o.getPhone());
			ps.setDouble(7, o.getTotal());

			int i = ps.executeUpdate();

			if (i == 1) {
				added = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return added;

	}
	

	public boolean orderConfirmation(Order o) {
		boolean confirmed = false;
		String sql = "INSERT INTO `order_itemdetails` ( id, pid, order_id, total) "
				+ "SELECT c.id AS id, c.pid AS pid, o.order_id AS order_id , o.total " + "FROM cart c "
				+ "JOIN order_details o ON c.id = o.id";

		try {

			PreparedStatement ps;
			ps = coon.prepareStatement(sql);
			int x = ps.executeUpdate();
			if (x == 1) {
				confirmed = true;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return confirmed;

	}

	public List<Order> getAllOrders(int userId) {
		List<Order> orders = new ArrayList<Order>();
		Order o = null;
		try {
			String sql = "SELECT oid.*, od.first,od.last,od.address,od.phone, FROM `order_itemdetails` Join order_ORDER BY `order_itemdetails`.`order_id` ASC ";
			PreparedStatement ps = coon.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				 o.setAddress("address"); 
				 o.setDate("date");
				 o.setFirst("first");
				 o.setLast("last");
				 o.setEmail("email");
				 o.setOrder_id(Integer.parseInt("order_id"));
				 o.setTotal(Double.parseDouble("total"));
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}

		return orders;
	}

}
