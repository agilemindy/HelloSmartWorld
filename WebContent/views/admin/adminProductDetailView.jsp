<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*"%>
<%
	Product p = (Product)request.getAttribute("p");	
	ArrayList<Pro_Attachment> fileList = (ArrayList<Pro_Attachment>)request.getAttribute("fileList");
		
	//Pro_Attachment titleImg = fileList.get(0);	
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
	.outer{
		width:100%;
		height:850px;
		background:black;
		color:white;
		margin:auto;
		margin-top:50px;
		margin-bottom: 50px;
	}
	
	#insertForm>table{
		border:1px solid white;
		text-align:center;
		width:650px;
		height:500px;
		
       
	}
	
	#insertForm>table input, #insertForm>table textarea{
		width:100%;
		box-sizing:border-box;
	}
	
	.button{
		border-radius: 15px;
		border: 3px solid white;
		background: black;
		color: white;
	}
</style>
</head>
<body>

	<%@ include file = "adminMenubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center">등록제품 상세보기</h2>
		<br>
		
		<form id="insertForm" action="<%= contextPath %>/?" method="post" enctype="multipart/form-data">
			<table align="center">
                <tr>
					<th>제품대표<br>이미지</th>
					<td colspan="3">						
                        <div id="fileArea">
                        <% if(fileList.size() != 0){ %>
                            <img width="250px" height="250px" id="titleImg" src="<%= contextPath %>/resources/product_upfiles/<%= fileList.get(0).getChange_name() %>">				
                       <% }else{ %>
                       		<img width="250px" height="250px" id="titleImg" src="<%= contextPath %>/resources/product_upfiles/noImg.png">
					   <% } %>
                        </div>
					</td>
				</tr>
				<tr>
					<th width="100">제품아이디</th>
					<td width="500">
						<%= p.getP_id() %>
					</td>
				</tr>
				<tr>
					<th>제품명</th>
					<td><%= p.getP_name() %></td>
				</tr>
                <tr>
					<th>제조사</th>
					<td><%= p.getBrand() %></td>
				</tr>
                <tr>
					<th>색상</th>
					<td><%= p.getColor() %></td>
				</tr>
                <tr>
					<th>용량</th>
					<td><%= p.getCapacity() %></td>
				</tr>
                <tr>
					<th>가격</th>
					<td><%= p.getPrice() %></td>
				</tr>
                <tr>
					<th>판매상태</th>
					<td>
                        <%= p.getP_status() %>
                    </td>
				</tr>
                <tr>
					<th>현재수량</th>
					<td><%= p.getP_stock() %></td>
				</tr>
				
			</table>            
			
			<br>

			<br>			
			
			<div class="btns" align="center">
				<button type="button" onclick="updateForm();" class="button" style="margin-right: 30px;">수정하기</button>
				<button type="button" onclick="deleteProduct();" class="button">삭제하기</button>
			</div>
		</form>
		
		<form action="" id="postForm" method="post">
				<input type="hidden" name="pId" value=<%= p.getP_id() %>>
		</form>
		<script type="text/javascript">
			function updateForm(){
				$("#postForm").attr("action", "<%=contextPath%>/updateFormProduct.do");
				$("#postForm").submit();
			}
			
			function deleteProduct(){
				$("#postForm").attr("action", "<%=contextPath%>/deleteProduct.do");
				$("#postForm").submit();
			}
		</script>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>
