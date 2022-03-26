package com.uni.order.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uni.order.model.vo.Order;

/**
 * Servlet implementation class orderPayServlet
 */
@WebServlet("/orderPay.do")
public class orderPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		//orderForm.jsp에서 값을 받아 변수에 저장 
		String pId =  request.getParameter("pId");
		String addrName = request.getParameter("addrName");
		String addrPhone =  request.getParameter("addrPhone");
		String addrAddress = request.getParameter("addrAddress");
		String addrAddressDet = request.getParameter("addrAddressDet");
		String comment = request.getParameter("comment") != "" ? request.getParameter("comment") : "요청사항 없음";
		int payCode = Integer.parseInt(request.getParameter("paymentMethod"));
		int price = Integer.parseInt(request.getParameter("price"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));

		//orderNo은 임의로 값 초기화. amount는 현재 수량이 1이여서 1로 초기화함
		int orderNo = 0;
		int amount = 1;
		
		Order order = new Order(orderNo, userNo, pId, amount, addrName, addrPhone, addrAddress, addrAddressDet, comment, payCode, price);
		
		//order은 결제 내내 쓰일 거여서 세션에 값 저장
		HttpSession hs = request.getSession();
		hs.setAttribute("order", order);
	
		request.getRequestDispatcher("views/order/orderPay.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
