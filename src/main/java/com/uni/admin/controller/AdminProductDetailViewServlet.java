package com.uni.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.Pro_Attachment;
import com.uni.admin.model.vo.Product;

/**
 * Servlet implementation class adminProductDetailView
 */
@WebServlet("/adminProDetailViewServlet.do")
public class AdminProductDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pId = request.getParameter("pId"); // AdminProductListView.jsp 에서 선택한 행의 제품아이디
		
		Product p = new AdminService().selectProduct(pId); // 위에서 선택한 제품 내용 가져오기
		
		ArrayList<Pro_Attachment> fileList = new AdminService().selectPro_Attachment(pId); // 제품아이디에 저장된 제품사진 가져오기
		
		String view = "";
		if(p != null) {
			request.setAttribute("p", p);
			request.setAttribute("fileList", fileList);
						
			view = "views/admin/adminProductDetailView.jsp";
			
		}else {
			request.setAttribute("msg", "제품 상세보기 실패");
			view = "views/common/errorPage.jsp";			
			
		}
		request.getRequestDispatcher(view).forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
