<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*"%>
<%
	ArrayList<Pro_Detail> list = (ArrayList<Pro_Detail>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int invenCount = pi.getproCount();
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
<title>재고관리 | HELLO SMART WORLD</title>
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
		font-size:13px;
	}
		
	#enrollButton{
		border-radius: 15px;
		border: 3px solid white;
		background: black;
		color: white;
	}
	
	.button{
		border-radius: 15px;
		border: 3px solid white;
		background: black;
		color: white;
	}
	
	.listArea>tbody>tr:hover{
		background:darkgrey;
		
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
		
		<h2 align="center">재고관리</h2>
		<br>
		
		<div align="right" style="margin-right: 180px; margin-bottom: 20px" >
			<!-- 재고등록하기 -->
			<button id="enrollButton" onclick="location.href = '/HelloSmartWorld/inventoryEnrollForm.do'">재고등록</button>
		</div>
		<div align="right" style="margin-right: 180px; margin-bottom: 20px" >
			<!-- 현재 입출고 건수 -->
			<h4> 총 <%= pi.getproCount() %> 건 </h4>
		</div>
		
		
		
		<table class="listArea" align="center">
			<thead>
				<tr>				
					<th width="150">재고번호</th>
					<th width="300">제품아이디</th>
					<th width="200">제품명</th>
					<th width="150">제조사</th>
					<th width="200">색상</th>
					<th width="80">용량</th>
					<th width="150">가격</th>
					<th width="150">입출고</th>                  
					<th width="150">수량</th>               
					<th width="150">재고등록일</th>               
                    <th width="150">현재수량</th>
                    <th width="200">관리</th>
  				</tr>
			<thead>
			<tbody>
				<%if(list.isEmpty()){ %><!-- 입출고 건수가 없을 경우 -->
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %><!-- 입출고 건수가 있을 경우 -->
					<% for(Pro_Detail pd : list){ %><!-- for-each문 사용 -->
					<tr>		
						<td><%= pd.getP_no() %></td>				
						<td><%= pd.getP_id() %></td>
						<td><%= pd.getP_name() %></td>
						<td><%= pd.getBrand() %></td>
						<td><%= pd.getColor() %></td>
						<td><%= pd.getCapacity() %></td>
						<td><%= pd.getPrice() %></td>
						<td><%= pd.getStatus() %></td>
						<td><%= pd.getAmount()%></td>
						<td><%= pd.getDate()%></td>
						<td><%= pd.getP_stock()%></td>
						<td>						
							<!-- 수정하기 -->
							<button id="update" type="button" class="button" style="margin-right: 5px;">수정</button>
							<!-- 삭제하기 -->
							<button id="delete" type="button" class="button">삭제</button>
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
         <button class="pageButton" onclick="location.href='<%=contextPath%>/inventoryManagementListView.do?currentPage=1'"><i class="bi bi-chevron-double-left"></i> </button>
      
         <!-- 이전페이지로(<) -->
         <%if(currentPage == 1){ %>
         <button class="pageButton" disabled> &lt; </button>
         <%}else{ %>
         <button class="pageButton" onclick="location.href='<%= contextPath %>/inventoryManagementListView.do?currentPage=<%= currentPage-1 %>'"> <i class="bi bi-chevron-left"></i> </button>
         <%} %>
         
         <!-- 페이지 목록 -->
         <%for(int p=startPage; p<=endPage; p++){ %>
            
            <%if(p == currentPage){ %>
            <button class="pageButton" disabled> <%= p %> </button>
            <%}else{ %>
            <button class="pageButton" onclick="location.href='<%=contextPath %>/inventoryManagementListView.do?currentPage=<%= p %>'"> <%= p %> </button>
            <%} %>
            
         <%} %>
         
         <!-- 다음페이지로(>) -->
         <%if(currentPage == maxPage){ %>
         <button class="pageButton" disabled> &gt; </button>
         <%}else { %>
         <button class="pageButton" onclick="location.href='<%= contextPath %>/inventoryManagementListView.do?currentPage=<%= currentPage+1 %>'"> <i class="bi bi-chevron-right"></i> </button>
         <%} %>
      
         <!-- 맨 끝으로 (>>) -->
         <button class="pageButton" onclick="location.href='<%=contextPath%>/inventoryManagementListView.do?currentPage=<%=maxPage%>'"> <i class="bi bi-chevron-double-right"></i> </button>
		</div> 
		<br><br>
	
		
	</div>
	
	<script>		
		$(".listArea>tbody>tr>td>#update").click(function(){ // 각 행에서 수정버튼
			var pNo = $(this).parentsUntil().eq(1).children().eq(0).text();	// 수정버튼 누른 행의 재고번호				
			location.href="<%=contextPath%>/updateInvenForm.do?pNo="+pNo;		
		});	
		
		$(".listArea>tbody>tr>td>#delete").click(function(){ // 각 행에서 삭제버튼
			var pNo = $(this).parentsUntil().eq(1).children().eq(0).text();	// 삭제버튼 누른 행의 재고번호				
			location.href="<%=contextPath%>/deleteInven.do?pNo="+pNo;		
		});	
			
		
			
		
	</script>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>