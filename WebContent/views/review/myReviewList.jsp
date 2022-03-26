<%@ page language="java" contentType="text/html; charset=UTF-8"
    import = "java.util.ArrayList, com.uni.review.model.vo.*" pageEncoding="UTF-8"%>

<%
	
String msg = (String)session.getAttribute("msg");
Review r = (Review)request.getAttribute("r");

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

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/productStyles.css" rel="stylesheet" />
<style> .carousel-inner > .carousel-item > img{  width: 1000px; height: 500px;  } 
        .carousel-inner > .carousel-item > video{  width: 1000px; height: 500px;  } 



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
<title>My Review | HELLO SMART WORLD</title>
</head>
<body>
<%@ include file = "../../views/common/menubar.jsp" %>
 



<div align="center">
	<b><%=loginUser.getUserName() %></b>님이 작성하신 리뷰 내역입니다.
	
	<% if(loginUser != null){ %>
		<%-- <button onclick="location.href='<%=contextPath %>/insertFormReview.do'">작성하기</button> --%>
		<div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=contextPath %>/enrollFormReview.do">리뷰 작성하기</a></div>
	<% } %>
	</div>
 	
 
	<section class="py-5">	
            <div class="container px-4 px-lg-5 mt-5">           
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                      <%for(Review re : list){ %>
                      <div class="col mb-5">                    
                        <div class="card h-100">                        
                        <input type="hidden" value="<%=re.getReviewNo()%>">   
                          
                          <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"> <%=re.getReviewTitle()%> </h5>
                                    
      
                                    
                                    <!-- Product price-->
                                    
                                    <% int star = re.getStar();
                                    for(int i=0; i<star; i++){ %>
                                    <i class="bi bi-star-fill"></i> <%}%> <br>
                                    <%=re.getReviewContent() %>
                                </div>
                            </div>
                          
                        </div>
                        
                    </div>
     					<%}%>
                </div>           
            </div>            
     </section>   
  	
	
  	<!-- Bootstrap core JS-->
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<!-- Core theme JS-->
  	<script src="js/scripts.js"></script>
 

  	 <!-- 페이징바 만들기 -->
	 <div class="pagingArea" align="center">
	<!-- 맨 처음으로 (<<) -->
	<button onclick="location.href='<%=contextPath%>/ReviewList.do.do?currentPage=1'"> &lt;&lt; </button>
		
	<!-- 이전페이지로(<) -->
	<%if(currentPage == 1){ %>
	<button disabled> &lt; </button>
	<%}else{ %>
	<button onclick="location.href='<%= contextPath %>/ReviewList.do?currentPage=<%= currentPage-1 %>'"> &lt; </button>
	<%} %>
			
	<!-- 페이지 목록 -->
	<%for(int p=startPage; p<=endPage; p++){ %>
				
		<%if(p == currentPage){ %>
		<button disabled style="background:#8f9dca"> <%= p %> </button>
		<%}else{ %>
		<button onclick="location.href='<%=contextPath %>/ReviewList.do?currentPage=<%= p %>'"> <%= p %> </button>
		<%} %>
				
	<%} %>
			
	<!-- 다음페이지로(>) -->
	<%if(currentPage == maxPage){ %>
		<button disabled> &gt; </button>
	<%}else { %>
		button onclick="location.href='<%= contextPath %>/ReviewList.do?currentPage=<%= currentPage+1 %>'"> &gt; </button>
	<%} %>
		
	<!-- 맨 끝으로 (>>) -->
	<button onclick="location.href='<%=contextPath%>/ReviewList.do?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
	</div> 
	<br><br> 
 <%@ include file = "../../views/common/footer.jsp" %>	
</body>
</html>