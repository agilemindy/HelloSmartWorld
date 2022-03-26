package com.uni.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.admin.model.vo.Product;
import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class orderFormServlet
 */
@WebServlet("/orderForm.do")
public class orderFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		//로그인되어있으면 주문 페이지로 이동
		if(loginUser != null) {
		
			String price = request.getParameter("price");
			String pId = request.getParameter("pId");
			
			request.setAttribute("price", price);
			request.setAttribute("pId", pId);
			
			request.getRequestDispatcher("views/order/orderForm.jsp").forward(request, response);
		
		}else {//로그인되어있지 않으면 로그인 창으로 이동
			
			request.setAttribute("msg", "로그인 후에 이용해주세요.");
			request.getRequestDispatcher("views/member/memberLogin.jsp").forward(request, response);
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
