package com.uni.order.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.uni.member.model.dao.MemberDao;
import com.uni.member.model.vo.Member;
import com.uni.order.model.vo.Order;

public class OrderDao {
	
	private Properties prop = new Properties();
	
	public OrderDao() {
		String fileName = MemberDao.class.getResource("/sql/order/order-query.properties").getPath();
		
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

	public int orderProduct(Connection conn, Order order) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getUserNo());
			pstmt.setString(2, order.getpId());
			pstmt.setInt(3, order.getAmount());
			pstmt.setString(4, order.getAddrName());
			pstmt.setString(5, order.getAddrPhone());
			pstmt.setString(6, order.getAddrAddress());
			pstmt.setString(7, order.getAddrAddressDet());
			pstmt.setString(8, order.getComment());
			pstmt.setInt(9, order.getPayCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}	
		return result;
	}

	public int orderNumCheck(Connection conn, Order order) {
		
		int orderNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("orderNumCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
						
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				orderNum = rset.getInt("ORDER_NO");
			}		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return orderNum;
	}

	public int orderCancel(Connection conn, int orderNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("orderCancel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}	
		return result;
	}

	public int afterOrderPro_Detail(Connection conn, Order order) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("afterOrderPro_Detail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getpId());
			pstmt.setInt(2, order.getAmount());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}	
		return result;
	}

}
