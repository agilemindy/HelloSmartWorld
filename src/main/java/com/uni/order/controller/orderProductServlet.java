package com.uni.order.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.order.model.vo.Order;

/**
 * Servlet implementation class orderProductServlet
 */
@WebServlet("/orderProduct.do")
public class orderProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String pId = request.getParameter("pId");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String addrName = request.getParameter("addrName");
		String addrPhone = request.getParameter("addrPhone");
		String shippingAddress = request.getParameter("shippingAddress");
		String shippingAddressDet = request.getParameter("shippingAddressDet");
		Date orderDate = null;
		int payCode = Integer.parseInt(request.getParameter("payCode"));

		Order order = new Order(userNo, pId, amount, addrName, addrPhone, shippingAddress, shippingAddressDet, orderDate, payCode);		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
