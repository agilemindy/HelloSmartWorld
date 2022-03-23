package com.uni.admin.model.dao;
import static com.uni.common.JDBCTemplate.*;

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

import com.uni.admin.model.vo.PageInfo;
import com.uni.admin.model.vo.Pro_Attachment;
import com.uni.admin.model.vo.Pro_Detail;
import com.uni.admin.model.vo.Product;
import com.uni.member.model.vo.Member;
import com.uni.order.model.vo.Order;
import com.uni.review.model.vo.Review;

public class AdminDao {
	
	private Properties prop = new Properties();
	public AdminDao() {
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
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
				
				/*list.add(new Product(rset.getString("P_ID"),
								   rset.getString("P_NAME"),
								   rset.getString("BRAND"),
								   rset.getString("COLOR"),
								   rset.getString("CAPACITY"),
								   rset.getInt("PRICE"),
								   rset.getString("P_STATUS"),
								   rset.getInt("P_STOCK")));*/
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
	
	public ArrayList<Product> selectList(Connection conn) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList2");		
		
		try {
			pstmt = conn.prepareStatement(sql);				
									
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

	public int insertProductList(Connection conn, Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p.getP_id());
			pstmt.setString(2, p.getP_name());
			pstmt.setString(3, p.getBrand());
			pstmt.setString(4, p.getColor());
			pstmt.setString(5, p.getCapacity());
			pstmt.setInt(6, p.getPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPro_Attachment(Connection conn, ArrayList<Pro_Attachment> fileList) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProAttachment");
		
try {
			
			for(int i = 0; i < fileList.size(); i++) {
				Pro_Attachment at = fileList.get(i);
				
				pstmt = conn.prepareStatement(sql);			
				pstmt.setString(1, at.getP_id());
				pstmt.setString(2, at.getOrigin_name());
				pstmt.setString(3, at.getChange_name());
				pstmt.setString(4, at.getFile_path());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public Product selectProduct(Connection conn, String pid) {
		Product p = null;								   
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			
			rset = pstmt.executeQuery();			
			
			if(rset.next()) {
				p = new Product();
				p.setP_id(rset.getString("P_ID"));
				p.setP_name(rset.getString("P_NAME"));
				p.setBrand(rset.getString("BRAND"));
				p.setColor(rset.getString("COLOR"));
				p.setCapacity(rset.getString("CAPACITY"));
				p.setPrice(rset.getInt("PRICE"));
				p.setP_status(rset.getString("P_STATUS"));
				p.setP_stock(rset.getInt("P_STOCK"));				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return p;
	}

	public ArrayList<Pro_Attachment> selectPro_Attachment(Connection conn, String pid) {
		ArrayList<Pro_Attachment> list = null;								   
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			
			rset = pstmt.executeQuery();			
			
			list = new ArrayList<>();
			while(rset.next()) {
				Pro_Attachment at = new Pro_Attachment();
				at.setP_id(rset.getString("P_ID"));
				at.setOrigin_name(rset.getString("ORIGIN_NAME"));
				at.setChange_name(rset.getString("CHANGE_NAME"));				
			
				list.add(at);
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

	public int updateProduct(Connection conn, Product p) {
		int result = 0;										
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getP_name());
			pstmt.setString(2, p.getBrand());
			pstmt.setString(3, p.getColor());
			pstmt.setString(4, p.getCapacity());			
			pstmt.setInt(5, p.getPrice());			
			pstmt.setString(6, p.getP_status());			
			pstmt.setString(7, p.getP_id());			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int updatePro_Attachment(Connection conn, Pro_Attachment at) {
		int result = 0;										
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getChange_name());
			pstmt.setString(2, at.getOrigin_name());
			pstmt.setString(3, at.getFile_path());
			pstmt.setString(4, at.getP_id());			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int insertNewPro_Attachment(Connection conn, Pro_Attachment at, Product p) {
		int result = 0;										
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);					
			
			pstmt.setString(1, p.getP_id());				
			pstmt.setString(2, at.getOrigin_name());
			pstmt.setString(3, at.getChange_name());
			pstmt.setString(4, at.getFile_path());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteProduct(Connection conn, String pId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteProAttachment(Connection conn, String pId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProAttachment");		
		try {			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return 1; // 사진이 없는 경우가 있어서... 임시로;
	}

	public int getInvenCount(Connection conn) {
		int InvenCount = 0;
		Statement stmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getInvenCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				InvenCount = rset.getInt(1);
			}						
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return InvenCount;
	}

	public ArrayList<Pro_Detail> selectInvenList(Connection conn, PageInfo pi) {
		ArrayList<Pro_Detail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInvenList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
									
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Pro_Detail pd = new Pro_Detail();
				pd.setP_no(rset.getInt("P_NO"));
				pd.setP_id(rset.getString("P_ID"));
				pd.setP_name(rset.getString("P_NAME"));
				pd.setBrand(rset.getString("BRAND"));
				pd.setColor(rset.getString("COLOR"));
				pd.setCapacity(rset.getString("CAPACITY"));
				pd.setPrice(rset.getInt("PRICE"));
				pd.setStatus(rset.getString("STATUS"));
				pd.setAmount(rset.getInt("AMOUNT"));
				pd.setDetail_date(rset.getDate("DETAIL_DATE"));			
				pd.setP_stock(rset.getInt("P_STOCK"));			
				
				list.add(pd);
				
				
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

	public int insertInventoryList(Connection conn, Pro_Detail pd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInventory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pd.getP_id());
			pstmt.setString(2, pd.getStatus());
			pstmt.setInt(3, pd.getAmount());	
			
			System.out.println("dao amount : " + pd.getAmount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> selectMemberList(Connection conn, PageInfo pi) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
									
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m = new Member();
				m.setUserNo(rset.getInt("USER_NO"));
				m.setUserId(rset.getString("USER_ID"));
				m.setUserPwd(rset.getString("USER_PWD"));
				m.setUserName(rset.getString("USER_NAME"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setAddressDet(rset.getString("ADDRESS_DETAIL"));
				m.setTel(rset.getString("TEL"));
				m.setPhone(rset.getString("PHONE"));
				m.setEmail(rset.getString("EMAIL"));				
				m.setEnrollDate(rset.getDate("ENROLL_DATE"));				
				m.setDelDate(rset.getDate("DEL_DATE"));				
				m.setStatus(rset.getString("STATUS"));				
				
				list.add(m);
				
				
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

	public int getMemberCount(Connection conn) {
		int ProCount = 0;
		Statement stmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getMemberCount");
		
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

	public int deleteMember(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int getSalesCount(Connection conn) {
		int ProCount = 0;
		Statement stmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getSalesCount");
		
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
	

	public ArrayList<Order> selectSalesList(Connection conn, PageInfo pi) {
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSalesList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
									
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order o = new Order();
				o.setOrderNo(rset.getInt("ORDER_NO"));
				o.setUserNo(rset.getInt("USER_NO"));
				o.setpId(rset.getString("P_ID"));
				o.setAmount(rset.getInt("AMOUNT"));
				o.setPrice(rset.getInt("PRICE"));
				o.setOrderDate(rset.getDate("ORDER_DATE"));
				
				
				list.add(o);
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

	public ArrayList<Order> selectSalesListSortAsc(Connection conn, PageInfo pi) {
		ArrayList<Order> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSalesListAsc");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
									
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Order o = new Order();
				o.setOrderNo(rset.getInt("ORDER_NO"));
				o.setUserNo(rset.getInt("USER_NO"));
				o.setpId(rset.getString("P_ID"));
				o.setAmount(rset.getInt("AMOUNT"));
				o.setPrice(rset.getInt("PRICE"));
				o.setOrderDate(rset.getDate("ORDER_DATE"));
				
				
				list.add(o);
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

	public int getReviewCount(Connection conn) {
		int ProCount = 0;
		Statement stmt = null;
		ResultSet rset = null;		
		
		String sql = prop.getProperty("getReviewCount");
		
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

	public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi) {
		ArrayList<Review> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
									
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setReviewNo(rset.getInt("REVIEW_NO"));
				r.setReviewWriter(rset.getInt("REVIEW_WRITER"));
				r.setProductId(rset.getString("PRODUCT_ID"));
				r.setStar(rset.getInt("RV_POINT"));
				r.setReviewTitle(rset.getString("RV_TITLE"));
				r.setReviewContent(rset.getString("RV_CONTENT"));
				r.setCreateDate(rset.getDate("RV_DATE"));
				r.setLike(rset.getInt("RV_LIKE"));
				r.setCount(rset.getInt("RV_VIEW"));
				
				
				list.add(r);
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

	public int deleteReview(Connection conn, int rNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public Pro_Detail selectInventory(Connection conn, String pNo) {
		Pro_Detail pd = null;								   
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInventory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pNo);
			
			rset = pstmt.executeQuery();			
			
			if(rset.next()) {
				pd = new Pro_Detail();
				pd.setP_no(rset.getInt("P_NO"));
				pd.setP_id(rset.getString("P_ID"));
				pd.setP_name(rset.getString("P_NAME"));
				pd.setBrand(rset.getString("BRAND"));
				pd.setColor(rset.getString("COLOR"));
				pd.setCapacity(rset.getString("CAPACITY"));
				pd.setPrice(rset.getInt("PRICE"));
				pd.setStatus(rset.getString("STATUS"));
				pd.setAmount(rset.getInt("AMOUNT"));
				pd.setDetail_date(rset.getDate("DETAIL_DATE"));
						
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return pd;
	}

	public int updateInventory(Connection conn, Pro_Detail pd) {
		int result = 0;										
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInventory");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pd.getAmount());
			pstmt.setInt(2, pd.getP_no());
					
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int deleteInventory(Connection conn, int pNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteInventory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pNo);
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

	

	

		
