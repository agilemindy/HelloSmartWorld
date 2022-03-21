<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = "java.util.ArrayList, com.uni.review.model.vo.*" pageEncoding="UTF-8"%>
<%
	
String msg = (String)session.getAttribute("msg");

String contextPath = request.getContextPath();

ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/productStyles.css" rel="stylesheet" />
<style> .carousel-inner > .carousel-item > img{  width: 1000px; height: 500px;  } 
        .carousel-inner > .carousel-item > video{  width: 1000px; height: 500px;  } 

.topList{
background-color: gray;
}

</style>

<title>Review | HELLO SMART WORLD</title>

</head>
<body>

<%@ include file = "../../views/common/menubar.jsp" %>
 
<div class="topList" align="center">
		<br>
		<h2>Best Review Top3</h2>

		<div id="thumbList">
			<h5>구현예정</h5>
			<%--  <div class="thumb" align="center">
				<input type="hidden" value="1"> 
				<img src="<%=contextPath%>/resources/board_upfiles/2020121711123393793.PNG" width="250px" height="200px"> <br>
				<p>제목입니다.</p>
			</div>--%>

		</div>

	</div>
	<script>
	$(function(){
		
		//
		selectTopList();
		
		//
		//setInterval(selectTopList,2000);
		$("#thumbList").on("click",".thumb",function(){
			var bId = $(this).children().eq(0).val();
			location.href="<%=contextPath%>/detailThumb.do?bId="+bId;
		})
	})
	function selectTopList(){
		
		
		$.ajax({
			url:"topList.do",
			type:"get",
			success:function(list){
				var value = "";
				for(var i in list){
					value += '<div class="thumb" align="center">'+
							 '<input type="hidden" value="' +list[i].boardNo+ '">'+
							 '<img src="<%=contextPath%>/resources/board_upfiles/' + list[i].titleImg + '" width="250px" height="200px"> <br>'+
							 '<p>'+ list[i].boardTitle +'</p>'+
							 '</div>';
				}
				$("#thumbList").html(value);
			},
			error:function(){
				console.log("ajax통신실패");
			}
		})	
	}
	</script>
	
	 <section class="py-5">	
            <div class="container px-4 px-lg-5 mt-5">           
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                      <%for(Review r : list){ %>
                      <div class="col mb-5">                    
                        <div class="card h-100">
                        <input type="hidden" value="<%=r.getReviewNo()%>">
                            <!-- Product image-->
                            <%-- 
                            <img class="card-img-top" src="<%=contextPath %>/resources/review_upfiles/<%= r.getTitleImg() %>" alt="리뷰보러가기" />--%>
                            <img class="card-img-top" src="https://img.insight.co.kr/static/2021/05/07/700/img_20210507093529_8hq8orse.webp" alt="리뷰보러가기" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"> <%=r.getReviewTitle()%> </h5>
                                    <!-- Product price-->
                                    <!--  별점 : <%=r.getLike()%> 점 <br> -->
                                    <%=r.getReviewContent() %>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">자세히 보기</a></div>
                            </div>
                            
                        </div>
                        
                    </div>
     <%} %>  
      

                </div>
           
            </div>
            
     </section>   
  	
  	
  	
            <div align="center">
			
			<% if(loginUser != null){ %>
				<button onclick="location.href='<%=contextPath %>/insertFormReview.do'">작성하기</button>
				<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">작성하기</a></div>
			<% } %>
			</div>
			  
      
        
       <script>
		
			$(function(){
				$(".py-5").click(function(){
					var bId = $(this).children().eq(0).val();
					location.href="<%=contextPath%>/detailThumb.do?bId=" + bId;
				});
			});
		</script>
	
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="js/scripts.js"></script>
 

 
 <%@ include file = "../../views/common/footer.jsp" %>	
</body>
</html>