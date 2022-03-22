<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.uni.member.model.vo.Member"%>
<%
String brand = (String) request.getAttribute("brand");
String name = (String) request.getAttribute("name");
String color = (String) request.getAttribute("color");
String capacity = (String) request.getAttribute("capacity");
String price = (String) request.getAttribute("price");
String pId = (String) request.getAttribute("pId");
Member m = (Member) request.getSession().getAttribute("loginUser");
int userNo = m.getUserNo();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기 | HELLO SMART WORLD</title>
<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.1/examples/checkout/">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">
	<%@ include file="../../views/common/menubar.jsp"%>
	<div class="container col-md-6">
		<main>
			<div class="py-5 text-center"></div>

			<div class="row g-5">
				<div class="col-md-5 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary">Your cart</span> <span
							class="badge bg-primary rounded-pill">1</span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">Product name</h6>
								<small class="text-muted"><%=pId%></small>
							</div> <span class="text-muted"><%=price%>원</span>
						</li>
						<!-- <li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">Second product</h6>
								<small class="text-muted">Brief description</small>
							</div> <span class="text-muted">$8</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">Third item</h6>
								<small class="text-muted">Brief description</small>
							</div> <span class="text-muted">$5</span>
						</li> -->
						<li class="list-group-item d-flex justify-content-between"><span>Total
						</span> <strong><%=price%>원</strong></li>
					</ul>
					<!-- 버튼있던 자리 -->
				</div>
				<div class="col-md-7 col-lg-8">
					<h4 class="mb-3">Billing address</h4>
					<form action="<%= request.getContextPath() %>/orderProduct.do" method="post">
					<button class="w-100 btn btn-primary btn-lg" type="submit">주문하기</button>
					<input type="hidden" value="<%= pId %>" name="pId">
					<input type="hidden" value="<%= userNo %>" name="userNo">
						<div class="row g-3">
							<div class="col-sm-6">
								<label for="firstName" class="form-label">보내시는 분 성함</label> <input
									type="text" class="form-control" id="orderName" name="orderName" placeholder=""
									value="<%=m.getUserName()%>" required>
								<div class="invalid-feedback">성함을 입력해주세요</div>
							</div>

							<div class="col-sm-6">
								<label for="lastName" class="form-label">보내시는 분 연락처</label> <input
									type="tel" class="form-control" id="orderPhone" name="orderPhone" placeholder=""
									value="<%=m.getPhone()%>" required>
								<div class="invalid-feedback">연락처를 입력해주세요</div>
							</div>

							<hr class="my-4">

							<div class="col-sm-6">
								<label for="firstName" class="form-label">받으시는 분 성함</label> <input
									type="text" class="form-control" id="addrName" name="addrName" placeholder=""
									value="" required>
								<div class="invalid-feedback">성함을 입력해주세요</div>
							</div>

							<div class="col-sm-6">
								<label for="lastName" class="form-label">받으시는 분 연락처</label> <input
									type="tel" class="form-control" id="addrPhone" name="addrPhone" placeholder=""
									value="" required>
								<div class="invalid-feedback">연락처를 입력해주세요</div>
							</div>

							<div class="col-12">
								<label for="email" class="form-label">받으시는 분 주소</label>
								<div class="row">
								<div class="col-9">
								<input
									type="text" class="form-control" id="addrAddress" name="addrAddress"
									placeholder="" required>
								<div class="invalid-feedback">주소를 입력해주세요</div>
								</div>
								
								<div class="col-3">
								<button type="button" onclick="addressCheck();"
									class="btn btn-primary btn-m">주소검색</button>
							</div>
								</div>
							</div>
							
							<div class="col-12">
								<label for="address2" class="form-label">상세주소 </label> <input
									type="text" class="form-control" id="addrAddressDet" name="addrAddressDet"
									placeholder="" required>
								<div class="invalid-feedback">상세주소를 입력해주세요</div>
							</div>

							<div class="col-12">
								<input type="text" class="form-control" id="comment" name="comment"
									placeholder="배송요청사항을 입력해주세요">
							</div>
						</div>
						<hr class="my-4">

						<!--  <div class="form-check">
							<input type="checkbox" class="form-check-input" id="same-address">
							<label class="form-check-label" for="same-address">addr
								address is the same as my billing address</label>
						</div>

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info">
							<label class="form-check-label" for="save-info">Save this
								information for next time</label>
						</div>
						
						<hr class="my-4">-->

						<h4 class="mb-3">결제수단</h4>

						<div class="my-3">
							<div class="row col-md-12">
								<div class="form-check col-md-3 ">
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" value="101" required checked> <label
										class="form-check-label" for="deposit" >무통장입금</label>

								</div>
							</div>
							<div class="row col-md-12">
								<div class="form-check">
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" value="101" required> <label
										class="form-check-label" for="credit">신용카드</label>
								</div>
							</div>
						</div>

						 <!--  <div class="row gy-3">
							<div class="col-md-6">
								<label for="cc-name" class="form-label">Name on card</label> <input
									type="text" class="form-control" id="cc-name" placeholder=""
									required> <small class="text-muted">Full name
									as displayed on card</small>
								<div class="invalid-feedback">Name on card is required</div>
							</div>

							<div class="col-md-6">
								<label for="cc-number" class="form-label">Credit card
									number</label> <input type="text" class="form-control" id="cc-number"
									placeholder="" required>
								<div class="invalid-feedback">Credit card number is
									required</div>
							</div>

							<div class="col-md-3">
								<label for="cc-expiration" class="form-label">Expiration</label>
								<input type="text" class="form-control" id="cc-expiration"
									placeholder="" required>
								<div class="invalid-feedback">Expiration date required</div>
							</div>

							<div class="col-md-3">
								<label for="cc-cvv" class="form-label">CVV</label> <input
									type="text" class="form-control" id="cc-cvv" placeholder=""
									required>
								<div class="invalid-feedback">Security code required</div>
							</div>
						</div> -->
						<hr class="my-4">
					</form>
				</div>
			</div>
		</main>
	</div>
	<script>
		function addressCheck() {
			//https://postcode.map.daum.net/guide#usage
			new daum.Postcode(
					{
						oncomplete : function(data) {

							var roadAddr = data.roadAddress; // 도로명 주소 변수
							document.getElementById("addrAddress").value = roadAddr;
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