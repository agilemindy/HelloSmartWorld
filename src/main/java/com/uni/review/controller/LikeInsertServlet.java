package com.uni.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		/*
		BoardDAO bDao = BoardDAO.getInstance();
		Review r = new Review();
		
		r.getLike();
		
		bDao.update_Like(bno);
		
		
		int like=bDao.select_Like(bno);
		System.out.println("LikeUpdateAction.java의 like 개수:"+ like);
		
		
		JSONObject obj = new JSONObject();
		obj.put("like",like);
		
		//request.setAttribute("json", json); 
		
		 response.setContentType("application/x-json; charset=UTF-8");
		 response.getWriter().print(obj);
		
	*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
