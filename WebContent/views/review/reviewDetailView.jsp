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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/productStyles.css" rel="stylesheet" />



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

.board_content, .board_pic, .like_result_area, .review_like  {
	color : #444343;
	font-size : 12pt;
	margin : 10pt;
}

.board_star {

	font-size : 13pt;
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
				
				<span class="board_author">작성자 : <%=m.getUserName() %> </span><br>
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
				
				<div class="board_star">
					별점 : <b> <% int star = r.getStar();
                          for(int i=0; i<star; i++){ %>
                      <i class="bi bi-star-fill"></i> <%}%></b>
                </div>
                
                
                <div class="board_content"><%=r.getReviewContent() %></div>
                
                
                <div id="like_result_area" class="like_result_area">
				좋아요 <i class="bi bi-suit-heart"></i> : <%=r.getLike() %>개
				</div>

				<%if(loginUser != null) {%>
				<!-- 좋아요 버튼 로그인 되어있을때만 보이게 -->
				<div  class="review_like">				
					<form id="like_form">						
						<input type="hidden" id="rId" name="rId" value="<%=r.getReviewNo() %>">
						<input type="hidden" id="likeCount" name="likeCount" value="1">											
						<input class="btn btn-sm btn-info" type="button" value="좋아요!" id="likeBtn">						
					</form>					
								
				</div>
				<% } %>
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
	
	$(function(){
		$("#likeBtn").click(function(){	
			
			var rId = $("#rId").val();			
			console.log(rId);			
			
			$.ajax({
				//1. url : 데이터를 전송할 url(필수!!)
				url:"likeInsert.do",
				
				//2. data : 요청시 전달할 파라미터 설정(키 밸류 형식)
				data: { 					
					rId : rId					
				},
				
				//3. type : 전송방식(get/post)
				type : "get",
				
				//4. success : Ajax 통신 성공시 처리할 함수를 지정하는 속성. result값을 받아 실행
				success : function(result){
					alert("좋아요 완료😆!");
					console.log("통신완료");
					console.log("<%=r.getLike()%>");
					var like ="좋아요 <i class='bi bi-suit-heart-fill'></i> : "+ result + "개";
					$("#like_result_area").html(like);

				},
				
				//5. error : Ajax 통신 실패시 처리할 함수를 지정하는 속성
				error : function(){
					console.log("Ajax 통신 실패")
				}		
				
			})
		})
	})
	
	

	
	
	
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