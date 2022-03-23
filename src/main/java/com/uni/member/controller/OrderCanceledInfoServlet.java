package com.uni.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;
import com.uni.order.model.vo.Order;

/**
 * Servlet implementation class OrderCanceledInfoServlet
 */
@WebServlet("/canceledOrderInfo.do")
public class OrderCanceledInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCanceledInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = m.getUserNo();
		
		System.out.println(userNo);
		
		ArrayList<Order> order = new MemberService().orderCanceledInfo(userNo);	
		
		request.setAttribute("order", order);
		
		request.getRequestDispatcher("views/member/orderCanceledInfo.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
