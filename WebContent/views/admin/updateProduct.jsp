<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.ArrayList, com.uni.admin.model.vo.*" %>
<%
	String contextPath = request.getContextPath();

	Product p = (Product)request.getAttribute("p");
	ArrayList<Pro_Attachment> fileList = (ArrayList<Pro_Attachment>)request.getAttribute("fileList");
	
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
		height:800px;
		background:black;
		color:white;
		margin:auto;
		margin-top:50px;
		margin-bottom: 50px;
	}
	
	#updateForm>table{
		border:1px solid white;
		text-align:center;
		width:650px;
		height:500px;
		
       
	}
	
	#updateForm>table input, #insertForm>table textarea{
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
		
		<h2 align="center">제품수정</h2>
		<br>
		
		<form id="updateForm" action="<%= contextPath %>/updateProduct.do" method="post" enctype="multipart/form-data">
			<table align="center">
                <tr>
					<th>제품대표<br>이미지</th>
					<td colspan="3">
						<% if(fileList.size() != 0){ %>
							<%= fileList.get(0).getOrigin_name() %>
							<input type='hidden' name='originFile' value='<%=fileList.get(0).getChange_name()%>'>
							<input type='hidden' name='originFileId' value='<%=fileList.get(0).getP_id()%>'>
							<img id="titleImg" width="150" height="120" src="<%= contextPath %>/resources/product_upfiles/<%= fileList.get(0).getChange_name() %>">
	                        <div id="fileArea">
	                            <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" >	                            	
	                        </div>
                        <% }else {%>
                        	<img id="titleImg" width="150" height="120">
	                        <div id="fileArea">
	                            <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">				
	                        </div>
                        <% } %>
					</td>
				</tr>
				<tr>
					<th width="100">제품아이디</th>
					<td width="500">
						<input type="text" name="P_ID" value="<%= p.getP_id() %>">
					</td>
				</tr>
				<tr>
					<th>제품명</th>
					<td><input type="text" name="P_NAME" value="<%= p.getP_name()%>"></td>
				</tr>
                <tr>
					<th>제조사</th>
					<td><input type="text" name="BRAND" value="<%= p.getBrand() %>"></td>
				</tr>
                <tr>
					<th>색상</th>
					<td><input type="text" name="COLOR" value="<%= p.getColor() %>"></td>
				</tr>
                <tr>
					<th>용량</th>
					<td><input type="text" name="CAPACITY" value="<%= p.getCapacity() %>"></td>
				</tr>
                <tr>
					<th>가격</th>
					<td><input type="text" name="PRICE" value="<%= p.getPrice() %>"></td>
				</tr>
                <tr>
					<th>판매상태</th>
					<td>					
					<% if(p.getP_status().equals("Y")){ %>			
                        <select name="P_STATUS">
                            <option value="Y" selected>판매중</option>
                            <option value="N">판매중지</option>                            
                        </select>   
                    <% } else {%>
                    	<select name="P_STATUS">
                            <option value="Y">판매중</option>
                            <option value="N" selected>판매중지</option>                            
                        </select>
                    <% } %>
                    
                                     
                    </td>
				</tr>
                
				
			</table>            
			
			<br>

			<br>
			
			<div class="btns" align="center">
				<button type="reset" class="button" style="margin-right: 30px" OnClick="javascript:history.back(-1)">취소하기</button>
				<button type="submit" class="button">수정하기</button>
			</div>
		</form>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>
<script>
	$(function(){		
		
		$("#titleImg").click(function(){
			$("#file1").click();
		});	
		
	});


	function loadImg(inputFile, num){
		if(inputFile.files.length == 1){
			var reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			
			reader.onload = function(e){ //https://developer.mozilla.org/ko/docs/Web/API/FileReader
				$("#titleImg").attr("src", e.target.result);
				}
			}
		}	
		
</script>