package com.entity;

public class Items {
	
	private String name,product,product_code,status,itemimg,price;
	
	
	
	public Items() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Items(String price, String name, String product, String product_code, String status, String itemimg) {
		super();
		this.price = price;
		this.name = name;
		this.product = product;
		this.product_code = product_code;
		this.status = status;
		this.itemimg = itemimg;
	}


	/**
	 * @return the price
	 */
	public String getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(String price) {
		this.price = price;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the product
	 */
	public String getProduct() {
		return product;
	}
	/**
	 * @param product the product to set
	 */
	public void setProduct(String product) {
		this.product = product;
	}
	/**
	 * @return the product_code
	 */
	public String getProduct_code() {
		return product_code;
	}
	/**
	 * @param product_code the product_code to set
	 */
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the itemimg
	 */
	public String getItemimg() {
		return itemimg;
	}
	/**
	 * @param itemimg the itemimg to set
	 */
	public void setItemimg(String itemimg) {
		this.itemimg = itemimg;
	}
	
	@Override
	public String toString() {
		return "Items [price=" + price + ", name=" + name + ", product=" + product + ", product_code=" + product_code
				+ ", status=" + status + ", itemimg=" + itemimg + "]";
	}
	
	

}
