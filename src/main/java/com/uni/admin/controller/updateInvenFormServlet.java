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
import com.uni.admin.model.vo.Pro_Detail;

/**
 * Servlet implementation class updateInvenFormServlet
 */
@WebServlet("/updateInvenForm.do")
public class updateInvenFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateInvenFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pNo = request.getParameter("pNo"); // 재고관리에서 재고번호
		
		Pro_Detail pd = new AdminService().selectInventory(pNo); // 선택한 재고번호의 재고 상세내역		
		
		String view = "";
		if(pd != null) {
			request.setAttribute("pd", pd);			
			
			view = "views/admin/updateInventory.jsp";
		}else {
			request.setAttribute("msg", "수정할 재고를 불러오는데 실패했습니다.");
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
