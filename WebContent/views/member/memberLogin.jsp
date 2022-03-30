<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login | HELLO SMART WORLD</title>
<meta charset="UTF-8">
<meta name ="google-signin-client_id" content="413503261078-nvm7c9ko7u81283s7c33bpks6iuaf8ao.apps.googleusercontent.com">
<!--===============================================================================================-->
<link rel="icon" type="image/x-icon"
	href="resources/assets/favicon1.ico" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->

</head>
<body>
	<%@ include file="../../views/common/menubar.jsp"%>
	<script>
	var msg = "<%=msg%>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
			<%request.removeAttribute("msg");%>
		}
	}) 

</script>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" id="loginForm"
					action="<%=request.getContextPath()%>/memberLogin.do" method="post"
					onsubmit="return loginValidate();">
					<span class="login100-form-title p-b-26"> HELLO <br>
						SMART WORLD!
					</span> <span class="login100-form-title p-b-48"> <i
						class="fa fa-apple" aria-hidden="true"></i> <i
						class="fa fa-android" aria-hidden="true"></i>
					</span>

					<div class="wrap-input100 validate-input">
						<input class="input100" id="userId" type="text" name="userId">
						<span class="focus-input100" data-placeholder="Id"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<span class="btn-show-pass"> <i class="zmdi zmdi-eye"></i>
						</span> <input class="input100" type="password" name="userPwd"> <span
							class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" id="loginBtn">Login</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1"> Don’t have an account? </span> <a class="txt2"
							href="#" onclick="enrollPage();" id="enrollBtn"> Sign Up </a>
						
							<div id="GgCustomLogin"><a href="javascript:void(0)"> <span><i class="bi bi-google"></i> Join
										with Google</span>
							</a></div>
						
					</div>
				</form>
			</div>
		</div>
	</div>


	
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
		
		//회원가입 창으로 이동
		function enrollPage(){
			
		location.href="<%=request.getContextPath()%>/joinMember.do";

		}
		
		
		//구글 회원가입 API
		//처음 실행하는 함수
		function init() {
			gapi.load('auth2', function() {
				gapi.auth2.init();
				options = new gapi.auth2.SigninOptionsBuilder();
				options.setPrompt('select_account');
		        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
				options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
		        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
		        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
				gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
			})
		}

		function onSignIn(googleUser) {
			var access_token = googleUser.getAuthResponse().access_token
			$.ajax({
		    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의 후 가져온다.
				url: 'https://people.googleapis.com/v1/people/me'
		        // key에 자신의 API 키를 넣습니다.
				, data: {personFields:'birthdays', key:'AIzaSyD-7Bwwx7bw2U9b2dzTfpMWepu3mFazdAY', 'access_token': access_token}
				, method:'GET'
			})
			.done(function(e){
		        //프로필을 가져온다.
		        //id, pwd, name은 구글 프로필의 이름으로 설정.
		        //전화번호, 주소 등은 임의의 값을 넣어서 DB에 값을 인서트할 수 있게 함
				var profile = googleUser.getBasicProfile();
				
				$.ajax({
					url: "insertMembergoogle.do",
					type: "post",
					data:{
						userId : profile.getName(),
						userPwd : profile.getName(),
						userName : profile.getName(),
						tel : "",
						phone : "010-0000-0000",
						address : "일반 주소",
						addressDet : "상세 주소",
						email : profile.getEmail()
					},
					success:function(result){
						
						if(result == "success"){
							alert("헬로우! 스마트월드에 오신 것을 환영합니다. \n	구글 회원가입시 아이디와 비밀번호는 구글에서의 '프로필이름'입니다. \n 로그인 후 비밀번호를 꼭 변경해주세요.")
						}else{
							alert("동일한 아이디로 이미 회원가입되어있습니다.")
						}	
					},
					error:function(error){
						alert(error + "통신실패")
					}
				})
			})
			.fail(function(e){
				alert(e)
			})
		}
		function onSignInFailure(t){		
			alert("구글 회원가입을 중단하셨습니다.") //도중에 창 끄면 나오는 문구
		}
	</script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>