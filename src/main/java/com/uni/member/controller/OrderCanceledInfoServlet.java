package com.uni.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;
import com.uni.member.model.vo.PageInfo;
import com.uni.order.model.vo.Order;

/**
 * Servlet implementation class OrderCanceledInfoServlet
 */
@WebServlet("/canceledOrderInfo.do")
public class OrderCanceledInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderCanceledInfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member m = (Member) request.getSession().getAttribute("loginUser");
		//로그인이 되어있을 때만 접근 가능하도록 함
		if (m != null) {
			int userNo = m.getUserNo();

			// 페이징 처리
			int listCount; // 총 게시글 개수
			int currentPage; // 현재 페이지(요청한 페이지)
			int startPage; // 현재 페이지 하단에 보여지는 페이징 바의 시작 수
			int endPage; // 현재 페이지 하단에 보여지는 페이징 바의 마지막 수
			int maxPage; // 전체 페이지의 가장 마지막 페이지

			int pageLimit; // 한 페이지 하단에 보여질 페이지 최대 개수
			int boardLimit; // 한 페이지에 보여질 게시글 최대 개수

			// userNo의 주문내역 중 상태가 N인 주문내역 개수 알아오기
			listCount = new MemberService().getCListCount(userNo);

			// 현재 페이지
			currentPage = 1;
			// 페이지 전환시 전달받은 페이지가 있을 경우 전달받은 페이지를 currentPage에 담기
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			// 최대 페이지 개수
			pageLimit = 10;
			// 최대 게시글 개수
			boardLimit = 4;

			maxPage = (int) Math.ceil((double) listCount / boardLimit);

			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

			endPage = startPage + pageLimit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			PageInfo pi = new PageInfo(listCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);

			//userNo의 주문내역 중 상태가 N인 주문내역 가져오기
			ArrayList<Order> order = new MemberService().orderCanceledInfo(pi, userNo);
			
			request.setAttribute("pi", pi);
			request.setAttribute("order", order);

			request.getRequestDispatcher("views/member/orderCanceledInfo.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "로그인 후에 이용해주세요.");
			request.getRequestDispatcher("views/member/memberLogin.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
