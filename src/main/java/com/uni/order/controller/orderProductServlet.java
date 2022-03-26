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
		
		Order order = (Order)request.getSession().getAttribute("order");
		
		//DB에 주문내역 인서트
		int result = new OrderService().orderProduct(order);
		//오더번호 가져오기
		order.setOrderNo(new OrderService().orderNumCheck(order)); 
		
		request.getSession().setAttribute("order", order);
		
		// BY민지, 주문완료시 재고테이블에 출고로 삽입
		int result2 = new OrderService().afterOrderPro_Detail(order);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("success");
		}else {
			out.print("fail");
		}
		
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
