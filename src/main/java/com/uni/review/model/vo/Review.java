package com.uni.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNo;			
	private int reviewWriter;		
	private String productId;
	private int star;
	private String reviewTitle;		
	private String reviewContent;	
	private Date createDate;		
	private int like;
	private int count;		
	
	
	private String titleImg;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNo, int reviewWriter, String productId, int star, String reviewTitle, String reviewContent,
			Date createDate, int like, int count) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.productId = productId;
		this.star = star;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.createDate = createDate;
		this.like = like;
		this.count = count;
	}
	
	
	
	public Review(int reviewNo, int reviewWriter, String productId, int star, String reviewTitle, String reviewContent) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.productId = productId;
		this.star = star;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;	
	
	}

	
	
	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(int reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewWriter=" + reviewWriter + ", productId=" + productId
				+ ", star=" + star + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", createDate=" + createDate + ", like=" + like + ", count=" + count + "]";
	}
	
	
	
}
