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
        <link href="css/styles.css" rel="stylesheet"/>
        <link href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css" rel="stylesheet">


       
        <style type="text/css">
        	body{
				font-family: 'NanumBarunGothicYetHangul';
				}
        
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
                        <li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/adminProductListView.do">제품관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/SalesListView.do">매출조회</a></li>
                        <li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/inventoryManagementListView.do">재고관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/adminMemberListView.do">회원관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/adminReviewList.do">리뷰관리</a></li>             
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     
                     <%if(loginUser != null) {%>
                        <li class="nav-item"><a class="nav-link"><b><%=loginUser.getUserName() %> 님 </b> 의 방문을 환영합니다.</a></li>
						<li class="nav-item"><a class="nav-link" href="/HelloSmartWorld/logoutMember.do">로그아웃</a></li>
					<% } %>  
                    </ul>
                                      
                </div>
            </div>
        </nav>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>