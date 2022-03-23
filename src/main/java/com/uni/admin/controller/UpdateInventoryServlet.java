package com.uni.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.Pro_Detail;
import com.uni.admin.model.vo.Product;

/**
 * Servlet implementation class UpdateInventoryServlet
 */
@WebServlet("/updateInventory.do")
public class UpdateInventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInventoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");		
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
				
		
		Pro_Detail pd = new Pro_Detail();
		pd.setP_no(pNo);
		pd.setAmount(Integer.parseInt(request.getParameter("AMOUNT")));
		
		int result = new AdminService().updateInventory(pd);		
		
		if(result > 0) {					
			response.sendRedirect("inventoryManagementListView.do");
		}else {
			request.setAttribute("msg", "재고 수정 실패!");
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
