package com.uni.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String address;
	private String addressDet;
	private String tel;
	private String phone;
	private String email;
	private Date enrollDate;
	private Date delDate;
	private String status;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(int userNo, String userId, String userPwd, String userName, String address, String addressDet, String tel, String phone,
			String email, Date enrollDate, Date delDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.address = address;
		this.addressDet = addressDet;
		this.tel = tel;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.delDate = delDate;
		this.status = status;
	}

	public Member(String userId, String userPwd, String userName, String address, String addressDet, String tel, String phone,
			String email) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.address = address;
		this.addressDet = addressDet;
		this.tel = tel;
		this.phone = phone;
		this.email = email;
	}

	public Member(String userId, String userName, String address, String addressDet, String tel, String phone, String email) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.address = address;
		this.addressDet = addressDet;
		this.tel = tel;
		this.phone = phone;
		this.email = email;
	}

	public String getAddressDet() {
		return addressDet;
	}

	public void setAddressDet(String addressDet) {
		this.addressDet = addressDet;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", address=" + address + ", addressDet=" + addressDet + ", tel=" + tel + ", phone=" + phone
				+ ", email=" + email + ", enrollDate=" + enrollDate + ", delDate=" + delDate + ", status=" + status
				+ "]";
	}

	
}
