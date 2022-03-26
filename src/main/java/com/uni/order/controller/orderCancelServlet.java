package com.uni.order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.order.model.service.OrderService;

/**
 * Servlet implementation class orderCancelServlet
 */
@WebServlet("/orderCancel.do")
public class orderCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderCancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderNo = Integer.parseInt( request.getParameter("orderNo"));
		
		int result = new OrderService().orderCancel(orderNo);
	
		if(result > 0) {

			request.getSession().setAttribute("msg", "주문이 정상적으로 취소되었습니다. 취소내역은 마이페이지에서 확인가능합니다.");
			
			response.sendRedirect("orderInfo.do");
			
		}else {
			
			request.setAttribute("msg", "죄송합니다. 재고가 없어 구매할 수 없습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/orderInfo.do");
			view.forward(request, response);
			
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
