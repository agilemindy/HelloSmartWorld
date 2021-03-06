<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int proCount = pi.getproCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();	
			
	
	String contextPath = request.getContextPath();
	String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품관리 | HELLO SMART WORLD</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://hangeul.pstatic.net/hangeul_static/css/maru-buri.css" rel="stylesheet">
<style>
	.outer{
		font-family: 'MaruBuri';
		width:100%;
		height:2000px;
		background:black;
		color:white;
		margin:auto;
		
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
		font-size: 13px;
	}
	
	.listArea>tbody>tr:hover{
		background:darkgrey;
		cursor:pointer
	}
	
	#enrollButton{
		border-radius: 15px;
		border: 3px solid white;
		background: black;
		color: white;
	}
	
	.pageButton{
      background: black;
      color: white;
      border-color: white;
   }
   
   #searchBtn{
		border-radius: 15px;
		border: 3px solid white;
		background: black;
		color: white;
	}
   
</style>
</head>
<script>
		var msg = "<%=msg%>";
		console.log(msg);
		
		$(function(){
			if(msg != "null"){
				alert(msg);
				<% session.removeAttribute("msg"); %>
			}
		})
	
</script>
<body>
	<%@ include file = "adminMenubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center">제품관리</h2>
		<br>
		
		<div align="right" style="margin-right: 180px; margin-bottom: 20px" >
			<!-- 제품등록 -->
			<button id="enrollButton" onclick="location.href = '/HelloSmartWorld/productEnrollForm.do'"><i class="bi bi-phone"></i>제품등록</button>
		</div>
		<div align="right" style="margin-right: 180px; margin-bottom: 20px" >
			<!-- 현재 등록되어있는 제품 갯수 -->
			<h4> 총 <%= proCount %> 개 </h4>
		</div>
		
		
		<!-- 제품관리내용 -->
		<table class="listArea" align="center">
			<thead>
				<tr>
					<th width="300">제품사진</th>
					<th width="300">제품아이디</th>
					<th width="200">제품명</th>
					<th width="150">제조사</th>
					<th width="200">색상</th>
					<th width="80">용량</th>
					<th width="150">가격</th>
                    <th width="50">판매상태</th>
                    <th width="150">현재수량</th>
                    

				</tr>
			<thead>
			<tbody>
				<!-- 제품을 저장한 list 에 내용이 없을 경우 -->
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %><!-- 제품이 list 잘 담겼을 경우 -->
					<% for(Product p : list){ %><!-- for-each문 이용 -->
					<tr>
						<td>
						<% if(p.getTitleImg() != null){ %><!-- 대표이미지가 있을 경우 -->
						<img src="<%=contextPath %>/resources/product_upfiles/<%= p.getTitleImg() %>" width="150px" height="150px">
						<% }else{ %><!-- 대표이미지가 없을 경우 -->
						<img src="<%=contextPath %>/resources/product_upfiles/noImg.png" width="150px" height="150px">
						<% } %>
						</td>
						<td><%= p.getP_id() %></td>
						<td><%= p.getP_name() %></td>
						<td><%= p.getBrand() %></td>
						<td><%= p.getColor() %></td>
						<td><%= p.getCapacity() %></td>
						<td><%= p.getPrice() %></td>
						<td><%= p.getP_status() %></td>
						<td><%= p.getP_stock() %></td>						
					</tr>
					<%} %>
				<%} %>
			</tbody>
		</table>
		
		<br><br><br>
		
		<!-- 검색창 -->
		<form action="<%= contextPath %>/searchProduct.do">
			<div align="center">
				<span>
					<input type="text" name="search">
					<button type="submit" id="searchBtn">검색</button>
				</span>
			</div>
		</form>
		<br><br>
		
		<!-- 페이징바 만들기 -->
      	<div class="pagingArea my-2" align="center">
	         <!-- 맨 처음으로 (<<) -->
	         <button class="pageButton" onclick="location.href='<%=contextPath%>/adminProductListView.do?currentPage=1'"><i class="bi bi-chevron-double-left"></i> </button>
	      
	         <!-- 이전페이지로(<) -->
	         <%if(currentPage == 1){ %>
	         <button class="pageButton" disabled> &lt; </button>
	         <%}else{ %>
	         <button class="pageButton" onclick="location.href='<%= contextPath %>/adminProductListView.do?currentPage=<%= currentPage-1 %>'"> <i class="bi bi-chevron-left"></i> </button>
	         <%} %>
	         
	         <!-- 페이지 목록 -->
	         <%for(int p=startPage; p<=endPage; p++){ %>
	            
	            <%if(p == currentPage){ %>
	            <button class="pageButton" disabled> <%= p %> </button>
	            <%}else{ %>
	            <button class="pageButton" onclick="location.href='<%=contextPath %>/adminProductListView.do?currentPage=<%= p %>'"> <%= p %> </button>
	            <%} %>
	            
	         <%} %>
	         
	         <!-- 다음페이지로(>) -->
	         <%if(currentPage == maxPage){ %>
	         <button class="pageButton" disabled> &gt; </button>
	         <%}else { %>
	         <button class="pageButton" onclick="location.href='<%= contextPath %>/adminProductListView.do?currentPage=<%= currentPage+1 %>'"> <i class="bi bi-chevron-right"></i> </button>
	         <%} %>
	      
	         <!-- 맨 끝으로 (>>) -->
	         <button class="pageButton" onclick="location.href='<%=contextPath%>/adminProductListView.do?currentPage=<%=maxPage%>'"> <i class="bi bi-chevron-double-right"></i> </button>
		</div> 
		<br><br>
		
		
	</div>
	
	<script>		
		
			$(".listArea>tbody>tr").click(function(){ // 한 행을 선택 - 제품아이디를 pId 에 담아 상세정보 보기
				var pId = $(this).children().eq(1).text();				
				location.href="<%=contextPath%>/adminProDetailViewServlet.do?pId="+pId;		
			});
		
	</script>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>