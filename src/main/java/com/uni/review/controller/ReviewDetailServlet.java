package com.uni.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;
import com.uni.review.model.service.ReviewService;
import com.uni.review.model.vo.Attachment;
import com.uni.review.model.vo.Review;

/**
 * Servlet implementation class ReviewDetailServlet
 */
@WebServlet("/detailReview.do")
public class ReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		//request.getRequestDispatcher("views/review/reviewDetailView.jsp").forward(request, response);
		
		int rId = Integer.parseInt(request.getParameter("rId"));
		Review r = new ReviewService().selectReview(rId);
		//String rw = request.getParameter("rw");
		//Member m = new MemberService().selectMember(rw);
		ArrayList<Attachment> fileList = new ReviewService().selectAttachment(rId);
		
		if(r != null) {
			request.setAttribute("r", r);
			request.setAttribute("fileList", fileList);
			//request.setAttribute("m", m);
			request.getRequestDispatcher("views/review/reviewDetailView.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "사진 게시글 상세 조회에 실패했습니다.");
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
