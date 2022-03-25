<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.uni.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>

		<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HELLO SMART WORLD</title>
        
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">



       
        <style type="text/css">
        
        body{
font-family: 'NanumBarunGothicYetHangul';}


            *{box-sizing:board-box;}
            .video-film {box-shadow: rgba(0, 7, 15, 0.7) 0 0 0 9999px; z-index: 100;}
            .video-background {
                background: #000; position: fixed;
                top: 0; right: 0; bottom: 0; left: 0; z-index: -99;
            }
            .video-foreground, .video-background iframe {
                position: absolute; top: 0; left: 0;
                width: 100%; height: 100%; pointer-events: none;
            }
            @media ( min-aspect-ratio : 16/9) {
                .video-foreground {height: 300%; top: -100%;}
            }
            @media ( max-aspect-ratio : 16/9) {
                .video-foreground {width: 300%; left: -100%;}
            }
            h1 {color: white;}
            #visual-btn {
                z-index: 50; color: #fff; font-size: 20px; border: 2px solid #fff;
                padding: 12px 24px; border-radius: 5px; cursor: pointer; background-color: rgba(0, 0, 0, 0);
            }
            #visual-btn:hover {
                color: #ff6868; font-size: 20px; border: 2px solid #ff6868;
                padding: 12px 24px; border-radius: 5px; cursor: pointer;
            }
            #indexBtn {position: fixed; text-align: center}
            .center {position: absolute; top: 60%; left: 47%; margin: -50px 0 0 -50px;}
        </style>


</head>
<body>
<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/HelloSmartWorld">HELLO SMART WORLD</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/HelloSmartWorld">HOME</a></li>
						<% if(loginUser == null){ %>
						<li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/login.do">로그인</a></li>
						<% } %>
                        <li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/productList.do">제품보기</a></li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">리뷰페이지</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/HelloSmartWorld/reviewList.do">전체리뷰</a></li>
                                <%if(loginUser != null) {%>
                                <li><a class="dropdown-item" href="/HelloSmartWorld/myReviewList.do">내가 쓴 리뷰</a></li>
                                <li><a class="dropdown-item" href="/HelloSmartWorld/enrollFormReview.do">리뷰작성</a></li>                               
                            	<%}%>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/HelloSmartWorld/memberInfo.do">내정보보기</a></li>
                                <li><a class="dropdown-item" href="/HelloSmartWorld/orderInfo.do">주문내역보기</a></li>
                                <!-- <li><a class="dropdown-item" href="/HelloSmartWorld/shipmentInfo.do">배송 조회</a></li> -->
                                <li><a class="dropdown-item" href="/HelloSmartWorld/canceledOrderInfo.do">취소내역보기</a></li>
                                <%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
                                <li><a class="dropdown-item" href="/HelloSmartWorld/adminMain.do">관리자메뉴</a></li>
                            <% } %>
                            </ul>
                        </li>
                        <%if(loginUser != null) {%>
                        <li class="nav-item"><a class="nav-link"><b><%=loginUser.getUserName() %> 님 </b> 의 방문을 환영합니다.</a></li>
						<li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/logoutMember.do">로그아웃</a></li>
						<% } %>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>