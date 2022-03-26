package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insertMember.do")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		//일반전화는 선택사항이기 때문에 값이 없으면 공백처리함
		String tel = request.getParameter("tel")!=null ? request.getParameter("tel") : "";
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String addressDet = request.getParameter("addressDet");
		String email = request.getParameter("email");
		
		Member mem = new Member(userId, userPwd, userName, address, addressDet, tel, phone, email);
		
		int result = new MemberService().insertMember(mem);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("msg", "헬로우! 스마트 월드에 오신 것을 환영합니다.");
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg", "회원가입을 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
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
