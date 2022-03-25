package com.uni.review.controller;

import java.io.File;
import java.io.IOException;
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
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/updateReview.do")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
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
			
			int rId = Integer.parseInt(multiRequest.getParameter("rId"));			
			Review r = new Review();			
			//int writer = Integer.parseInt(multiRequest.getParameter("writer"));
			String subject = multiRequest.getParameter("subject");
			String product = multiRequest.getParameter("product");
			String content = multiRequest.getParameter("content");
			int star = Integer.parseInt(multiRequest.getParameter("star"));
			
			//r.setReviewWriter(writer);
			r.setReviewTitle(subject);
			r.setProductId(product);			
			r.setReviewContent(content);
			r.setStar(star);
			r.setReviewNo(rId);

			
			Attachment at = null; //있을 수도 있고 없을 수도 있어서 null로 선언
			if(multiRequest.getOriginalFileName("file1") != null) {
				String originName = multiRequest.getOriginalFileName("file1");
				String changeName = multiRequest.getFilesystemName("file1");
			
				System.out.println(originName);
				System.out.println(changeName);
				
				at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originName);
				at.setChangeName(changeName);
				
				//기존에 있던 파일은 삭제하기
				if(multiRequest.getParameter("originFile") != null) {
					File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));
					System.out.println("deleteFile : " + deleteFile);
					System.out.println("deleteFile savePath : " + savePath + multiRequest.getParameter("originFile"));
					deleteFile.delete();
					
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
					at.setReviewNo(rId);
				}
			}

			int result = new ReviewService().updateReview(r,at);
			if(result > 0) {
				
				response.sendRedirect("detailReview.do?rId=" + rId);
				
			}else {
				request.setAttribute("msg", "게시글 수정에 실패했습니다.");
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
