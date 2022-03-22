package com.uni.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.admin.model.vo.Product;

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
		
		String brand = request.getParameter("brand");
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String capacity = request.getParameter("capacity");
		String price = request.getParameter("price");
		String pId = request.getParameter("pId");
		
		request.setAttribute("brand", brand);
		request.setAttribute("name", name);
		request.setAttribute("color", color);
		request.setAttribute("capacity", capacity);
		request.setAttribute("price", price);
		request.setAttribute("pId", pId);
		
		request.getRequestDispatcher("views/order/orderForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
