<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | HELLO SMART WORLD</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#fff),
		to(#fff));
	background: -webkit-linear-gradient(bottom left, #fff 0%, #fff 100%);
	background: -moz-linear-gradient(bottom left, #fff 0%, #fff 100%);
	background: -o-linear-gradient(bottom left, #fff 0%, #fff 100%);
	background: linear-gradient(to top right, #fff 0%, #fff 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>
<body>
	<%@ include file="../../views/common/menubar.jsp"%>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-6 mx-auto mt-3">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form"
					action="<%=request.getContextPath()%>/insertMember.do" novalidate
					onsubmit="return joinValidate();" method="post">
					<div class="mb-3">
						<label for="name">아이디</label> <small style="color:gray;">(영문소문자/숫자, 4~12자)</small>
						<div class="row">
							<div class="col-md-9 ">
								<input type="text" class="form-control" id="userId"
									name="userId" placeholder="" value=""
									required>
								<div class="invalid-feedback">아이디를 입력해주세요.</div>
							</div>
							<div class="col-md-3">
								<button type="button" onclick="idCheck();"
									class="btn btn-dark btn-m">중복확인</button>
							</div>
						</div>
					</div>
					<div class="row">
					<div class="mb-3 col-md-6">
						<label for="name" >비밀번호</label> <small style="color:gray;">(영문소문자/숫자, 6~20자)</small> <input type="password"
							class="form-control" id="userPwd" name="userPwd"
							placeholder="" value=""
							required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3 col-md-6">
						<label for="name">비밀번호 확인</label> <input type="password"
							class="form-control" id="userPwdCheck" name="userPwdCheck"
							placeholder="" value="" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					</div>
					<hr>
					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="userName" name="userName"
							placeholder="한글로 입력해주세요." value="" required>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">일반전화<small style="color:gray;">&nbsp(선택사항)</small></label> <input type="tel" class="form-control" id="tel" name="tel"
								placeholder="02-123-1234" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" value="">

						</div>
						<div class="col-md-6 mb-3">
							<label for="name">휴대전화</label> <input type="tel"
								class="form-control" id="phone" name="phone"
								placeholder="010-1234-1234" value="" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" required >
							<div class="invalid-feedback">입력 양식을 확인해주세요</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="address">주소</label>
						<div class="row">
							<div class="col-md-9 ">
								<input type="text" class="form-control" id="address"
									name="address" placeholder="서울특별시 강남구" required>
								<div class="invalid-feedback">주소를 입력해주세요.</div>
							</div>
							<div class="col-md-3">
								<button type="button" onclick="addressCheck();"
									class="btn btn-dark btn-m">주소검색</button>
							</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소</label> <input type="text"
							class="form-control" id="addressDet" name="addressDet"
							placeholder="상세주소를 입력해주세요." required>
					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-dark btn-lg btn-block"
						onclick="pwdCheck();" type="submit" id="submitBtn" disabled>회원가입</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; SMART WORLD</p>
		</footer>
	</div>
	<script> 
	
	//모든 값에 입력하도록 제한
	window.addEventListener('load', () => { 
		const forms = document.getElementsByClassName('validation-form'); 
		Array.prototype.filter.call(forms, (form) => { 
			form.addEventListener('submit', function (event) { 
				if (form.checkValidity() === false) { 
					event.preventDefault(); 
					event.stopPropagation(); 
					} 
				form.classList.add('was-validated'); }
			, false); 
			}); 
		}, 
		false);
	
		//아이디 형식 먼저 체크하고 가능하면 중복체크
		function idCheck(){
			
			var userId = $('#userId').val();
			
			if(!(/^[a-z][a-z\d]{4,11}$/i.test($(".validation-form input[name=userId]").val()))){
				$(".validation-form input[name=userId]").focus();
				alert("아이디가 형식에 맞지 않습니다.")

			}else{
				
				$.ajax({

					url:"idCheck.do",
					type:"post",
					data:{userId:userId},
					success:function(result){
						if(result =="fail"){
							alert("사용할 수 없는 아이디입니다.");
							$('#userId').focus();	
						}else{
							//중복확인 후 가입 버튼 활성화시키고 아이디 변경할 수 없게 리드온리 속성 추가
							if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
								$('#userId').attr('readonly','true');
								$("#submitBtn").removeAttr("disabled");
							}else{
								$('#userId').focus();
							}
						}
					},
					error:function(){
						console.log("서버통신실패")
					}
				});
			}	
		}
		
	//비밀번호 일치, 비밀번호 정규식, 이름 정규식
	function joinValidate(){
		
		if($(".validation-form input[name=userPwd]").val() != $(".validation-form input[name=userPwdCheck]").val()){
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
			return false;			
		}
		
		if(!(/^[a-zA-Z0-9]{6,20}$/.test($(".validation-form input[name=userPwd]").val()))){
			alert("비밀번호는 영문자, 숫자의 조합으로 6~20글자까지 입력이 가능합니다.")
			return false;
		}		
		
		 if(!(/^[가-힣]{2,}$/.test($(".validation-form input[name=userName]").val()))){
			 alert("이름란엔 한글만 입력이 가능합니다.")
			 $(".validation-form input[name=userName]").focus();
	        return false;
		 }
		 
		 return true;
		
	}

	function addressCheck(){
		//https://postcode.map.daum.net/guide#usage
		new daum.Postcode({
	        oncomplete: function(data) {

	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            document.getElementById("address").value = roadAddr;
	        }
	    }).open();
		
		
	}
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<%@ include file="../../views/common/footer.jsp"%>
</body>
</html>