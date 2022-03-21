package com.uni.admin.model.vo;

public class PageInfo {
	
	private int proCount;			// 총 제품 갯수
	private int currentPage;		// 현재 페이지 (즉, 요청한 페이지)
	private int startPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 시작 수 
	private int endPage;			// 현재 페이지에 하단에 보여지는 페이징 바의 끝 수
	private int maxPage;			// 전체 페이지에서의 가장 마지막 페이지
	private int pageLimit;			// 한 페이지 하단에 보여질 페이지 최대 갯수
	private int boardLimit;			// 한 페이지에 보여질 게시글 최대 갯수
	
	public PageInfo() {
		
	}

	public PageInfo(int proCount, int currentPage, int startPage, int endPage, int maxPage, int pageLimit,
			int boardLimit) {
		super();
		this.proCount = proCount;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.maxPage = maxPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
	}

	public int getproCount() {
		return proCount;
	}

	public void setproCount(int proCount) {
		this.proCount = proCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	@Override
	public String toString() {
		return "PageInfo [proCount=" + proCount + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", maxPage=" + maxPage + ", pageLimit=" + pageLimit + ", boardLimit="
				+ boardLimit + "]";
	}
	
	

}