package com.uni.order.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.uni.member.model.dao.MemberDao;
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
		System.out.println("다오" + order);
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
			
			System.out.println(order.getUserNo() + order.getpId() + order.getAmount() + order.getAddrAddress() + 
					order.getAddrAddressDet() + order.getAddrName() + order.getAddrPhone() + order.getPayCode());
			
			
			
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
