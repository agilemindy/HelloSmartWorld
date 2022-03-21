package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class MemberInfoServlet
 */
@WebServlet("/memberInfo.do")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(loginUser != null) {
		
			String userId = loginUser.getUserId();
			
			Member member = new MemberService().selectMember(userId);
			
			System.out.println("MemberInfoServlet에서 출력: " + member);
			
			RequestDispatcher view = null;
			
			if(member != null) {
				request.setAttribute("loginUser", member);
				view = request.getRequestDispatcher("views/member/memberInfo.jsp");
			}else {
				request.setAttribute("msg", "조회에 실패했습니다.");
				view = request.getRequestDispatcher("views/common/errorPage.jsp");
			}
			view.forward(request, response);
		
		}else {
			request.setAttribute("msg", "로그인 후에 이용해주세요.");
			request.getRequestDispatcher("views/member/memberLogin.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
