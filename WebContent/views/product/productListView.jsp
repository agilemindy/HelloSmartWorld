<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.uni.admin.model.vo.*"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int proCount = pi.getproCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();	
			
	String contextPath = request.getContextPath();
	
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Product | HELLO SMART WORLD</title>
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


    </head>
    <body>
        <!-- Navigation-->      
      
        <%@ include file = "../../views/common/menubar.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var msg = "<%=msg%>"; // ????????? ????????? ?????????
	
	$(function(){
		if(msg != "null"){
			alert(msg);
			<%session.removeAttribute("msg");%>
		}
	})

</script>
<style>
		
	.pageButton{
		background: black;
		color:white;
	}
</style>
        <!-- Section-->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
        crossorigin="anonymous"></script> 
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
        crossorigin="anonymous"></script> 
        <script> $('.carousel').carousel({ interval: 2000 //?????? 5??? }) </script> 
        <div class="container">
            <div id="demo" class="carousel slide" data-ride="carousel"> 
                <div class="carousel-inner"> 
                    <!-- ???????????? ??? --> 
                    <div class="carousel-item active"> 
                        <!--??????--> 
                        <img class="d-block w-100" src="https://images.samsung.com/kdp/cms_contents/146827/4d06950b-f191-4041-aa8a-cb01b4f148b9.jpg?$ORIGIN_JPG$" alt="First slide"> 
                        <div class="carousel-caption d-none d-md-block"> 
                            <h5>Is "good" good enough?</h5> 
                            <p>Galaxy</p> 
                            </div> 
                        </div> 
                        <div class="carousel-item"> 
                            <img class="d-block w-100" src="https://www.apple.com/v/iphone-13-pro/f/images/overview/camera/intro/camera_system__rp945vhdfsiu_large.png" alt="Second slide"> 
                        </div> 
                        <div class="carousel-item"> 
                            <video class="d-block w-100" autoplay loop src="https://www.apple.com/105/media/us/iphone-13-pro/2021/404b23a8-f9c5-466c-b0e6-3d36705b959d/anim/gaming/large.mp4" alt="Third slide"> 
                        </div> 
                        <div class="carousel-item"> 
                            <video class="d-block w-100" autoplay loop src="https://www.apple.com/105/media/kr/iphone-13-pro/2021/404b23a8-f9c5-466c-b0e6-3d36705b959d/anim/pro-motion/large.mp4" alt="Fourth slide"> 
                        </div> 
                    <!-- / ???????????? ??? ??? --> 
                    
                    <!-- ?????? ????????? ????????? ?????? --> 
                    <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
                        <!-- <span>Previous</span> --> 
                    </a> 
                    <a class="carousel-control-next" href="#demo" data-slide="next"> 
                        <span class="carousel-control-next-icon" aria-hidden="true"></span> 
                        <!-- <span>Next</span> --> 
                    </a> 
                    <!-- / ????????? ?????? ??? --> 
                    
                    <!-- ??????????????? --> 
                    <ul class="carousel-indicators"> 
                        <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0???????????????--> 
                        <li data-target="#demo" data-slide-to="1"></li> 
                        <li data-target="#demo" data-slide-to="2"></li>
                        <li data-target="#demo" data-slide-to="3"></li>
                    </ul> <!-- ??????????????? ??? --> 
                </div>
               </div>
              </div>

	<!-- ???????????? ?????? ??? -->


        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                	<% for(Product p : list){ %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <% if(p.getTitleImg() != null){ %> <!-- ???????????? ????????? ??? ?????? ????????? ?????? -->
                            <img class="card-img-top" src="<%=contextPath %>/resources/product_upfiles/<%= p.getTitleImg() %>" width="150px" height="300px" alt="..." />
                            <% }else{ %>
                            <img class="card-img-top" src="<%=contextPath %>/resources/product_upfiles/noImg.png" width="150px" height="300px" alt="..." />							
							<% } %>
                            <!-- Product details-->
                            <form action="<%=request.getContextPath()%>/orderForm.do" method="get">
                            
                            <!-- ?????????????????? ?????? ?????? -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                	<!-- Product Brand -->
                                	<%= p.getBrand() %>
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%= p.getP_name() %></h5>
                                    <!-- Product Color -->
                                    <%= p.getColor() %> <br>
                                    <!-- Product Capacity -->
                                    <%= p.getCapacity() %> <br>
                                    <!-- Product price-->
                                    <%= p.getPrice() %> ???
                                    
                                    <input type="hidden" name="brand" value="<%= p.getBrand() %>">
                                    <input type="hidden" name="name" value="<%= p.getP_name() %>">
                                    <input type="hidden" name="color" value="<%= p.getColor() %>">
                                    <input type="hidden" name="capacity" value="<%= p.getCapacity() %>">
                                    <input type="hidden" name="price" value="<%= p.getPrice() %>">
                                    <input type="hidden" name="pId" value="<%= p.getP_id()%>">
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                             	<% if(p.getP_stock() != 0) {%>
                                <div class="text-center"><button class="btn btn-dark btn-lg btn-block"
						 type="submit" id="submitBtn">????????????</button></div>
                           
                            	<% }else{ %>
                            	<div class="text-center"><button class="btn btn-dark btn-lg btn-block"
						 type="button" id="failButton">????????????</button></div>
						  		<% } %>
						  		 </div>
                            </form>
                        </div>
                    </div>
                   
               <%} %>    
                   
                </div>
            </div>
        </section>
        
        <!-- ???????????? ????????? -->
      <div class="pagingArea my-2" align="center">
         <!-- ??? ???????????? (<<) -->
         <button class="pageButton" onclick="location.href='<%=contextPath%>/productList.do?currentPage=1'"><i class="bi bi-chevron-double-left"></i> </button>
      
         <!-- ??????????????????(<) -->
         <%if(currentPage == 1){ %>
         <button class="pageButton" disabled>  <i class="bi bi-chevron-left"></i> </button>
         <%}else{ %>
         <button class="pageButton" onclick="location.href='<%= contextPath %>/productList.do?currentPage=<%= currentPage-1 %>'"> <i class="bi bi-chevron-left"></i> </button>
         <%} %>
         
         <!-- ????????? ?????? -->
         <%for(int p=startPage; p<=endPage; p++){ %>
            
            <%if(p == currentPage){ %>
            <button class="pageButton" style="background:#8f9dca" disabled> <%= p %> </button>
            <%}else{ %>
            <button class="pageButton" onclick="location.href='<%=contextPath %>/productList.do?currentPage=<%= p %>'"> <%= p %> </button>
            <%} %>
            
         <%} %>
         
         <!-- ??????????????????(>) -->
         <%if(currentPage == maxPage){ %>
         <button class="pageButton" disabled> <i class="bi bi-chevron-right"></i> </button>
         <%}else { %>
         <button class="pageButton" onclick="location.href='<%= contextPath %>/productList.do?currentPage=<%= currentPage+1 %>'"> <i class="bi bi-chevron-right"></i> </button>
         <%} %>
      
         <!-- ??? ????????? (>>) -->
         <button class="pageButton" onclick="location.href='<%=contextPath%>/productList.do?currentPage=<%=maxPage%>'"> <i class="bi bi-chevron-double-right"></i> </button>
		</div> 
		<br><br>
		
		
		
        <!-- Footer-->
		<%@ include file = "../../views/common/footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
    <script>
	$("#failButton").click(function(){
		alert("?????? ???????????? ???????????? ??? ????????????.")
	})

</script>
</html>
