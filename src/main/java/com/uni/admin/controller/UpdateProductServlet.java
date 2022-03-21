package com.uni.admin.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.Pro_Attachment;
import com.uni.admin.model.vo.Product;
import com.uni.common.MyFileRenamePolicy;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/updateProduct.do")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources");
			
			String savePath = resources + "\\product_upfiles\\";
			
			System.out.println("savePath" + savePath);
			
			//MultipartRequest 객체 생성			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String pId = multiRequest.getParameter("pId");
			
			Product p = new Product();
			p.setP_id(multiRequest.getParameter("P_ID"));
			p.setP_name(multiRequest.getParameter("P_NAME"));
			p.setBrand(multiRequest.getParameter("BRAND"));
			p.setColor(multiRequest.getParameter("COLOR"));
			p.setCapacity(multiRequest.getParameter("CAPACITY"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("PRICE")));
			p.setP_status(multiRequest.getParameter("P_STATUS"));
			
			
			Pro_Attachment at = null;
			
			if(multiRequest.getOriginalFileName("file1") != null) { // 바꿀 사진이 있다면!
				
				String originName = multiRequest.getOriginalFileName("file1");
				String changeName = multiRequest.getFilesystemName("file1");
				
				System.out.println(originName);
				System.out.println(changeName);
				
				at = new Pro_Attachment();
				at.setFile_path(savePath);
				at.setOrigin_name(originName);
				at.setChange_name(changeName);
				
				if(multiRequest.getParameter("originFile") != null) {
					File deleteFile = new File(savePath + multiRequest.getParameter("originFile"));
					System.out.println("deleteFile : " + deleteFile);
					System.out.println("deleteFile savePath : " + savePath + multiRequest.getParameter("originFile"));
					
					deleteFile.delete();
					
					at.setP_id(multiRequest.getParameter("originFileId"));					
				}else {
					at.setP_id(pId);
				}
			}
			
			int result = new AdminService().updateProduct(p, at);
			pId = p.getP_id();
			if(result > 0) {					
				response.sendRedirect("adminProDetailViewServlet.do?pId="+pId);
			}else {
				request.setAttribute("msg", "제품 수정 실패!");
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
