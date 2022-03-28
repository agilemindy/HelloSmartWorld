<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = "java.util.ArrayList, com.uni.review.model.vo.*, com.uni.admin.model.vo.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<%
String contextPath = request.getContextPath();
Review r = (Review)request.getAttribute("r");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 작성 | HELLO SMART WORLD</title>

<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale"="1">
<link rel="stylesheet" href="css/bootstrap.css">

</head>
<body>

<%@ include file = "../../views/common/menubar.jsp" %>
 
 
<div class="container">

<h4>리뷰작성</h4>

    <form id="insertForm" name="isf"  action="<%= contextPath %>/insertReview.do" method="post" enctype="multipart/form-data">
      <input type="hidden" id="writer" name="writer" value="<%= loginUser.getUserNo() %>">
    
      <div class="form-group">      
        <label for="subject">제목</label>
        <input type="text" required class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
      </div>      
  
      
      <div class="form-group">      
        <label for="product">제품명</label>
        <input type="text"  required class="form-control" id="product" name="product" placeholder="제품명을 입력하세요.">
      
      </div>
      
      <div class="form-group">
      	<label for="starcontent">별점</label>
        <select required class="form-select form-select-md mb-3" id="star" name="star">
   			 <option value="" disabled selected>별점을 고르세요</option>   			  
   			 <option value="1">&bigstar;</option>
    		 <option value="2">&bigstar;&bigstar;</option>
    	     <option value="3">&bigstar;&bigstar;&bigstar;</option>
    	     <option value="4">&bigstar;&bigstar;&bigstar;&bigstar;</option>
    	     <option value="5">&bigstar;&bigstar;&bigstar;&bigstar;&bigstar;</option>    	
  		</select>
      </div>    
      

      <div class="form-group">
        <label for="content">내용</label>
        <textarea required class="form-control" id="content" name="content" rows="10"></textarea>
      </div>
      
      <div class="form-group">
      <label for="content"><i class="bi bi-camera-fill"></i> 추가하기 </label><br>
      <img id="titleImg" width="150" height="120">
      </div>
      
      <!-- 이미지 파일만 업로드할 수 있도록 유효성검사 -->
      <div id="fileArea">
        <input accept="image/*" required type="file" name="file1" id="file1" onchange="loadImg(this, 1);">
      </div>
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>  
	
	<script>

	
	
	
	$(function(){	
		
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
      <button type="button" class="btn btn-secondary" id="btnList" onclick="location.href='<%=contextPath%>/reviewList.do'">목록으로</button>
      <button type="reset" onclick="resetimg()" class="btn btn-secondary">재작성</button>
      <button type="submit" class="btn btn-dark">리뷰 작성하기</button>
      
    
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