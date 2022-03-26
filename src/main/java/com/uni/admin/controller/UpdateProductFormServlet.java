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
 * Servlet implementation class UpdateProductFormServlet
 */
@WebServlet("/updateFormProduct.do")
public class UpdateProductFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pId = request.getParameter("pId"); // 제품아이디
		
		Product p = new AdminService().selectProduct(pId); // 제품 상세정보
		ArrayList<Pro_Attachment> fileList = new AdminService().selectPro_Attachment(pId); // 제품사진
		
		String view = "";
		if(p != null) {
			request.setAttribute("p", p);
			request.setAttribute("fileList", fileList);
			
			view = "views/admin/updateProduct.jsp";
		}else {
			request.setAttribute("msg", "수정할 제품을 불러오는데 실패했습니다.");
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
