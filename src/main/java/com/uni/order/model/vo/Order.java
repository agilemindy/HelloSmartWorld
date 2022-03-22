package com.uni.order.model.vo;

import java.sql.Date;

public class Order {

	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	private int orderNo; 
	private int userNo;
	private String pId;
	private int amount; 
	private String addrName;
	private String addrPhone;
	private String shippingAddress;
	private String shippingAddressDet;
	private Date orderDate;
	private int parCode;
	private String orderStatus;

	public Order(int userNo, String pId, int amount, String addrName, String addrPhone, String shippingAddress,
			String shippingAddressDet, Date orderDate, int payCode) {
		
		
		
		
	}

	

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getAddrName() {
		return addrName;
	}

	public void setAddrName(String addrName) {
		this.addrName = addrName;
	}

	public String getAddrPhone() {
		return addrPhone;
	}

	public void setAddrPhone(String addrPhone) {
		this.addrPhone = addrPhone;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public String getShippingAddressDet() {
		return shippingAddressDet;
	}

	public void setShippingAddressDet(String shippingAddressDet) {
		this.shippingAddressDet = shippingAddressDet;
	}

	public int getParCode() {
		return parCode;
	}

	public void setParCode(int parCode) {
		this.parCode = parCode;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", pId=" + pId + ", amount=" + amount
				+ ", addrName=" + addrName + ", addrPhone=" + addrPhone + ", shippingAddress=" + shippingAddress
				+ ", shippingAddressDet=" + shippingAddressDet + ", parCode=" + parCode + ", orderStatus=" + orderStatus
				+ "]";
	}

	
}
