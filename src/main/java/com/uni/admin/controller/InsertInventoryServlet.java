package com.uni.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.Pro_Detail;

/**
 * Servlet implementation class InsertInventoryServlet
 */
@WebServlet("/insertInventory.do")
public class InsertInventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInventoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Pro_Detail pd = new Pro_Detail();
		
		String p_id = request.getParameter("P_ID");
		String status = request.getParameter("status");
		String amount = request.getParameter("amount");
		

		
		
		System.out.println("servlet p_id : " + p_id);
		System.out.println("servlet amount : " + amount);
		
		
		pd.setP_id(p_id);
		pd.setStatus(status);
		pd.setAmount(Integer.parseInt(amount));
		
		int result = new AdminService().insertInventory(pd);
		
		if(result > 0) {
			response.sendRedirect("inventoryManagementListView.do");
		}else {
			request.setAttribute("msg", "재고등록실패");
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
