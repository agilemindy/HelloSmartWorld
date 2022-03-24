package com.uni.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.order.model.service.OrderService;
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
		
		request.setCharacterEncoding("UTF-8");
		
		int orderNo = 0;
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String pId = request.getParameter("pId");
		int amount = 1;
		String addrName = request.getParameter("addrName");
		String addrPhone = request.getParameter("addrPhone");
		String addrAddress = request.getParameter("addrAddress");
		String addrAddressDet = request.getParameter("addrAddressDet");
		String comment = request.getParameter("comment") != "" ? request.getParameter("comment") : "요청사항 없음";
		int payCode = 101;
		int price = Integer.parseInt(request.getParameter("price"));
		
		Order order = new Order(orderNo, userNo, pId, amount, addrName, addrPhone, addrAddress, addrAddressDet, comment, payCode, price);
		//System.out.println(order);
		
		int result = new OrderService().orderProduct(order);
		order.setOrderNo(new OrderService().orderNumCheck(order)); //오더번호 가져오기
		request.getSession().setAttribute("order", order);
		
		// 주문완료시 재고테이블에 출고로 삽입
		int result2 = new OrderService().afterOrderPro_Detail(order);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("success");
		}else {
			out.print("fail");
		}
		
		out.flush();
		out.close();
		
//		if(result > 0) {
//
//			order.setOrderNo(new OrderService().orderNumCheck(order));
//			request.setAttribute("order", order);
//			
//			request.getRequestDispatcher("views/order/orderResult.jsp").forward(request, response);
//			
//		}else {
//			request.setAttribute("msg", "죄송합니다. 재고가 없어 구매할 수 없습니다.");
//			RequestDispatcher view = request.getRequestDispatcher("/productList.do");
//			view.forward(request, response);
//		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
