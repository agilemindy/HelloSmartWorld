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
<style>
	.outer{
		width:100%;
		height:2000px;
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
</style>
</head>
<body>
	<%@ include file = "adminMenubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center">재고관리</h2>
		<br>
		
		<div align="right" style="margin-right: 150px; margin-bottom: 20px" >
			<button id="enrollButton" onclick="location.href = '/HelloSmartWorld/inventoryEnrollForm.do'">재고등록</button>
		</div>
		<div align="right" style="margin-right: 150px; margin-bottom: 20px" >
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
                    <th width="150">관리</th>
  				</tr>
			<thead>
			<tbody>
				<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Pro_Detail pd : list){ %>
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
						<td><%= pd.getDetail_date() %></td>
						<td><%= pd.getP_stock()%></td>
						<td>
						<div class="btns" align="center">
							<button type="button" onclick="updateForm();" class="button" style="margin-right: 5px;">수정</button>
							<button type="button" onclick="deleteInven();" class="button">삭제</button>
						</div>
						</td>							
					</tr>
					<%} %>
				<%} %>
			</tbody>
		</table>		
		
		<br><br>
		
		<!-- 페이징바 만들기 -->
		<div class="pagingArea" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%=contextPath%>/inventoryManagementListView.do?currentPage=1'"> &lt;&lt; </button>
		
			<!-- 이전페이지로(<) -->
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= contextPath %>/inventoryManagementListView.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
			<%} %>
			
			<!-- 페이지 목록 -->
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(p == currentPage){ %>
				<button disabled> <%= p %> </button>
				<%}else{ %>
				<button onclick="location.href='<%=contextPath %>/inventoryManagementListView.do?currentPage=<%= p %>'"> <%= p %> </button>
				<%} %>
				
			<%} %>
			
			<!-- 다음페이지로(>) -->
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else { %>
			<button onclick="location.href='<%= contextPath %>/inventoryManagementListView.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
			<%} %>
		
			<!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%=contextPath%>/inventoryManagementListView.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div> 
		<br><br>
	
		
	</div>
	
	<script>		
		function updateForm(){
			$("#postForm").attr("action", "<%=contextPath%>/updateFormProduct.do");
			$("#postForm").submit();
		}
		
		function deleteInven(){
			$("#postForm").attr("action", "<%=contextPath%>/deleteProduct.do");
			$("#postForm").submit();
		}
			
		
	</script>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>