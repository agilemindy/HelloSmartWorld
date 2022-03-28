<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*, com.uni.member.model.vo.Member"%>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
<title>회원관리 | HELLO SMART WORLD</title>
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
	.listArea{
		border:1px solid white;
		text-align:center;
		width: 90%;		
	}
	
	.listArea{
		font-size: 15px;		
	}
	
	tbody>tr>td{
		font-size:13px;
	}	
	
	#deleteButton{
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
		var msg = "<%= msg %>";
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
		
		<h2 align="center">회원관리</h2>
		<br>
		
		<div align="right" style="margin-right: 150px; margin-bottom: 20px" >
			
		</div>
		<div align="right" style="margin-right: 150px; margin-bottom: 20px" >
			<!-- 총 회원 수 -->
			<h4> 총 <%= proCount %> 명 </h4>
		</div>
		
		
		
		<table class="listArea" align="center">
			<thead>
				<tr>
					<th width="100">회원번호</th>
					<th width="100">아이디</th>					
					<th width="100">이름</th>
					<th width="200">주소</th>
					<th width="100">상세주소</th>
					<th width="200">일반전화</th>
                    <th width="200">휴대전화</th>
                    <th width="200">이메일</th>
                    <th width="200">가입일</th>
                    <th width="200">탈퇴일</th>
                    <th width="100">회원상태</th>
                    <th width="100">회원삭제</th>
                    

				</tr>
			<thead>
			<tbody>
				<%if(list.isEmpty()){ %><!-- 회원정보가 없을 경우 -->
				<tr>
					<td colspan="6">조회된 리스트가 없습니다.</td>
				</tr>
				<%}else{ %><!-- 회원정보가 있을 경우 -->
					<% for(Member m : list){ %><!-- for-each문 사용 -->
					<tr>
						
						<td><%= m.getUserNo() %></td>
						<td><%= m.getUserId()%></td>						
						<td><%= m.getUserName() %></td>
						<td><%= m.getAddress() %></td>
						<td><%= m.getAddressDet() %></td>
						<td><%= m.getTel() %></td>
						<td><%= m.getPhone() %></td>						
						<td><%= m.getEmail() %></td>						
						<td><%= m.getEnrollDate() %></td>						
						<td><%= m.getDelDate() %></td>						
						<td><%= m.getStatus() %></td>
						<td>
							<!-- 회원삭제버튼 -->
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
         <button class="pageButton" onclick="location.href='<%=contextPath%>/adminMemberListView.do?currentPage=1'"><i class="bi bi-chevron-double-left"></i> </button>
      
         <!-- 이전페이지로(<) -->
         <%if(currentPage == 1){ %>
         <button class="pageButton" disabled> &lt; </button>
         <%}else{ %>
         <button class="pageButton" onclick="location.href='<%= contextPath %>/adminMemberListView.do?currentPage=<%= currentPage-1 %>'"> <i class="bi bi-chevron-left"></i> </button>
         <%} %>
         
         <!-- 페이지 목록 -->
         <%for(int p=startPage; p<=endPage; p++){ %>
            
            <%if(p == currentPage){ %>
            <button class="pageButton" disabled> <%= p %> </button>
            <%}else{ %>
            <button class="pageButton" onclick="location.href='<%=contextPath %>/adminMemberListView.do?currentPage=<%= p %>'"> <%= p %> </button>
            <%} %>
            
         <%} %>
         
         <!-- 다음페이지로(>) -->
         <%if(currentPage == maxPage){ %>
         <button class="pageButton" disabled> &gt; </button>
         <%}else { %>
         <button class="pageButton" onclick="location.href='<%= contextPath %>/adminMemberListView.do?currentPage=<%= currentPage+1 %>'"> <i class="bi bi-chevron-right"></i> </button>
         <%} %>
      
         <!-- 맨 끝으로 (>>) -->
         <button class="pageButton" onclick="location.href='<%=contextPath%>/adminMemberListView.do?currentPage=<%=maxPage%>'"> <i class="bi bi-chevron-double-right"></i> </button>
		</div> 
		<br><br>
		
		
	</div>
	
	
	<script>
		$(".listArea>tbody>tr>td>button").click(function(){ // 각 행의 회원삭제버튼 클릭
			var userNo = $(this).parentsUntil().eq(1).children().eq(0).text(); // 회원번호 선택				
			location.href="<%=contextPath%>/deleteMember.do?userNo="+userNo;		
		});			
	</script>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>