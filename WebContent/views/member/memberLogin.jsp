<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = String.valueOf(request.getAttribute("msg"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login | HELLO SMART WORLD</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->

</head>
<body>
	<%@ include file="../../views/common/menubar.jsp"%>
<script>
	var msg = "<%=msg%>";
	console.log(msg);
	
	$(function(){
		if(msg != "null"){
			alert(msg);
			<% request.removeAttribute("msg"); %>
		}
	}) 

</script>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" id="loginForm"
			action="<%=request.getContextPath()%>/memberLogin.do" method="post"
			onsubmit="return loginValidate();">
					<span class="login100-form-title p-b-26">
						HELLO <br> SMART WORLD!
					</span>
					<span class="login100-form-title p-b-48">
						<i class="fa fa-apple" aria-hidden="true"></i>
						<i class="fa fa-android" aria-hidden="true"></i>
					</span>

					<div class="wrap-input100 validate-input">
						<input class="input100" id="userId" type="text" name="userId">
						<span class="focus-input100" data-placeholder="Id"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="userPwd">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="loginBtn">
								Login
							</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="#" onclick="enrollPage();" id="enrollBtn">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	<script>
		function loginValidate() {
			if ($("#userId").val().trim().length === 0) {
				alert("아이디를 입력하세요")
				$("#userId").focus();
				return false;
			}

			if ($("#userPwd").val().trim().length === 0) {
				alert("비밀번호를 입력하세요")
				$("#userPwd").focus();
				return false;
			}

			return true;
		}
		
		function enrollPage(){
			
		location.href="<%= request.getContextPath() %>/joinMember.do";
			
		}
	</script>
<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>