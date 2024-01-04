package com.DAL;

import java.util.List;

import com.entity.Order;

public interface OrderDAO {
	public boolean addOrderDetails(Order o);

	public List<Order> getAllOrders(int orderId);
	
	public boolean orderConfirmation(Order o);
}
