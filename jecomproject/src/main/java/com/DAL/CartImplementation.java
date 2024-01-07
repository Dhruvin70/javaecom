
package com.DAL;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Items;

public class CartImplementation implements CartDAO {

	private Connection coon;

	public CartImplementation(Connection coon) {
		this.coon = coon;
	}

	public boolean addCart(Cart c) {
		boolean added = false;

		try (Connection connection = DBConnect.getConn();
				PreparedStatement ps = connection.prepareStatement(
						"INSERT INTO cart (pid, id, artName, artist, price) VALUES (?,?,?,?,?)")) {
			ps.setInt(1, c.getItemId());
			ps.setInt(2, c.getUserId());
			ps.setString(3, c.getArtName());
			ps.setString(4, c.getArtist());
			ps.setDouble(5, c.getPrice());
		

			int ex = ps.executeUpdate();

			if (ex == 1) {
				added = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return added;
	}

	@Override
	public List<Cart> getItemByUser(int uid) {
		List<Cart> cartlist = new ArrayList<Cart>();
		Cart cartItem = null;

		try (Connection connection = DBConnect.getConn();
				PreparedStatement ps = connection
						.prepareStatement("SELECT c.cartid, c.artName, c.artist, c.price, c.id, a.file_name FROM cart c JOIN admin_add_items a ON c.pid = a.id WHERE c.id = ?")) {

			ps.setInt(1, uid);
			double totalPrice = 0;
			ItemsImplement dao = new ItemsImplement(connection);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				cartItem = new Cart();
				cartItem.setCartId(rs.getInt("cartid"));
				cartItem.setArtist(rs.getString("artist"));
				cartItem.setArtName(rs.getString("artName"));
				double price = rs.getDouble("price");
				cartItem.setPrice(price);

				cartItem.setUserId(rs.getInt("id"));
				cartItem.setFilename(rs.getString("file_name"));

				totalPrice = totalPrice + (price);
				cartItem.setTotalprice(totalPrice);
				
				cartlist.add(cartItem);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return cartlist;
	}
	
	public boolean deleteItembycartid(int cartid,int uid) {
		boolean deleted = false;
		try {
			
			PreparedStatement ps = coon.prepareStatement("DELETE FROM cart WHERE cartid=? and id=?");
			ps.setInt(1, cartid);
			ps.setInt(2,uid);
			int x = ps.executeUpdate();
			if(x == 1) {
				deleted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return deleted;
		
	}
	
	public boolean removeAllCartItems(int uid) {
		boolean removed = false;
		
		try {
			
			String sql = "DELETE FROM cart WHERE id = ?";
			PreparedStatement ps = coon.prepareStatement(sql);
			ps.setInt(1, uid);
			
			int x = ps.executeUpdate();
			if (x==1) {
				removed = true;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return removed;
	}


}
