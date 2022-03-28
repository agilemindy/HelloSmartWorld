package com.uni.member.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.member.model.vo.Member;
import com.uni.member.model.vo.PageInfo;
import com.uni.order.model.vo.Order;


public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
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

	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(
								rset.getInt("USER_NO"),
								rset.getString("USER_ID"),
								rset.getString("USER_PWD"),
								rset.getString("USER_NAME"),
								rset.getString("ADDRESS"),
								rset.getString("ADDRESS_DETAIL"),
								rset.getString("TEL"),
								rset.getString("PHONE"),
								rset.getString("EMAIL"),
								rset.getDate("ENROLL_DATE"),
								rset.getDate("DEL_DATE"),
								rset.getString("STATUS")
								);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return loginUser;
	}

	public Member selectMember(Connection conn, String userId) {
		
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(
						rset.getInt("USER_NO"),
						rset.getString("USER_ID"),
						rset.getString("USER_PWD"),
						rset.getString("USER_NAME"),
						rset.getString("ADDRESS"),
						rset.getString("ADDRESS_DETAIL"),
						rset.getString("TEL"),
						rset.getString("PHONE"),
						rset.getString("EMAIL"),
						rset.getDate("ENROLL_DATE"),
						rset.getDate("DEL_DATE"),
						rset.getString("STATUS")
								);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return mem;
	}

	public int deleteMember(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection conn, Member mem) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getUserPwd());
			pstmt.setString(2, mem.getUserName());
			pstmt.setString(3, mem.getAddress());
			pstmt.setString(4, mem.getAddressDet());
			pstmt.setString(5, mem.getTel());
			pstmt.setString(6, mem.getPhone());
			pstmt.setString(7, mem.getEmail());
			pstmt.setString(8, mem.getUserId());
				
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}	
		return result;
	}

	public int insertMember(Connection conn, Member mem) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getUserId());
			pstmt.setString(2, mem.getUserPwd());
			pstmt.setString(3, mem.getUserName());
			pstmt.setString(4, mem.getAddress());
			pstmt.setString(5, mem.getAddressDet());
			pstmt.setString(6, mem.getTel());
			pstmt.setString(7, mem.getPhone());
			pstmt.setString(8, mem.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}	
		return result;
	}

	public int getListCount(Connection conn, int userNo) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
		
			if(rset.next()) {
			count = rset.getInt(1);
			}
										
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public ArrayList<Order> myOrderInfo(Connection conn, PageInfo pi, int userNo) {
		
		ArrayList<Order> order = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		String sql = prop.getProperty("myOrderInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				
				Order o = new Order();
				
				o.setOrderNo(rset.getInt("ORDER_NO"));
				o.setUserNo(rset.getInt("USER_NO"));
				o.setpId(rset.getString("P_ID"));
				o.setAmount(rset.getInt("AMOUNT"));
				o.setAddrName(rset.getString("ORDER_NAME"));
				o.setAddrPhone(rset.getString("ORDER_PHONE"));
				o.setAddrAddress(rset.getString("ORDER_ADDRESS"));
				o.setAddrAddressDet(rset.getString("ORDER_ADDRESS_DETAIL"));
				o.setComment(rset.getString("ORDER_COMMENT"));
				o.setOrderDate(rset.getDate("ORDER_DATE"));
				o.setPayCode(rset.getInt("PAY_CODE"));
				o.setOrderStatus(rset.getString("ORDER_STATUS"));
				o.setPrice(rset.getInt("PRICE"));
				order.add(o);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return order;
	}

	public int getCListCount(Connection conn, int userNo) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getCListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
		
			if(rset.next()) {
			count = rset.getInt(1);
			}
										
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public ArrayList<Order> orderCanceledInfo(Connection conn, PageInfo pi, int userNo) {
		ArrayList<Order> order = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		String sql = prop.getProperty("orderCanceledInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				
				Order o = new Order();
				
				o.setOrderNo(rset.getInt("ORDER_NO"));
				o.setUserNo(rset.getInt("USER_NO"));
				o.setpId(rset.getString("P_ID"));
				o.setAmount(rset.getInt("AMOUNT"));
				o.setAddrName(rset.getString("ORDER_NAME"));
				o.setAddrPhone(rset.getString("ORDER_PHONE"));
				o.setAddrAddress(rset.getString("ORDER_ADDRESS"));
				o.setAddrAddressDet(rset.getString("ORDER_ADDRESS_DETAIL"));
				o.setComment(rset.getString("ORDER_COMMENT"));
				o.setOrderDate(rset.getDate("ORDER_DATE"));
				o.setPayCode(rset.getInt("PAY_CODE"));
				o.setOrderStatus(rset.getString("ORDER_STATUS"));
				o.setPrice(rset.getInt("PRICE"));
				order.add(o);
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return order;
	}
	
}
