package com.uni.admin.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.commit;
import static com.uni.common.JDBCTemplate.getConnection;
import static com.uni.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.admin.model.dao.AdminDao;
import com.uni.admin.model.vo.PageInfo;
import com.uni.admin.model.vo.Pro_Attachment;
import com.uni.admin.model.vo.Pro_Detail;
import com.uni.admin.model.vo.Product;
import com.uni.member.model.vo.Member;

public class AdminService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int ProCount = new AdminDao().getListCount(conn);
				
		close(conn);
		return ProCount;
	}

	public ArrayList<Product> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Product> list = new AdminDao().selectList(conn, pi);		
		
		close(conn);
		return list;
	}
	
	public ArrayList<Product> selectList() {
		Connection conn = getConnection();
		ArrayList<Product> list = new AdminDao().selectList(conn);		
		
		close(conn);
		return list;
	}

	public int insertProduct(Product p, ArrayList<Pro_Attachment> fileList) {
		Connection conn = getConnection();		
		
		int result1 = new AdminDao().insertProductList(conn, p); // 글 등록
		int result2 = new AdminDao().insertPro_Attachment(conn, fileList); // 제품첨부사진
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	public Product selectProduct(String pid) {
		Connection conn = getConnection();
				
		Product p = null;
		
		p = new AdminDao().selectProduct(conn, pid);
		
		if(p == null) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);		
		
		return p;
	}

	public ArrayList<Pro_Attachment> selectPro_Attachment(String pid) {
		Connection conn = getConnection();		
		ArrayList<Pro_Attachment> list = new AdminDao().selectPro_Attachment(conn, pid);
		
		close(conn);
		return list;
	}

	public int updateProduct(Product p, Pro_Attachment at) {
		Connection conn = getConnection();
		
		int result1 = new AdminDao().updateProduct(conn, p);
		
		int result2 = 1;
		if(at != null) {
			if(at.getP_id() != null) {
				result2 = new AdminDao().updatePro_Attachment(conn, at);
			}else {
				result2 = new AdminDao().insertNewPro_Attachment(conn, at , p);
			}
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result1 * result2;
	}

	public int deleteProduct(String pId) {
		Connection conn = getConnection();
		
		int result1 = new AdminDao().deleteProduct(conn, pId); 
		
		int result2 = new AdminDao().deleteProAttachment(conn, pId);
				
		if(result1*result2 > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2;
	}

	public int getInvenCount() {
		Connection conn = getConnection();
		
		int InvenCount = new AdminDao().getInvenCount(conn);
				
		close(conn);
		return InvenCount;
	}

	public ArrayList<Pro_Detail> selectInvenList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Pro_Detail> list = new AdminDao().selectInvenList(conn, pi);		
		
		close(conn);
		return list;
	}

	public int insertInventory(Pro_Detail pd) {
		Connection conn = getConnection();		
		
		int result = new AdminDao().insertInventoryList(conn, pd);		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdminDao().selectMemberList(conn, pi);		
		
		close(conn);
		return list;
	}

	public int getMemberCount() {
		Connection conn = getConnection();
		
		int ProCount = new AdminDao().getMemberCount(conn);
				
		close(conn);
		return ProCount;
	}

	public int deleteMember(String userNo) {
		Connection conn = getConnection();
		
		int result = new AdminDao().deleteMember(conn, userNo); 		
				
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	 

	

}
