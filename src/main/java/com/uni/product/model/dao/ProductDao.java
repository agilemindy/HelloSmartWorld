package com.uni.product.model.dao;

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

import com.uni.admin.model.dao.AdminDao;
import com.uni.admin.model.vo.PageInfo;
import com.uni.admin.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	public ProductDao() {
		String fileName = AdminDao.class.getResource("/sql/product/product-query.properties").getPath();
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
		int ProCount = 0;
		Statement stmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getProCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				ProCount = rset.getInt(1);
			}						
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return ProCount;
	}
	
	public ArrayList<Product> selectList(Connection conn, PageInfo pi) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
									
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				p.setP_id(rset.getString("P_ID"));
				p.setP_name(rset.getString("P_NAME"));
				p.setBrand(rset.getString("BRAND"));
				p.setColor(rset.getString("COLOR"));
				p.setCapacity(rset.getString("CAPACITY"));
				p.setPrice(rset.getInt("PRICE"));
				p.setP_status(rset.getString("P_STATUS"));
				p.setP_stock(rset.getInt("P_STOCK"));
				p.setTitleImg(rset.getString("CHANGE_NAME"));				
				
				list.add(p);
				
				
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
