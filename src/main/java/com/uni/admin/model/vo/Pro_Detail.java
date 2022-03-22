package com.uni.admin.model.vo;

import java.sql.Date;

public class Pro_Detail {	
	private String p_id;
	private String p_name;
	private String brand;
	private String color;
	private String capacity;
	private int price;
	private String status;
	private int amount;
	private Date detail_date;
	private int p_stock;
	
	public Pro_Detail() {
		// TODO Auto-generated constructor stub
	}

	public Pro_Detail(String p_id, String p_name, String brand, String color, String capacity, int price, String status,
			int amount, Date detail_date, int p_stock) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.brand = brand;
		this.color = color;
		this.capacity = capacity;
		this.price = price;
		this.status = status;
		this.amount = amount;
		this.detail_date = detail_date;
		this.p_stock = p_stock;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getDetail_date() {
		return detail_date;
	}

	public void setDetail_date(Date detail_date) {
		this.detail_date = detail_date;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	@Override
	public String toString() {
		return "Pro_Detail [p_id=" + p_id + ", p_name=" + p_name + ", brand=" + brand + ", color=" + color
				+ ", capacity=" + capacity + ", price=" + price + ", status=" + status + ", amount=" + amount
				+ ", detail_date=" + detail_date + ", p_stock=" + p_stock + "]";
	}
	
	
	
}
