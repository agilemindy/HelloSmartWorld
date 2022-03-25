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


import com.uni.review.model.vo.Attachment;
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

	
	public ArrayList<Review> myReviewList(Connection conn, ReviewPageInfo rpi, int rw) {
		// TODO Auto-generated method stub
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("myReviewList");
		
		int startRow = (rpi.getCurrentPage()-1) * rpi.getBoardLimit() +1;
		int endRow = startRow + rpi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, rw);
			
									
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

	public int insertReviewList(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getReviewWriter());
			pstmt.setString(2, r.getProductId());
			pstmt.setInt(3, r.getStar());
			pstmt.setString(4, r.getReviewTitle());
			pstmt.setString(5, r.getReviewContent());		
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				
				pstmt = conn.prepareStatement(sql);			
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int increaseCount(Connection conn, int rId) {
		// TODO Auto-generated method stub
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rId);
			result =pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

	public Review selectReview(Connection conn, int rId) {
		
		Review r = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rId);
			
			rset = pstmt.executeQuery();
			
			

			if(rset.next()) {
				r = new Review(rset.getInt("REVIEW_NO"),
						rset.getInt("REVIEW_WRITER"),
						rset.getString("PRODUCT_ID"),
						rset.getInt("RV_POINT"),
						rset.getString("RV_TITLE"),
						rset.getString("RV_CONTENT"),
						rset.getDate("RV_DATE"),
						rset.getInt("RV_LIKE"),
						rset.getInt("RV_VIEW"));				
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return r;
	}


	public ArrayList<Attachment> selectAttachment(Connection conn, int rId) {
		// TODO Auto-generated method stub
		
		ArrayList<Attachment> list = null;
		PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("selectAttachment");

		   try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, rId);
			
			rset = pstmt.executeQuery();

			list = new ArrayList<>();
			
		    while(rset.next()) {
		    	
		    Attachment at = new Attachment();
		    	
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				
				list.add(at);
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



	public int deleteReviewUser(Connection conn, int rNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReviewUser");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			close(pstmt);
			
		}
		
		return result;
	}

	public int updateReview(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getReviewTitle());
			pstmt.setString(2, r.getProductId());
			pstmt.setString(3, r.getReviewContent());			
			pstmt.setInt(4, r.getStar());
		
			pstmt.setInt(5, r.getReviewNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChangeName());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertNewAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getReviewNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
