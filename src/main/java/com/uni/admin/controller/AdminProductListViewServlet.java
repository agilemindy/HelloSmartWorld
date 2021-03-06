package com.uni.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.PageInfo;
import com.uni.admin.model.vo.Product;

/**
 * Servlet implementation class AdminProductListView
 */
@WebServlet("/adminProductListView.do")
public class AdminProductListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징 처리
		
				int proCount;   	// 총 제품 갯수
				int currentPage; 	// 현재페이지 (요청한 페이지)
				int startPage; 		// 현재 페이지 하단에 보여지는 페이징바의 시작수
				int endPage; 		// 현재 페이지 하단에 보여지는 페이징바의 끝수
				int maxPage; 		// 전체 페이지의 가장 마지막 페이지
				
				int pageLimit;		// 한페이지 하단에 보여질 페이지 최대갯수
				int boardLimit; 	// 한페이지에 보여질 게시글 최대갯수
				
				//총 제품 갯수
				proCount = new AdminService().getListCount();
								
				//현재페이지
				currentPage = 1;
				
				//페이지 전환시 전달받은 페이지가 있을경우 전달받은 페이지를 currentPage 에 담기
				if(request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				//페이지 최대갯수
				pageLimit = 10;
				
				//게시글 최대갯수
				boardLimit = 10;
				
				// * maxPage : 총 페이지 수
				/*
				 * ex) boardLimit : 10 이라는 가정 하에
				 * 
				 * 총갯수   / boardLimit
				 * 100.0 / 10 = 10.0 = 10.0		=> 10페이지
				 * 101.0 / 10 = 10.1 = 11.0		=> 11페이지
				 * 105.0 / 10 = 10.5 = 11.0		=> 11페이지
				 * 109.0 / 10 = 10.9 = 11.0		=> 11페이지
				 * 
				 * 총게시글갯수(실수)/boardLimit의 값을 올림한 값!
				 */

				maxPage = (int)Math.ceil((double)proCount/boardLimit);
				
				
				// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
				/*
				 * ex) pageLimit : 10
				 * 1, 11, 21, 31, ...			=> n * 10 + 1
				 * 
				 * currentPage = 1				=> 0 * 10 + 1
				 * currentPage = 5				=> 0 * 10 + 1
				 * currentPage = 10				=> 0 * 10 + 1
				 * 
				 * currentPage = 11				=> 1 * 10 + 1
				 * currentPage = 12				=> 1 * 10 + 1
				 * currentPage = 20				=> 1 * 10 + 1
				 * 
				 * currentPage = 1~10			=> n=0
				 * currentPage = 11~20			=> n=1
				 * 
				 * 								   n = (currentPage - 1) / pageLimit
				 */
				
				startPage = ( currentPage - 1 ) / pageLimit * pageLimit + 1;
				
				// * endPage : 현재 페이지에 보여지는 페이징 바의 끝 수
				// startPage : 1	=> endPage : 10
				// startPage : 11	=> endPage : 20

				endPage = startPage + pageLimit - 1;
				
				// 단 , 예를 들어 maxPage 가 13이면 endPage 도 13
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(proCount, currentPage, startPage, endPage, maxPage, pageLimit, boardLimit);
				
				ArrayList<Product> list = new AdminService().selectList(pi); // 제품관리에 출력할 제품정보들 가져오기
				
				request.setAttribute("list", list);
				request.setAttribute("pi", pi);
				
				request.getRequestDispatcher("views/admin/adminProductListView.jsp").forward(request, response);
			}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
