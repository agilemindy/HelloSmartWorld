package com.uni.review.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.review.model.dao.ReviewDao;
import com.uni.review.model.vo.Attachment;
import com.uni.review.model.vo.Review;
import com.uni.review.model.vo.ReviewPageInfo;



public class ReviewService {

	public int getListCount() {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		
		int count = new ReviewDao().getListCount(conn);
				
		close(conn);
		
		return count;
	}

	public ArrayList<Review> selectList(ReviewPageInfo rpi) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectList(conn, rpi);
		
		close(conn);
		
		return list;
	}



	public ArrayList<Review> myReviewList(ReviewPageInfo rpi, int rw) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().myReviewList(conn, rpi, rw);
		System.out.println(" 서비스 리뷰 작성자 : "+ rw);
		close(conn);
		
		return list;
	}

	public int insertReview(Review r, ArrayList<Attachment> fileList) {
		
		Connection conn = getConnection();		
		
		int result1 = new ReviewDao().insertReviewList(conn, r); // 글 등록
		int result2 = new ReviewDao().insertAttachment(conn, fileList); // 제품첨부사진
		
		if(result1 > 0 && result2 > 0) {		
			commit(conn);
		}
		
		else {			
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}

	public Review selectReview(int rId) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().increaseCount(conn, rId);
		
		Review r = null;
		if (result >0) {
			commit(conn);
			r = new ReviewDao().selectReview(conn, rId);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		return r;
	}

	public ArrayList<Attachment> selectAttachment(int rId) {
		
		Connection conn = getConnection();
		ArrayList<Attachment> list = new ReviewDao().selectAttachment(conn, rId);
		close(conn);
		return list;
		
	}

	public int deleteReviewUser(int rNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReviewUser(conn, rNo); 		
				
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateReview(Review r, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().updateReview(conn, r);
		
		int result2 = 1;
		
		
		
		result2 = new ReviewDao().updateAttachment(conn, at);
	
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}

	public ArrayList<Review> selectTopList() {
		
		Connection conn = getConnection();

		ArrayList<Review> list= new ReviewDao().selectTopList(conn);

		close(conn);
		return list;
	}

	public int insertLike(int rId) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertLike(conn, rId); 		
				
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int selectLike(int rId) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().selectLike(conn, rId); 		
				
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}




}
