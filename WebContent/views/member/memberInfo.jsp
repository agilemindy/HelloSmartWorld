<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.uni.member.model.vo.Member"%>
<%
String msg = (String) (session.getAttribute("msg"));
Member m = (Member) request.getAttribute("loginUser");
String userName = m.getUserName();
String userId = m.getUserId();
String address = m.getAddress();
String addressDet = m.getAddressDet();
String tel = m.getTel() != null ? m.getTel() : "";
String phone = m.getPhone();
String email = m.getEmail();
String originUserPwd = m.getUserPwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 | HELLO SMART WORLD</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var msg = "<%=msg%>";
	console.log(msg);
	
	$(function(){
		if(msg != "null"){
			alert(msg);
			<%session.removeAttribute("msg");%>
		}
	})

</script>
</head>
<body>
	<%@ include file="../../views/common/menubar.jsp"%>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-6 mx-auto mt-3">
				<h4 class="mb-3"><%=userName%>님의 회원정보
				</h4>
				<form id="memberInfo" class="validation-form"
					action="<%=request.getContextPath()%>/updateMember.do"
					onsubmit="return joinValidate();" method="post">
					<div class="mb-3">
						<div class="row">
							<div class="col-md-6">
								<label for="name">아이디</label> <input type="text"
									class="form-control" id="userId" name="userId" placeholder=""
									value="<%=userId%>" readonly>
							</div>
							<div class="col-md-6">
								<label for="name">이름</label> <input type="text"
									class="form-control" id="userName" name="userName"
									placeholder="" value="<%=userName%>" readonly>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<div class="row">
							<div class="col-md-6">
								<label for="name">변경할 비밀번호</label><small style="color: gray;">
									(영문소문자/숫자, 6~20자)</small> <input type="password" class="form-control"
									id="userPwd" name="userPwd" placeholder="" value="">
							</div>
							<div class="col-md-6">
								<label for="password">비밀번호 확인</label> <input type="password"
									class="form-control" id="userPwdCheck" name="userPwdCheck"
									placeholder="" value="">
							</div>
							
								<input type="hidden"
									class="form-control" id="originPwd" name="originPwd"
									placeholder="" value="<%= originUserPwd %>">	
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">일반전화<small style="color: gray;">&nbsp(선택사항)</small></label>
							<input type="tel" class="form-control" id="tel" name="tel"
								placeholder="02-123-1234"
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" value="<%=tel%>">

						</div>
						<div class="col-md-6 mb-3">
							<label for="name">휴대전화</label> <input type="tel"
								class="form-control" id="phone" name="phone"
								placeholder="010-1234-1234" value="<%=phone%>"
								pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" required>
							<div class="invalid-feedback">입력 양식을 확인해주세요</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="address">주소</label>
						<div class="row">
							<div class="col-md-9 ">
								<input type="text" class="form-control" id="address"
									name="address" placeholder="서울특별시 강남구" value="<%=address%>"
									required>
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
							placeholder="상세주소를 입력해주세요." value="<%=addressDet%>" required>
					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="you@example.com" value=<%=email%> required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<hr class="mb-4">
					<div class="mb-4"></div>
					<div class="row mb-3">
						<div class="col-md-6 text-center">
							<button type="submit" class="btn btn-dark btn-m btn-block">회원정보
								수정</button>
						</div>
						<div class="col-md-6 text-center">
							<button type="button" onclick="deleteMem();"
								class="btn btn-dark btn-m btn-block">회원탈퇴</button>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	<script>

	function deleteMem(){
		
		//비밀번호 한 번 더 입력한 후에 회원탈퇴처리하기
		var pwd = prompt("회원탈퇴를 원하시면 고객님의 비밀번호를 입력해주세요.")
		
		if(pwd == "<%=originUserPwd%>"){
			
			var yn = confirm("정말 탈퇴하시겠습니까?");
			if(yn){
				location.href="<%=request.getContextPath()%>/deleteMem.do";
				} else {
					alert("회원탈퇴를 취소하셨습니다.")
				}
			} else {
				alert("비밀번호가 일치하지 않습니다.")
			}
		}

		function addressCheck() {
			//https://postcode.map.daum.net/guide#usage
			new daum.Postcode({
				oncomplete : function(data) {

					var roadAddr = data.roadAddress; // 도로명 주소 변수
					document.getElementById("address").value = roadAddr;
				}
			}).open();
		}

		function joinValidate() {

			if ($(".validation-form input[name=userPwd]").val() != ""
					|| $(".validation-form input[name=userPwdCheck]").val() != "") {

				if ($(".validation-form input[name=userPwd]").val() != $(
						".validation-form input[name=userPwdCheck]").val()) {
					alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.")
					return false;
				}

				if (!(/^[a-zA-Z0-9]{6,20}$/.test($(
						".validation-form input[name=userPwd]").val()))) {
					alert("비밀번호는 영문자, 숫자의 조합으로 6~20글자까지 입력이 가능합니다.")
					return false;
				}
			}
			return true;

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