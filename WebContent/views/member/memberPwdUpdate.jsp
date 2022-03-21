<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.uni.member.model.vo.Member" %>
<%
	String msg = (String)(session.getAttribute("msg"));
	Member m = (Member)request.getSession().getAttribute("loginUser");
	String userName = m.getUserName();
	String userId = m.getUserId();
	String address = m.getAddress();
	String addressDet = m.getAddressDet();
	String tel = m.getTel() != null ? m.getTel() : "";
	String phone = m.getPhone();
	String email = m.getEmail();
	String userPwd = m.getUserPwd();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 | HELLO SMART WORLD</title>
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-6 mx-auto mt-3">
				<h4 class="mb-3"></h4>
				<form id = "memberInfo" class="validation-form"
					action="<%=request.getContextPath()%>/updateMember.do"
					onsubmit="return joinValidate();" method="post">
					<div class="mb-3">					
						<div class="row">
							<div class="col-md-6">
							<label for="name">아이디</label>
								<input type="text" class="form-control" id="userId"
									name="userId" placeholder="" value="<%= userId %>"
									readonly>
							</div>
							<div class="col-md-6">
								<label for="name">이름</label> <input type="text"
							class="form-control" id="userName" name="userName"
							placeholder="" value="<%= userName %>" readonly>
							</div>
						</div>
					</div>
					
					<div class="row mb-3">
					<div class="col-md-4 text-center" >
				<button type="submit" class="btn btn-dark btn-m btn-block">회원정보 수정</button></div>
				<div class="col-md-4 text-center">
				<button type="button" onclick="updatePwd();" class="btn btn-dark btn-m btn-block">비밀번호 변경</button>
				</div>
				<div class="col-md-4 text-center"><button type="button" onclick="deleteMem();" class="btn btn-dark btn-m btn-block">회원탈퇴</button></div>
				
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>