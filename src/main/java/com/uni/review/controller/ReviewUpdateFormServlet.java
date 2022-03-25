package com.uni.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.Product;
import com.uni.review.model.service.ReviewService;
import com.uni.review.model.vo.Attachment;
import com.uni.review.model.vo.Review;

/**
 * Servlet implementation class ReviewUpdateFormServlet
 */
@WebServlet("/updateFormReview.do")
public class ReviewUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		Review r = new ReviewService().selectReview(rNo);
		//Attachment at = new ReviewService().selectAttachmentat(rNo);		
		ArrayList<Attachment> fileList = new ReviewService().selectAttachment(rNo);
		
		if(r != null) {
			request.setAttribute("r", r);
			request.setAttribute("fileList", fileList);
			request.getRequestDispatcher("views/review/reviewUpdateForm.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "수정할 게시글을 불러오는 데 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
