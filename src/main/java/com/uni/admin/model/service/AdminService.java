package com.uni.admin.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.admin.model.dao.AdminDao;
import com.uni.admin.model.vo.PageInfo;
import com.uni.admin.model.vo.Pro_Attachment;
import com.uni.admin.model.vo.Pro_Detail;
import com.uni.admin.model.vo.Product;
import com.uni.member.model.vo.Member;
import com.uni.order.model.vo.Order;
import com.uni.review.model.vo.Review;

public class AdminService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int ProCount = new AdminDao().getListCount(conn);
				
		close(conn);
		return ProCount;
	}

	public ArrayList<Product> selectList(PageInfo pi) { // 제품관리에서 제품나열을 위해 제품 가져오기
		Connection conn = getConnection();
		ArrayList<Product> list = new AdminDao().selectList(conn, pi);		
		
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectList() { // 재고관리에서 사용할 제품정보 가져오기
		Connection conn = getConnection();
		ArrayList<Product> list = new AdminDao().selectList(conn);		
		
		close(conn);
		return list;
	}

	public int insertProduct(Product p, ArrayList<Pro_Attachment> fileList) { // 제품등록 사진첨부하기
		Connection conn = getConnection();		
		
		int result1 = new AdminDao().insertProductList(conn, p); // 글 등록
		int result2 = new AdminDao().insertPro_Attachment(conn, fileList); // 제품첨부사진
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	public Product selectProduct(String pid) {
		Connection conn = getConnection();
				
		Product p = null;
		
		p = new AdminDao().selectProduct(conn, pid);
		
		if(p == null) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);		
		
		return p;
	}

	public ArrayList<Pro_Attachment> selectPro_Attachment(String pid) {
		Connection conn = getConnection();		
		ArrayList<Pro_Attachment> list = new AdminDao().selectPro_Attachment(conn, pid);
		
		close(conn);
		return list;
	}

	public int updateProduct(Product p, Pro_Attachment at) { // 제품수정
		Connection conn = getConnection();
		
		int result1 = new AdminDao().updateProduct(conn, p); // 제품 글만 수정
		
		int result2 = 1;
		if(at != null) {
			if(at.getP_id() != null) {// 기존 사진이 있을 경우, 사진첨부
				result2 = new AdminDao().updatePro_Attachment(conn, at);
			}else { // 기존 사진이 없을 경우, 사진 첨부
				result2 = new AdminDao().insertNewPro_Attachment(conn, at , p);
			}
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}

	public int deleteProduct(String pId) {
		Connection conn = getConnection();
		
		int result1 = new AdminDao().deleteProduct(conn, pId); 
		
		int result2 = new AdminDao().deleteProAttachment(conn, pId);
				
		if(result1*result2 > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}

	public int getInvenCount() {
		Connection conn = getConnection();
		
		int InvenCount = new AdminDao().getInvenCount(conn);
				
		close(conn);
		return InvenCount;
	}

	public ArrayList<Pro_Detail> selectInvenList(PageInfo pi) { // 재고관리 - 입출고 내역 정보
		Connection conn = getConnection();
		ArrayList<Pro_Detail> list = new AdminDao().selectInvenList(conn, pi);		
		
		close(conn);
		return list;
	}

	public int insertInventory(Pro_Detail pd) { // 입출고 등록
		Connection conn = getConnection();		
		
		int result = new AdminDao().insertInventoryList(conn, pd);		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) { // 회원정보 불러오기
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDao().selectMemberList(conn, pi);		
		
		close(conn);
		return list;
	}

	public int getMemberCount() {
		Connection conn = getConnection();
		
		int ProCount = new AdminDao().getMemberCount(conn);
				
		close(conn);
		return ProCount;
	}

	public int deleteMember(int userNo) { // 회원삭제
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteMember(conn, userNo); 		
				
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getSalesListCount() { // 결제건수 구하기
		Connection conn = getConnection();
		
		int ProCount = new AdminDao().getSalesCount(conn);
				
		close(conn);
		return ProCount;
	}

	public ArrayList<Order> selectSalesList(PageInfo pi) { // 결제내역 구하기
		Connection conn = getConnection();
		
		ArrayList<Order> list = new AdminDao().selectSalesList(conn, pi);		
		
		close(conn);
		return list;
	}

	public ArrayList<Order> selectSalesListSortAsc(PageInfo pi) { // 매출관리 결제내역 오래된순으로 구하기
		Connection conn = getConnection();
		
		ArrayList<Order> list = new AdminDao().selectSalesListSortAsc(conn, pi);		
		
		close(conn);
		return list;
	}

	public int getReviewListCount() {
		Connection conn = getConnection();
		
		int ProCount = new AdminDao().getReviewCount(conn);
				
		close(conn);
		return ProCount;
	}

	public ArrayList<Review> selectReviewList(PageInfo pi) { // 등록된 리뷰 불러오기
		Connection conn = getConnection();
		
		ArrayList<Review> list = new AdminDao().selectReviewList(conn, pi);		
		
		close(conn);
		return list;
	}

	public int deleteReview(int rNo) { // 리뷰삭제
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteReview(conn, rNo); 		
				
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Pro_Detail selectInventory(String pNo) { // 재고상세내역
		Connection conn = getConnection();
		
		Pro_Detail pd = null;
		
		pd = new AdminDao().selectInventory(conn, pNo);
		
		if(pd == null) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);		
		
		return pd;
	}

	public int updateInventory(Pro_Detail pd) { // 재고관리 수량 수정
		Connection conn = getConnection();
		
		int result = new AdminDao().updateInventory(conn, pd);
				
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteInventory(int pNo) { // 재고삭제
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteInventory(conn, pNo); 		
				
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Product> searchProduct(String search) { // 제품관리 - 검색기능
		Connection conn = getConnection();
		ArrayList<Product> list = new AdminDao().searchProduct(conn, search);		
		
		close(conn);
		return list;
	}

	public int getSearchListCount(String search) { // 제품검색 갯수
		Connection conn = getConnection();
		
		int ProCount = new AdminDao().getSearchListCount(conn, search);
				
		close(conn);
		
		return ProCount;
		
	}

	 

	

}
