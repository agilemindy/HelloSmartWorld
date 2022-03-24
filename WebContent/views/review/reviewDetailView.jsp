<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = "java.util.ArrayList, com.uni.review.model.vo.*" pageEncoding="UTF-8"%>
<%	
String msg = (String)session.getAttribute("msg");
String contextPath = request.getContextPath();
Member m = (Member)request.getAttribute("m");
Review r = (Review)request.getAttribute("r");
ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
//Attachment titleImg = fileList.get(0);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review | HELLO SMART WORLD</title>
<style type="text/css">


.board_title {
	font-weight : 700;
	font-size : 22pt;
	margin : 10pt;
}

.board_info_box {
	color : #6B6B6B;
	margin : 10pt;
}

.board_author {
	font-size : 10pt;
	margin-right : 10pt;
}

.board_date, .board_count, .board_product {
	font-size : 10pt;
}

.board_content, .board_pic  {
	color : #444343;
	font-size : 12pt;
	margin : 10pt;
}

.board_star {

	font-size : 11pt;
	margin : 10pt;
	padding-bottom : 10pt;
	color: rgb(255, 212, 0);

}





</style>
</head>
<body>
	<%@ include file = "../../views/common/menubar.jsp" %>
	<article>

		<div class="container" role="main">			

			<div class="bg-white rounded shadow-sm">
			
				<div class="board_title"><%=r.getReviewTitle()%></div>

				<div class="board_info_box">

				<span class="board_author">작성자 : <%=r.getReviewWriter() %> </span><br>
				<span class="board_date">작성일 : <%=r.getCreateDate() %></span> <span class="board_count">조회수 : <%=r.getCount() %></span>
				<span class="board_product">제품명 : <%=r.getProductId() %> </span>
				</div>
				
				<%-- 사진기능 막아놓기
				<div id="titleImgArea" align="center" class="board_pic">
				<img width="500px" height="300px" id="titleImg" src="<%= contextPath %>/resources/board_upfiles/<%= titleImg.getChangeName() %>">
				</div>--%>
				

				<div class="board_content"><%=r.getReviewContent() %></div>

				<div class="board_star">
					<b> <% int star = r.getStar();
                          for(int i=0; i<star; i++){ %>
                      <i class="bi bi-star-fill"></i> <%}%></b></div>

			</div>

			

			<div style="margin-top : 20px">

				
				<button type="button" onclick="updateFormReview();" class="btn btn-sm btn-dark" id="btnUpdate">수정</button>
				<button type="button" onclick="deleteBoard();" class="btn btn-sm btn-dark" id="btnDelete">삭제</button>
				
				
				<button type="button" class="btn btn-sm btn-dark" id="btnList" onclick="location.href='<%=contextPath%>/reviewList.do'">목록</button>

			</div>
		</div>			
	</article>
	<br>
	<form action="" id="postForm" method="post">
			<input type="hidden" name="rNo" value="<%=r.getReviewNo()%>">
	</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	
	function deleteBoard(){
		$("#postForm").attr("action", "<%=contextPath%>/deleteReviewUser.do");
		$("#postForm").submit();
	}
	
	
	function updateFormReview(){
		$("#postForm").attr("action", "<%=contextPath%>/updateFormReview.do");
		$("#postForm").submit();
	}
	
	</script>
	
	<!-- Bootstrap core JS-->
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<!-- Core theme JS-->
  	<script src="js/scripts.js"></script>

	<%@ include file = "../../views/common/footer.jsp" %>

</body>
</html>