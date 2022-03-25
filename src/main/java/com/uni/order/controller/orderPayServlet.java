package com.uni.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String pId =  request.getParameter("pId");
		String addrName = request.getParameter("addrName");
		String addrPhone =  request.getParameter("addrPhone");
		String addrAddress = request.getParameter("addrAddress");
		String addrAddressDet = request.getParameter("addrAddressDet");
		String comment = request.getParameter("comment") != "" ? request.getParameter("comment") : "요청사항 없음";
		String payCode =request.getParameter("paymentMethod");
		String price = request.getParameter("price");
		String userNo = request.getParameter("userNo");
		
		request.setAttribute(pId, pId);
		request.setAttribute(addrName, addrName);
		request.setAttribute(addrPhone, addrPhone);
		request.setAttribute(addrAddress, addrAddress);
		request.setAttribute(addrAddressDet, addrAddressDet);
		request.setAttribute(comment, comment);
		request.setAttribute(payCode, payCode);
		request.setAttribute(price, price);
		request.setAttribute(userNo, userNo);
	
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
