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

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/deleteProduct.do")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pId = request.getParameter("pId");
				
		int result = new AdminService().deleteProduct(pId);
		
				
		if(result > 0) {
			request.getSession().setAttribute("msg", "제품삭제완료!"); // 삭제성공 메세지가 안뜸.....
			response.sendRedirect("adminProductListView.do");			
		}else {
			request.setAttribute("msg", "제품삭제실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
      }
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
