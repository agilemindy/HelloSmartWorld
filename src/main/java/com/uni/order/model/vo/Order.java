package com.uni.order.model.vo;

import java.sql.Date;

public class Order {

	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	private int orderNo; // 주문번호
	private int userNo; // 회원번호
	private String pId; // 제품아이디
	private int amount; // 수량
	private String addrName;
	private String addrPhone;
	private String addrAddress;
	private String addrAddressDet;
	private String comment;
	private Date orderDate; // 주문날짜
	private int payCode;
	private String orderStatus;
	private int price; // 가격
	
	private String date; // 날짜 띄우기용
	
	public Order(int orderNo, int userNo, String pId, int amount, String addrName, String addrPhone, String addrAddress,
			String addrAddressDet, String comment, Date orderDate, int payCode, String orderStatus) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.pId = pId;
		this.amount = amount;
		this.addrName = addrName;
		this.addrPhone = addrPhone;
		this.addrAddress = addrAddress;
		this.addrAddressDet = addrAddressDet;
		this.comment = comment;
		this.orderDate = orderDate;
		this.payCode = payCode;
		this.orderStatus = orderStatus;
	}

	public Order(int userNo, String pId, int amount, String addrName, String addrPhone, String addrAddress,
			String addrAddressDet, String comment, int payCode) {
		super();
		this.userNo = userNo;
		this.pId = pId;
		this.amount = amount;
		this.addrName = addrName;
		this.addrPhone = addrPhone;
		this.addrAddress = addrAddress;
		this.addrAddressDet = addrAddressDet;
		this.comment = comment;
		this.payCode = payCode;
	}
	
	public Order(int orderNo, int userNo, String pId, int amount, String addrName, String addrPhone, String addrAddress,
			String addrAddressDet, String comment, int payCode, int price) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.pId = pId;
		this.amount = amount;
		this.addrName = addrName;
		this.addrPhone = addrPhone;
		this.addrAddress = addrAddress;
		this.addrAddressDet = addrAddressDet;
		this.comment = comment;
		this.payCode = payCode;
		this.price = price;
	}
	
	

	public Order(int orderNo, int userNo, String pId, int amount, String addrName, String addrPhone, String addrAddress,
			String addrAddressDet, String comment, int payCode, String orderStatus, int price, String date) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.pId = pId;
		this.amount = amount;
		this.addrName = addrName;
		this.addrPhone = addrPhone;
		this.addrAddress = addrAddress;
		this.addrAddressDet = addrAddressDet;
		this.comment = comment;
		this.payCode = payCode;
		this.orderStatus = orderStatus;
		this.price = price;
		this.date = date;
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

	public String getAddrAddress() {
		return addrAddress;
	}

	public void setAddrAddress(String addrAddress) {
		this.addrAddress = addrAddress;
	}

	public String getAddrAddressDet() {
		return addrAddressDet;
	}

	public void setAddrAddressDet(String addrAddressDet) {
		this.addrAddressDet = addrAddressDet;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getPayCode() {
		return payCode;
	}

	public void setPayCode(int payCode) {
		this.payCode = payCode;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	

	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userNo=" + userNo + ", pId=" + pId + ", amount=" + amount
				+ ", addrName=" + addrName + ", addrPhone=" + addrPhone + ", addrAddress=" + addrAddress
				+ ", addrAddressDet=" + addrAddressDet + ", comment=" + comment + ", orderDate=" + orderDate
				+ ", payCode=" + payCode + ", orderStatus=" + orderStatus + ", price=" + price + "]";
	}

	

	
	
	
}
