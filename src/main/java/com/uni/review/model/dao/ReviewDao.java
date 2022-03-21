package com.uni.review.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


import com.uni.review.model.vo.Review;
import com.uni.review.model.vo.ReviewPageInfo;



public class ReviewDao {
	
	
	
	private Properties prop = new Properties();
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/review/review-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		// TODO Auto-generated method stub
		int count = 0;
		Statement stmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				count = rset.getInt(1);
			}						
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return count;
	}

	public ArrayList<Review> selectList(Connection conn, ReviewPageInfo rpi) {
		// TODO Auto-generated method stub
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		int startRow = (rpi.getCurrentPage()-1) * rpi.getBoardLimit() +1;
		int endRow = startRow + rpi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
									
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();	

				
				r.setReviewNo(rset.getInt("REVIEW_NO"));
				r.setReviewWriter(rset.getInt("REVIEW_WRITER"));
				r.setProductId(rset.getString("PRODUCT_ID"));
				r.setStar(rset.getInt("RV_POINT"));
				r.setReviewTitle(rset.getString("RV_TITLE"));
				r.setReviewContent(rset.getString("RV_CONTENT"));
				r.setCreateDate(rset.getDate("RV_DATE"));
				r.setLike(rset.getInt("RV_LIKE"));
				r.setCount(rset.getInt("RV_VIEW"));
				
				r.setTitleImg(rset.getString("CHANGE_NAME"));	
				list.add(r);	
				

			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
