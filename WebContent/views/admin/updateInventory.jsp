<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*"%>
<%
	String contextPath = request.getContextPath();

	Pro_Detail pd = (Pro_Detail)request.getAttribute("pd");

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>재고수정 | HELLO SMART WORLD</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>
        <link href="https://hangeul.pstatic.net/hangeul_static/css/maru-buri.css" rel="stylesheet">

<style>
	.outer{
		font-family: 'MaruBuri';
		width:100%;
		height:1000px;
		background:black;
		color:white;
		margin:auto;
		
	}
	
	#insertForm>table{
		border:1px solid white;
		text-align:center;
		width:650px;  
		height:400px;
		  
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
		
		<h2 align="center">재고수정</h2>
		<br>
		
		<form id="insertForm" action="<%= contextPath %>/updateInventory.do" method="post">
			<table align="center" id="table"> 
			 	<tr>
			 		<th>재고번호</th>
			 		<td value="<%= pd.getP_no() %>"><%= pd.getP_no() %></td>
			 		<input type="hidden" name="pNo" value="<%= pd.getP_no() %>">
			 	</tr>
				<tr>
					<th width="100">제품아이디</th>
					<td width="500" name="P_ID">		
						<%= pd.getP_id() %>																		
					</td>
				</tr>
				<tr>
					<th>제품명</th>
					<td name="P_NAME"><%= pd.getP_name() %></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td name="BRAND"><%= pd.getBrand() %></td>
				</tr>
				<tr>
					<th>색상</th>
					<td name="COLOR"><%= pd.getColor() %></td>
				</tr>
				<tr>
					<th>용량</th>
					<td name="CAPACITY"><%= pd.getCapacity() %></td>
				</tr>
				<tr>
					<th>가격</th>
					<td name="PRICE"><%= pd.getPrice() %></td>
				</tr>				
						
				<tr>
					<th>입출고</th>
					<td name="STATUS">
						<%= pd.getStatus() %>
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input style="width: 150px; text-align: center;" type="text" name="AMOUNT" value="<%= pd.getAmount() %>" required></td>
				</tr>
				<tr>
					<th>등록날짜</th>
					<td name="DATE"><%= pd.getDetail_date() %></td>
				</tr>									
								
			</table>            
			
			<br>

			<br>
			
			<div class="btns" align="center">
				<!-- 취소하기 : 한페이지 뒤로 -->
				<button type="reset" class="button" style="margin-right: 30px;" OnClick="javascript:history.back(-1)">취소하기</button>
				<!-- 수정하기 : form 전송 -->
				<button type="submit" class="button">수정하기</button>				
			</div>
		</form>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>
<script>

</script>