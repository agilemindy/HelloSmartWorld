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

	public int orderCancel(int orderNo) {
		
		Connection conn = getConnection();
		int result = new OrderDao().orderCancel(conn, orderNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int afterOrderPro_Detail(Order order) {
		Connection conn = getConnection();
		int result = new OrderDao().afterOrderPro_Detail(conn, order);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
}
