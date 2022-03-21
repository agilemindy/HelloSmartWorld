package com.uni.admin.model.vo;

public class Product {
	
	private String p_id;
	private String p_name;
	private String brand;
	private String color;
	private String capacity;
	private int price;
	private String p_status;
	private int p_stock;
	
	private String titleImg;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	public Product(String p_id, String p_name, String brand, String color, String capacity, int price,
			String p_status, int p_stock) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.brand = brand;
		this.color = color;
		this.capacity = capacity;
		this.price = price;
		this.p_status = p_status;
		this.p_stock = p_stock;
	}
	
	
	public Product(String p_id, String p_name, String brand, String color, String capacity, int price, String p_status,
			int p_stock, String titleImg) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.brand = brand;
		this.color = color;
		this.capacity = capacity;
		this.price = price;
		this.p_status = p_status;
		this.p_stock = p_stock;
		this.titleImg = titleImg;
	}

	public String getP_id() {
		return p_id;
	}


	public void setP_id(String p_id) {
		this.p_id = p_id;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getCapacity() {
		return capacity;
	}


	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getP_status() {
		return p_status;
	}


	public void setP_status(String p_status) {
		this.p_status = p_status;
	}


	public int getP_stock() {
		return p_stock;
	}


	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	
	
	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	@Override
	public String toString() {
		return "Product [p_id=" + p_id + ", p_name=" + p_name + ", brand=" + brand + ", color=" + color + ", capacity="
				+ capacity + ", price=" + price + ", p_status=" + p_status + ", p_stock=" + p_stock + "]";
	}
	
	
	

}
