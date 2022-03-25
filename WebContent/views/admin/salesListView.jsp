<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*, com.uni.order.model.vo.*"%>
<%
	ArrayList<Order> list = (ArrayList<Order>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int proCount = pi.getproCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();	
			
	
	String contextPath = request.getContextPath();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		margin-top:50px;
		margin-bottom: 50px;
	}
	.listArea{
		border:1px solid white;
		text-align:center;
		width: 80%;		
	}
	
	.listArea{
		font-size: 15px;		
	}
	
	tbody>tr>td{
		font-size:13px;
	}
	
	.sort{
		color: white;
	}
	
	.pageButton{
		background: black;
		border-color: white;
		color: white;
	
	}
	
	
</style>
</head>
<body>
	<%@ include file = "adminMenubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center">매출내역조회</h2>
		<br>
		
		<div align="right" style="margin-right: 180px; margin-bottom: 20px" >
			<a class ="sort" href="<%= contextPath %>/SalesListView.do";>최신순</a>
			<a class ="sort" href="<%= contextPath %>/sortAsc.do";>오래된순</a>
		</div>
		<div align="right" style="margin-right: 180px; margin-bottom: 20px" >
			<h4> 총 <%= proCount %> 건 </h4>
		</div>
		
		
		
		<table class="listArea" align="center">
			<thead>
				<tr>					
					<th width="150">주문번호</th>
					<th width="150">회원번호</th>
					<th width="300">제품아이디</th>
					<th width="150">수량</th>
					<th width="200">가격</th>
					<th width="200">주문날짜</th>                 

				</tr>
			<thead>
			<tbody id="tbody">
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Order o : list){ %>
					<tr>						
						<td><%= o.getOrderNo() %></td>
						<td><%= o.getUserNo() %></td>
						<td><%= o.getpId() %></td>
						<td><%= o.getAmount() %></td>
						<td><%= o.getPrice() %></td>
						<td><%= o.getDate() %></td>												
					</tr>
					<%} %>
				<%} %>
			</tbody>
		</table>
		
		<br><br>
		
		<!-- 페이징바 만들기 -->
      	<div class="pagingArea my-2" align="center">
	         <!-- 맨 처음으로 (<<) -->
	         <button class="pageButton" onclick="location.href='<%=contextPath%>/SalesListView.do?currentPage=1'" ><i class="bi bi-chevron-double-left"></i> </button>
	      
	         <!-- 이전페이지로(<) -->
	         <%if(currentPage == 1){ %>
	         <button class="pageButton" disabled> &lt; </button>
	         <%}else{ %>
	         <button class="pageButton" onclick="location.href='<%= contextPath %>/SalesListView.do?currentPage=<%= currentPage-1 %>'" > <i class="bi bi-chevron-left"></i> </button>
	         <%} %>
	         
	         <!-- 페이지 목록 -->
	         <%for(int p=startPage; p<=endPage; p++){ %>
	            
	            <%if(p == currentPage){ %>
	            <button class="pageButton" disabled> <%= p %> </button>
	            <%}else{ %>
	            <button class="pageButton" onclick="location.href='<%=contextPath %>/SalesListView.do?currentPage=<%= p %>'"> <%= p %> </button>
	            <%} %>
	            
	         <%} %>
	         
	         <!-- 다음페이지로(>) -->
	         <%if(currentPage == maxPage){ %>
	         <button class="pageButton" disabled> &gt; </button>
	         <%}else { %>
	         <button class="pageButton" onclick="location.href='<%= contextPath %>/SalesListView.do?currentPage=<%= currentPage+1 %>'"> <i class="bi bi-chevron-right"></i> </button>
	         <%} %>
	      
	         <!-- 맨 끝으로 (>>) -->
	         <button class="pageButton" onclick="location.href='<%=contextPath%>/SalesListView.do?currentPage=<%=maxPage%>'"> <i class="bi bi-chevron-double-right"></i> </button>
		</div> 
		<br><br>
		
		
	</div>
	
	<script>		
	$(function(){
		$("#date").change(function(){
			
			$.ajax({
				url : "sortDate.do",
				data : "",
				type : "get",
				success : function(data){
					$('#tbody').html(data);
				},
				error : function(){
					console.log("ajax통신실패")
				}
			})
		})
	})
			
	</script>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>