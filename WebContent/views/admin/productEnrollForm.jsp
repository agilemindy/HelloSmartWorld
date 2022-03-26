<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.uni.admin.model.vo.*" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품등록 | HELLO SMART WORLD</title>
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/maru-buri.css" rel="stylesheet">
<style>
	.outer{
		font-family: 'MaruBuri';
		width:100%;
		height:1000px;
		background:black;
		color:white;
		margin:auto;
		padding-bottom: 20px;
	}
	
	#insertForm>table{
		border:1px solid white;
		text-align:center;
		width:650px;
		height:500px;
		
       
	}
	
	#insertForm>table input, #insertForm>table textarea{
		width:90%;
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
		
		<h2 align="center">제품등록</h2>
		<br>
		
		<form id="insertForm" action="<%= contextPath %>/insertProduct.do" method="post" enctype="multipart/form-data">
			<table align="center">
                <tr><!-- 제품이미지첨부 -->
					<th>제품대표<br>이미지</th>
					<td colspan="3">
						<img id="titleImg" width="150" height="120">
                        <div id="fileArea">
                            <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">				
                        </div>
					</td>
				</tr>
				<tr><!-- 제품아이디 -->
					<th width="100">제품아이디</th>
					<td width="500">
						<input type="text" name="P_ID" required>
					</td>
				</tr>
				<tr><!-- 제품명 -->
					<th>제품명</th>
					<td><input type="text" name="P_NAME" required></td>
				</tr>
                <tr><!-- 제조사 -->
					<th>제조사</th>
					<td><input type="text" name="BRAND" required></td>
				</tr>
                <tr><!-- 색상 -->
					<th>색상</th>
					<td><input type="text" name="COLOR" required></td>
				</tr>
                <tr><!-- 용량 -->
					<th>용량</th>
					<td><input type="text" name="CAPACITY" required></td>
				</tr>
                <tr><!-- 가격 -->
					<th>가격</th>
					<td><input type="text" name="PRICE" required></td>
				</tr>
                
				
			</table>            
			
			<br>

			<br>
			
			<div class="btns" align="center">
				<!-- 취소하기 : 한페이지 뒤로 -->
				<button type="reset" class="button" style="margin-right: 30px;" OnClick="javascript:history.back(-1)">취소하기</button>
				<!-- 등록하기 : form 전송 -->
				<button type="submit" class="button">등록하기</button>
			</div>
		</form>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>
<script>
	$(function(){		// 이미지첨부칸을 누르면 파일선택 눌러지도록
		
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