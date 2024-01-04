package com.entity;

public class Order {
	private int order_id, user_id;
	private long phone;
	private String first, last, address, email, date;
	double total;

	public double getTotal() {
		return total;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public Order() {
		super();

	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getLast() {
		return last;
	}

	public void setLast(String last) {
		this.last = last;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", phone=" + phone + ", first=" + first
				+ ", last=" + last + ", addtess=" + address + ", email=" + email + ", date=" + date + ", total=" + total
				+ "]";
	}

}
