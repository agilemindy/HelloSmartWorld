package com.uni.admin.model.vo;

import java.sql.Date;

public class Pro_Attachment {
	private int pic_no;
	private String p_id;
	private String origin_name;
	private String change_name;
	private Date upload_date;
	private String file_path;
	
	public Pro_Attachment() {
		// TODO Auto-generated constructor stub
	}

	public Pro_Attachment(int pic_no, String p_id, String origin_name, String change_name, Date upload_date,
			String file_path) {
		super();
		this.pic_no = pic_no;
		this.p_id = p_id;
		this.origin_name = origin_name;
		this.change_name = change_name;
		this.upload_date = upload_date;
		this.file_path = file_path;
	}
	
	public Pro_Attachment(int pic_no, String origin_name, String change_name) {
		super();
		this.pic_no = pic_no;		
		this.origin_name = origin_name;
		this.change_name = change_name;		
	}

	public int getPic_no() {
		return pic_no;
	}

	public void setPic_no(int pic_no) {
		this.pic_no = pic_no;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getOrigin_name() {
		return origin_name;
	}

	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}

	public String getChange_name() {
		return change_name;
	}

	public void setChange_name(String change_name) {
		this.change_name = change_name;
	}

	public Date getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	@Override
	public String toString() {
		return "Pro_Attachment [pic_no=" + pic_no + ", p_id=" + p_id + ", origin_name=" + origin_name + ", change_name="
				+ change_name + ", upload_date=" + upload_date + ", file_path=" + file_path + "]";
	}
	
	
	

}
