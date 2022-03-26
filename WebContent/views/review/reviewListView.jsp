<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = "java.util.ArrayList, com.uni.review.model.vo.*" pageEncoding="UTF-8"%>

<%	
String msg = (String)session.getAttribute("msg");
String contextPath = request.getContextPath();
ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

ReviewPageInfo rpi = (ReviewPageInfo)request.getAttribute("rpi");
int listCount = rpi.getListCount();
int currentPage = rpi.getCurrentPage();
int maxPage = rpi.getMaxPage();
int startPage = rpi.getStartPage();
int endPage = rpi.getEndPage();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/productStyles.css" rel="stylesheet" />

<style> .carousel-inner > .carousel-item > img{  width: 1000px; height: 500px;  } 
        .carousel-inner > .carousel-item > video{  width: 1000px; height: 500px;  } 

.topList{
background-color: #F8F9FA;
color: darkslategray;
}

.starC{

color: rgb(255, 212, 0);
font-weight : bold;
}

.productId{

font-size: 8pt;

}

.thumb {
		display: inline-block;
		width: 250px;
		height: 250px;
		margin: 20px;
		padding-top : 10px;	
		border : 1px solid #DFDFDF;
  		border-radius: 10px;
 		box-shadow: inset 0 0 3px rgb(73, 83, 113); 		
		
}
	
.thumb:hover {
	cursor: pointer;
}

.hot{
font-size: 7pt;
color: rgb(232, 58, 20);

}

.topimg{
border-radius: 10px;
}


.pagingArea >button{
  background:rgb(73, 83, 113);
  color:#fff;
  border:none;
  position:relative;
  height:50px;
  font-size:11pt;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 6px;
}

.pagingArea>button:hover{
  background:#fff;
  color:rgb(73, 83, 113);
  
}
.pagingArea>button:before,.pagingArea>button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: rgb(73, 83, 113);
  transition:400ms ease all;
}
.pagingArea>button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.pagingArea>button:hover:before,.pagingArea>button:hover:after{
  width:100%;
  transition:800ms ease all;
}


</style>

<title>Review | HELLO SMART WORLD</title>
</head>
<body>

	<%@ include file = "../../views/common/menubar.jsp" %>
 
	<div class="topList" align="center">

		<br>
		<h2>Best Review TOP3</h2>

		<div id="thumbList">			

		</div>
	</div>
	<script>
	$(function(){		
		
		selectTopList();		

		$("#thumbList").on("click",".thumb",function(){
			var rId =$(".rId").val();
			location.href="<%=contextPath%>/detailReview.do?rId="+rId;
		})
	})
	function selectTopList(){		
		$.ajax({
			url:"topReviewList.do",
			type:"get",
			success:function(list){
				var value = "";
				for(var i in list){
					value += '<div class="thumb" align="center">'+
							 '<input type="hidden" value="' +list[i].ReviewNo+ '">'+
							 '<img class="topimg" src="<%=contextPath%>/resources/review_upfiles/' + list[i].titleImg + '" width="180px" height="180px"> <br>'+
							 '<p><span class="hot"><i class="bi bi-stars"></i>인기리뷰</span> &nbsp&nbsp<br>'+ list[i].reviewTitle +'</p>'+
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
	<br><br>

	<div align="center">
	
	<% if(loginUser != null){ %>
		<%-- <button onclick="location.href='<%=contextPath %>/insertFormReview.do'">작성하기</button> --%>
		<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=contextPath %>/enrollFormReview.do">리뷰 작성하기</a></div>
	<% } %>
	</div>
 	
	<section class="py-5">	
            <div class="container px-4 px-lg-5 mt-5">           
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <%for(Review r : list){ %>
                      <div class="col mb-5">                    
                        <div class="card h-100">
                        <form action="<%=request.getContextPath()%>/detailReview.do" method="get">
                        <input type="hidden" class="rId" id="rId" name="rId" value="<%=r.getReviewNo()%>">
                            <!-- Review image-->
                           <% if(r.getTitleImg() != null){ %>
                            <img class="card-img-top" width="100px" height="250px" src="<%=contextPath%>/resources/review_upfiles/<%=r.getTitleImg()%>" alt="리뷰보러가기" />
                            <% }else{ %>
                            <img class="card-img-top" width="100px" height="250px" src="https://www.ulsannamgu.go.kr/images/common/noimg.png" alt="등록된 리뷰사진이 없습니다." />	
                            <% } %>                  
     
                            <%-- <img class="card-img-top" src="https://img.insight.co.kr/static/2021/05/07/700/img_20210507093529_8hq8orse.webp" alt="리뷰보러가기" />--%>
                            <!-- Product details-->                            
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"> <%=r.getReviewTitle()%> </h5>
                                    
                               
                                    
                                    <div class="starC">
                                    <% int star = r.getStar();
                                    for(int i=0; i<star; i++){ %>
                                    <i class="bi bi-star-fill"></i> <%}%></div>
                                    
                                    
                                    <div class="productId">
                                    <%=r.getProductId() %>                                    
                                    </div>                                    
                                    
                                </div>
                            </div>
                            
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><button class="btn btn-dark btn-lg btn-block" type="submit" id="submitBtn">리뷰보기</button></div>
                            </div>
                            </form>
                            
                            
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" id="reviewDetail" name="reviewDetail" onclick="detail_click();">자세히 보기</a></div>
                            </div>--> 
                            
                                                       
                        </div>                        
                      </div>
     				<%} %>
                </div>           
            </div>            
     </section>   
  	
         
	<script>
	
	<%if(!list.isEmpty()){%>
	
		function detail_click() {
			$(".py-5").click(function(){
				var rId =$(".rId").val();
				 location.href="<%=contextPath%>/detailReview.do?rId="+rId;
			})
		}
		
	<%}%>	
	
	
	</script>
	
  	<!-- Bootstrap core JS-->
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<!-- Core theme JS-->
  	<script src="js/scripts.js"></script>
 
 
    <!-- 페이징바 만들기 -->
	<div class="pagingArea" align="center">
	<!-- 맨 처음으로 (<<) -->
	<button onclick="location.href='<%=contextPath%>/reviewList.do?currentPage=1'"> &lt;&lt; </button>
		
	<!-- 이전페이지로(<) -->
	<%if(currentPage == 1){ %>
		<button disabled> &lt; </button>
	<%}else{ %>
		<button onclick="location.href='<%= contextPath %>/reviewList.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
	<%} %>
			
	<!-- 페이지 목록 -->
	<%for(int p=startPage; p<=endPage; p++){ %>				
		<%if(p == currentPage){ %>
			<button disabled style="background:#8f9dca"> <%= p %> </button>
		<%}else{ %>
			<button onclick="location.href='<%=contextPath %>/reviewList.do?currentPage=<%= p %>'"> <%= p %> </button>
		<%} %>				
	<%} %>
			
	<!-- 다음페이지로(>) -->
	<%if(currentPage == maxPage){ %>
		<button disabled> &gt; </button>
	<%}else { %>
		<button onclick="location.href='<%= contextPath %>/reviewList.do?currentPage=<%=currentPage+1%>'"> &gt; </button>
	<%} %>
	
	
			
		
	<!-- 맨 끝으로 (>>) -->
	<button onclick="location.href='<%=contextPath%>/reviewList.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
	</div> 
	<br><br> 
 	<%@ include file = "../../views/common/footer.jsp" %>
 		
</body>
</html>