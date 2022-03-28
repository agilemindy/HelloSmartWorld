package com.uni.member.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.member.model.dao.MemberDao;
import com.uni.member.model.vo.Member;
import com.uni.member.model.vo.PageInfo;
import com.uni.order.model.vo.Order;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		close(conn);
		
		return loginUser;
	}

	public Member selectMember(String userId) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().selectMember(conn, userId);
		close(conn);
		
		return m;
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Member updateMember(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, mem);
		
		Member member = new Member();
		
		if(result > 0) {
			commit(conn);
			member = new MemberDao().selectMember(conn, mem.getUserId());
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		return member;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		return result;
	}

	public int insertMember(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, mem);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//주문상태가 Y인 주문내역======================
	public int getListCount(int userNo) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().getListCount(conn, userNo);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Order> myOrderInfo(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Order> order = new MemberDao().myOrderInfo(conn, pi, userNo);
		
		close(conn);
		
		return order;
	}
	//========================================
	
	
	
	//주문상태가 N인 주문내역======================
	public int getCListCount(int userNo) {
		Connection conn = getConnection();
		
		int count = new MemberDao().getCListCount(conn, userNo);
		
		close(conn);
		
		return count;
	}

	public ArrayList<Order> orderCanceledInfo(PageInfo pi, int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Order> order = new MemberDao().orderCanceledInfo(conn, pi, userNo);
		
		close(conn);
		
		return order;
	}
	//========================================
	
	
}
