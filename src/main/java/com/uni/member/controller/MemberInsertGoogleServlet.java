package com.uni.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/insertMembergoogle.do")
public class MemberInsertGoogleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertGoogleServlet() {
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
		String tel = request.getParameter("tel")!=null ? request.getParameter("tel") : "";
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String addressDet = request.getParameter("addressDet");
		String email = request.getParameter("email");
		
		Member mem = new Member(userId, userPwd, userName, address, addressDet, tel, phone, email);
		System.out.println("멤버인서트서블릿 : " + mem);
		
		int result = new MemberService().insertMember(mem);
		
		PrintWriter out = response.getWriter();
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
