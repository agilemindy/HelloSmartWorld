package com.uni.review.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.uni.review.model.service.ReviewService;
import com.uni.review.model.vo.Review;

/**
 * Servlet implementation class LikeInsertServlet
 */
@WebServlet("/likeInsert.do")
public class LikeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int rId = Integer.parseInt(request.getParameter("rId"));				
		int result = new ReviewService().insertLike(rId);		
		
		PrintWriter out = response.getWriter();		
		
		int like= new ReviewService().selectLike(rId);
		System.out.println("LikeInsertServlet의 like 개수:"+ like);
		

		if(result > 0) {			
			out.print(like);		

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
