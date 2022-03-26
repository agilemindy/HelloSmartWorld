package com.uni.admin.controller;

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
import com.uni.admin.model.service.AdminService;
import com.uni.admin.model.vo.Pro_Attachment;
import com.uni.admin.model.vo.Product;
import com.uni.common.MyFileRenamePolicy;
/**
 * Servlet implementation class InsertProductServlet
 */
@WebServlet("/insertProduct.do")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductServlet() {
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
			
			Product p = new Product(); // 제품객체에 값 불러와 담기
			
			String p_id = multiRequest.getParameter("P_ID");
			String p_name = multiRequest.getParameter("P_NAME");
			String brand = multiRequest.getParameter("BRAND");
			String color = multiRequest.getParameter("COLOR");
			String capacity = multiRequest.getParameter("CAPACITY");
			int price = Integer.parseInt(multiRequest.getParameter("PRICE"));
			String p_status = multiRequest.getParameter("P_STATUS");
			
			
			p.setP_id(p_id);
			p.setP_name(p_name);
			p.setBrand(brand);
			p.setColor(color);
			p.setCapacity(capacity);
			p.setPrice(price);
			p.setP_status(p_status);
			
			
			
			ArrayList<Pro_Attachment> fileList = new ArrayList<>(); // 제품사진 저장할 fileList
			
			for(int i = 1; i <= 4; i++) { 
				String name = "file"+i;
				
				if(multiRequest.getOriginalFileName(name) != null) {
					
					String originName = multiRequest.getOriginalFileName(name);
					String changeName = multiRequest.getFilesystemName(name);
					
					System.out.println(originName);
					System.out.println(changeName);
					
					Pro_Attachment at = new Pro_Attachment();
					at.setFile_path(savePath);
					at.setP_id(p_id);
					at.setOrigin_name(originName);
					at.setChange_name(changeName);
					
					fileList.add(at);
				}
			}
			
			
			int result = new AdminService().insertProduct(p, fileList);
			
			if(result > 0) {
				response.sendRedirect("adminProductListView.do");
			}else {
				for(int i = 0; i < fileList.size(); i++) {
					File failedFile = new File(savePath + fileList.get(i).getChange_name());
					failedFile.delete();
					
				}
				
				request.setAttribute("msg", "제품등록실패");
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
