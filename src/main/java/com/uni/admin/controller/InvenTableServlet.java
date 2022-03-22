package com.uni.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.Product;

/**
 * Servlet implementation class InvenTableServlet
 */
@WebServlet("/inventorySelect.do")
public class InvenTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InvenTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Product> list = new AdminService().selectList();
		
		String keyword = request.getParameter("keyword");
		
		JSONArray jArr = new JSONArray();
		JSONObject jsonUser = null;
		
		for(Product p : list) {
			if(p.getP_id().contains(keyword)) {
				jsonUser = new JSONObject();
				
				jsonUser.put("p_name", p.getP_name());
				jsonUser.put("brand", p.getBrand());
				jsonUser.put("color", p.getColor());
				jsonUser.put("capacity", p.getCapacity());
				jsonUser.put("price", p.getPrice());
				
				jArr.add(jsonUser);
			}
		}
		
		JSONObject jsonMap = null;
		
		if(keyword != null && jArr != null) {
			jsonMap = new JSONObject();
			
			jsonMap.put("jArr", jArr);
			jsonMap.put("keyword", keyword);
		}
		
		response.setContentType("application/json; charset = utf-8");
		response.getWriter().print(jsonMap);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
