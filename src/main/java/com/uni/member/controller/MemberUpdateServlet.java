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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/updateMember.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String name = request.getParameter("userName");
		String address = request.getParameter("address");
		String addressDet = request.getParameter("addressDet");
		String tel = request.getParameter("tel");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String userPwd = request.getParameter("userPwd") == "" ? request.getParameter("originPwd") : request.getParameter("userPwd");
		
		System.out.println("멤버업뎃서블릿 출력: " + userId + name + address + tel + phone +email + userPwd );
		//System.out.println("멤버업뎃 유저패스값" + userPwd);
		
		Member mem = new Member(userId, userPwd, name, address, addressDet, tel, phone, email);
		
		Member member = new MemberService().updateMember(mem);	

		request.setAttribute("loginUser", member);
		
		//System.out.println("멤버업뎃서블릿 출력: " + member);
		
		if(member != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("msg", "회원정보를 수정했습니다.");
			request.getRequestDispatcher("views/member/memberInfo.jsp").forward(request, response);
			
		}else {
			
			request.setAttribute("msg", "회원정보 수정을 실패했습니다.");
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
