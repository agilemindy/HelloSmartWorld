<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*, com.uni.review.model.vo.*"%>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
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
<title>리뷰관리</title>
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
	
	.listArea>tbody>tr:hover{
		background:darkgrey;
	}
	
	#enrollButton{
		border-radius: 15px;
		border: 3px solid white;
		background: black;
		color: white;
	}
	
	#deleteButton{
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
		
		<h2 align="center">리뷰관리</h2>
		<br>
				
		<div align="right" style="margin-right: 180px; margin-bottom: 20px" >
			<h4> 총 <%= proCount %> 건 </h4>
		</div>
		
		
		
		<table class="listArea" align="center">
			<thead>
				<tr>
					<th width="100">리뷰번호</th>
					<th width="100">작성자</th>
					<th width="300">상품ID</th>									
					<th width="300">제목</th>
					<th width="500">내용</th>
					<th width="50">별점</th>	
					<th width="150">작성일자</th>
                    <th width="100">좋아요</th>
                    <th width="100">조회수</th>
                    <th width="150">리뷰삭제</th>                    
				</tr>
			<thead>
			<tbody>
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Review r : list){ %>
					<tr>						
						<td><%= r.getReviewNo() %></td>
						<td><%= r.getReviewWriter() %></td>
						<td><%= r.getProductId() %></td>
						<td><%= r.getReviewTitle() %></td>
						<td><%= r.getReviewContent() %></td>
						<td><%= r.getStar() %></td>
						<td><%= r.getCreateDate() %></td>
						<td><%= r.getLike() %></td>						
						<td><%= r.getCount() %></td>	
						<td>
						<button id="deleteButton" onclick="deleteMember();"><i class="bi bi-trash"></i></button>
						</td>					
					</tr>
					<%} %>
				<%} %>
			</tbody>
		</table>
		
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
		
		
	</div>adminProductListView.do
	
	<script>		
		$(".listArea>tbody>tr>td>button").click(function(){
			var rNo = $(this).parentsUntil().eq(1).children().eq(0).text();					
			location.href="<%=contextPath%>/deleteReview.do?rNo="+rNo;		
		});		
			
		
	</script>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>