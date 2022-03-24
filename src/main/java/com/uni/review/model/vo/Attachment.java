package com.uni.review.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int fileNo;			// 파일 고유 번호		// 파일 고유 번호
	private int reviewNo;		// 참조하고 있는 게시글 번호
	private String originName;	// 파일 원본명
	private String changeName;	// 파일 수정명
	private Date uploadDate;	// 파일 업로드일
	private String filePath;	// 파일이 저장된 폴더 경로
	
	public Attachment() {
		// TODO Auto-generated constructor stub
	}

	public Attachment(int fileNo, int reviewNo, String originName, String changeName, Date uploadDate,
			String filePath) {
		super();
		this.fileNo = fileNo;
		this.reviewNo = reviewNo;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.filePath = filePath;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", reviewNo=" + reviewNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", uploadDate=" + uploadDate + ", filePath=" + filePath + "]";
	}
	
	
	
	
}
