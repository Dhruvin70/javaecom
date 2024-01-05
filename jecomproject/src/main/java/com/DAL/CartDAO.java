package com.DAL;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	
	public boolean addCart(Cart c) ;
	
	public List<Cart> getItemByUser(int uid);
	
	public boolean deleteItembycartid(int cartid , int id);
	
	public boolean removeAllCartItems(int uid);

}
