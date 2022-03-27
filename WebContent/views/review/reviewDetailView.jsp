<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = "java.util.ArrayList, com.uni.review.model.vo.*" pageEncoding="UTF-8"%>
<%	
String msg = (String)session.getAttribute("msg");
String contextPath = request.getContextPath();
Member m = (Member)request.getAttribute("m");
Review r = (Review)request.getAttribute("r");
ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
Attachment titleImg = fileList.get(0);

Attachment at = (Attachment)request.getAttribute("at");


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
				<br><span class="board_product">제품명 : <%=r.getProductId() %> </span>
				</div>
				
				

				 
				<div id="titleImgArea" class="board_pic">	
			   
			   <% if(titleImg.getChangeName() != null){ %>
                	<img width="500px" height="300px" src="<%=contextPath%>/resources/review_upfiles/<%=titleImg.getChangeName()%>" />
               <% }else{ %>
                    <img width="500px" height="300px" src="https://www.ulsannamgu.go.kr/images/common/noimg.png" alt="등록된 리뷰사진이 없습니다."/>	
               <% } %> 					
			
				
				</div>			

				<div class="board_content"><%=r.getReviewContent() %></div>

				
				<div class="board_star">
					별점 : <b> <% int star = r.getStar();
                          for(int i=0; i<star; i++){ %>
                      <i class="bi bi-star-fill"></i> <%}%></b>
                </div>

				
				<!-- 좋아요 버튼 -->
				<div  class="review_like">				
					<form id="like_form">
					<table id="listLike" style="margin-left: auto; margin-right: auto;">
						<input type="hidden" name="command" value="like_it">
						<input type="hidden" name="rId" value="<%=r.getReviewNo() %>">
						<tr><div id="like_result">좋아요 수 : <%=r.getLike() %></div> </tr>
						<tr><input class="btn btn-sm btn-info" type="button" value="좋아요" onclick="return like()" > </tr>
						
					</table>
					</form>							
				</div>



			</div>

			

			<div style="margin-top : 20px">

				<!--내가 쓴 게시글만 수정삭제 버튼 보이도록  -->
				<% if(loginUser != null && loginUser.getUserNo()==(r.getReviewWriter())){ %>
				
				<button type="button" onclick="updateFormReview();" class="btn btn-sm btn-dark" id="btnUpdate">수정</button>
				<button type="button" onclick="deleteBoard();" class="btn btn-sm btn-dark" id="btnDelete">삭제</button>
				
				<% } %>
				
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
	
	function like(){
		
		  $.ajax({
			    url: "likeInsert.do",
			    type: "POST",
			    cache: false,
			    dataType: "json",
			    data: $('#like_form').serialize(),   //아이디가 like_form인 곳의 모든 정보를 가져와  파라미터 전송 형태(표준 쿼리형태)로 만들어줌
			    success: 
			    function(data){      					//ajax통신 성공시 넘어오는 데이터 통째 이름 =data
			    	alert("'좋아요'가 반영되었습니다!") ;  // data중 put한 것의 이름 like
	                $("#like_result").html(data.like);  //id값이 like_result인 html을 찾아서 data.like값으로 바꿔준다.
			    },   
			    
			    error: 
			    function (request, status, error){  
			      alert("ajax실패")                  
			    }
			  });
	}
	
	
	function deleteBoard(){
		
		var val = confirm("정말로 삭제하시겠습니까?");
		
		if(val){
			$("#postForm").attr("action", "<%=contextPath%>/deleteReviewUser.do");
			$("#postForm").submit();
		}else{
			alert("글 삭제를 취소했습니다.");
		}
		
		
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