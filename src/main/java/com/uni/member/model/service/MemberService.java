package com.uni.member.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;

import com.uni.member.model.dao.MemberDao;
import com.uni.member.model.vo.Member;

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
			//System.out.println("멤버서비스 : " + member);
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
	
}
