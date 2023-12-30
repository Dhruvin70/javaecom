package com.DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DB.DBConnect;
import com.entity.Cart;

public class CartImplementation implements CartDAO {

	private Connection coon;

	public CartImplementation(Connection coon) {
		this.coon = coon;
	}

	public boolean addCart(Cart c) {
	    boolean added = false;

	    try (
	        Connection connection = DBConnect.getConn();
	        PreparedStatement ps = connection.prepareStatement("INSERT INTO cart (pid, id, artName, artist, price, total_price) VALUES (?,?,?,?,?,?)")
	    ) {
	        ps.setInt(1, c.getItemId());
	        ps.setInt(2, c.getUserId());
	        ps.setString(3, c.getArtName());
	        ps.setString(4, c.getArtist());
	        ps.setDouble(5, c.getPrice());
	        ps.setDouble(6, c.getTotalprice());

	        int ex = ps.executeUpdate();

	        if (ex == 1) {
	            added = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return added;
	}


}
