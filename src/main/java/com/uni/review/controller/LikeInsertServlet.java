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
		//int like = Integer.parseInt(request.getParameter("like"));
		
		System.out.println("서블렛 잘왔나 확인(rId) : " + rId);
		//System.out.println("서블렛 잘왔나 확인(like) : " + like);
		
				
		int result = new ReviewService().insertLike(rId);
		
		System.out.println("서블릿 리절트값 :"+ result);
		PrintWriter out = response.getWriter();
		
		
		int like= new ReviewService().selectLike(rId);

		System.out.println("LikeInsertServlet의 like 개수:"+ like);
		
	
		//JSONObject obj = new JSONObject();
		//obj.put("like",like);
		//response.setContentType("application/x-json; charset=UTF-8");
		//response.getWriter().print(obj);
		
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
