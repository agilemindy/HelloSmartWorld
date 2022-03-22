package com.uni.order.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.uni.order.model.dao.OrderDao;
import com.uni.order.model.vo.Order;

public class OrderService {

	public int orderProduct(Order order) {
		//System.out.println("서비스" + order);
		Connection conn = getConnection();
		int result = new OrderDao().orderProduct(conn, order);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	public int orderNumCheck(Order order) {
		Connection conn = getConnection();
		int orderNum = new OrderDao().orderNumCheck(conn, order);
		
		close(conn);
		
		return orderNum;
	}

	
}
