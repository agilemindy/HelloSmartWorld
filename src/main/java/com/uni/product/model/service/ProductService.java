package com.uni.product.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.admin.model.vo.PageInfo;
import com.uni.admin.model.vo.Product;
import com.uni.product.model.dao.ProductDao;

public class ProductService {
	public int getListCount() {
		Connection conn = getConnection();
		
		int ProCount = new ProductDao().getListCount(conn);
				
		close(conn);
		return ProCount;
	}
	
	public ArrayList<Product> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectList(conn, pi);		
		
		close(conn);
		return list;
	}

	

}
