<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" import="java.util.ArrayList, com.uni.review.model.vo.*"%>   
    
<%
String contextPath = request.getContextPath();

Review r = (Review)request.getAttribute("r");
//Attachment at = (Attachment)request.getAttribute("at");
//ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");


%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Review 수정 | HELLO SMART WORLD</title>

<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

<%@ include file = "../../views/common/menubar.jsp" %>
<div class="container">

<h4>리뷰수정</h4>

    <form id="insertForm" action="<%= contextPath %>/updateReview.do" method="post" enctype="multipart/form-data">
      <input type="hidden" id="writer" name="writer" value="<%= loginUser.getUserNo() %>">
      <input type="hidden" name="rId" value="<%=r.getReviewNo()%>">  
      <div class="form-group">      
        <label for="subject">제목</label>
        <input type="text" class="form-control" id="subject" name="subject" value="<%= r.getReviewTitle()%>">
      </div>
      
      <%--
      
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="writer" name="writer" placeholder="내용을 입력하세요.">
      </div>
      
      --%>
      
      <div class="form-group">      
        <label for="product">제품명</label>
        <input type="text" class="form-control" id="product" name="product" value="<%= r.getProductId()%>" >
      </div>
      
      <div class="form-group">
      	<label for="starcontent">별점</label>
        <select class="form-select form-select-md mb-3" id="star" name="star">
   			 <option selected>별점을 고르세요</option>   			  
   			 <option value="1">&bigstar;</option>
    		 <option value="2">&bigstar;&bigstar;</option>
    	     <option value="3">&bigstar;&bigstar;&bigstar;</option>
    	     <option value="4">&bigstar;&bigstar;&bigstar;&bigstar;</option>
    	     <option value="5">&bigstar;&bigstar;&bigstar;&bigstar;&bigstar;</option>    	
  		</select>
      </div>    
      

      <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="10"><%= r.getReviewContent()%></textarea>
      </div>
      
      <div class="form-group">
      <label for="content"><i class="bi bi-camera-fill"></i> 수정하기 </label><br>
      <img id="titleImg" width="150" height="120">
      </div>
      
      <div id="fileArea">
        <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
      </div>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
	
	<script>
	$(function(){
		$("#fileArea").hide();
		
		$("#titleImg").click(function(){
			$("#file1").click();
		});		
		
		
	});
	function loadImg(inputFile, num){
		if(inputFile.files.length == 1){
			var reader = new FileReader();
			reader.readAsDataURL(inputFile.files[0]);
			
			reader.onload = function(e){
				switch(num){
				case 1 : $("#titleImg").attr("src", e.target.result); break;
				
				}
			}
		}
	}	
	</script>

    
    <br>
    <button type="reset" class="btn btn-secondary">취소하기</button>
    <button type="submit" class="btn btn-dark">리뷰 수정하기</button>
      
    </form>
    
 	<!-- Bootstrap core JS-->
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<!-- Core theme JS-->
  	<script src="js/scripts.js"></script>
  
  
	</div>
	<br>
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>