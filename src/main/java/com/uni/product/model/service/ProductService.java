package com.uni.product.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.admin.model.vo.PageInfo;
import com.uni.admin.model.vo.Product;
import com.uni.product.model.dao.ProductDao;

public class ProductService {
	public int getListCount() { // 페이징 처리 위해 제품 갯수 구하기
		Connection conn = getConnection();
		
		int ProCount = new ProductDao().getListCount(conn);
				
		close(conn);
		return ProCount;
	}
	
	public ArrayList<Product> selectList(PageInfo pi) { // 리스트에 제품 정보 담기
		Connection conn = getConnection();
		ArrayList<Product> list = new ProductDao().selectList(conn, pi);		
		
		close(conn);
		return list;
	}

	

}
