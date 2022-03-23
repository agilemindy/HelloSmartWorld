package com.uni.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.common.MyFileRenamePolicy;
import com.uni.review.model.service.ReviewService;
import com.uni.review.model.vo.Attachment;
import com.uni.review.model.vo.Review;

/**
 * Servlet implementation class insertReviewServlet
 */
@WebServlet("/insertReview.do")
public class insertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024; //10메가바이트
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			String savePath = resources + "\\review_upfiles\\"; //파일을 실제로 저장하는 곳 
			System.out.println("savePath : " + savePath);
			
			//MultipartRequest 객체 생성
			//DefaultFileRenamePolicy : cos.jar에서 제공하는 메소드. 우리는 따로 클래스 만들어서 사용 : MyFileRenamePolicy
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Review r = new Review();			
			int writer = Integer.parseInt(multiRequest.getParameter("writer"));
			String subject = multiRequest.getParameter("subject");
			String product = multiRequest.getParameter("product");
			String content = multiRequest.getParameter("content");
			int star = Integer.parseInt(multiRequest.getParameter("star"));
			
			r.setReviewWriter(writer);
			r.setReviewTitle(subject);
			r.setProductId(product);			
			r.setReviewContent(content);
			r.setStar(star);
			
			ArrayList<Attachment> fileList = new ArrayList<>();
			
			for(int i = 1; i <= 1; i++) { //파일의 최대 개수 1개인데..
				String name = "file"+i;
				if(multiRequest.getOriginalFileName(name) != null) {
					String originName = multiRequest.getOriginalFileName(name);
					String changeName = multiRequest.getFilesystemName(name);
					
					System.out.println("originName : " + originName);
					System.out.println("changeName : " + changeName);
					
					Attachment at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(originName);
					at.setChangeName(changeName);
					
					fileList.add(at);
				}
			}
			
			int result = new ReviewService().insertReview(r, fileList);
			
			if(result > 0) {
				response.sendRedirect("reviewList.do");
			}else {
				for(int i = 0; i < fileList.size(); i++) {
					File failedFile = new File(savePath + fileList.get(i).getChangeName());
					failedFile.delete();
				}
				
				request.setAttribute("msg", "리뷰 게시물 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
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
