package com.uni.review.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;


import com.uni.review.model.dao.ReviewDao;
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

}
