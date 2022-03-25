<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.uni.member.model.vo.Member, com.uni.order.model.vo.Order"%>
<%
	Member m = (Member) request.getSession().getAttribute("loginUser");
	
	Order order = (Order)request.getSession().getAttribute("order");

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
		<div class="py-5 text-center">
       <h2> 주문번호 <%= order.getOrderNo() %> </h2> 
      <p class="lead"><%= order.getpId() %> 제품 주문이 완료되었습니다. <br> 해당 주문내역은 마이페이지에서 확인 가능합니다.</p>
    </div>
			<div class="row g-5">
				<div class="col-md-5 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary">Your Order</span> <span
							class="badge bg-primary rounded-pill">1</span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0"><%= order.getpId() %></h6>
								<h6 class="my-0"><%= order.getPrice()+"원" %></h6>
							</div> 
						</li>						
					</ul>
					<button class="w-100 btn btn-primary btn-lg" type="button" onclick="myPage();">마이페이지 이동하기</button>
					
				</div>
				<div class="col-md-7 col-lg-8">
					<h4 class="mb-3">Billing address</h4>
						<div class="row g-3">
							<div class="col-sm-6">
								<label for="firstName" class="form-label">보내시는 분 성함</label> <input
									type="text" class="form-control" id="orderName" name="orderName" placeholder=""
									value="<%=m.getUserName()%>" readonly>
								<div class="invalid-feedback">성함을 입력해주세요</div>
							</div>

							<div class="col-sm-6">
								<label for="lastName" class="form-label">보내시는 분 연락처</label> <input
									type="tel" class="form-control" id="orderPhone" name="orderPhone" placeholder=""
									value="<%=m.getPhone()%>" readonly>
								<div class="invalid-feedback">연락처를 입력해주세요</div>
							</div>

							<hr class="my-4">

							<div class="col-sm-6">
								<label for="firstName" class="form-label">받으시는 분 성함</label> <input
									type="text" class="form-control" id="addrName" name="addrName" placeholder=""
									value="<%= order.getAddrName() %>" readonly>
								<div class="invalid-feedback">성함을 입력해주세요</div>
							</div>

							<div class="col-sm-6">
								<label for="lastName" class="form-label">받으시는 분 연락처</label> <input
									type="tel" class="form-control" id="addrPhone" name="addrPhone" placeholder="010-1234-1234"
									value="<%= order.getAddrPhone() %>" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" readonly>
								<div class="invalid-feedback">연락처를 입력해주세요</div>
							</div>

							<div class="col-12">
								<label for="email" class="form-label">받으시는 분 주소</label>
								<div class="row">
								<div class="col-9">
								<input
									type="text" class="form-control" id="addrAddress" name="addrAddress"
									value="<%= order.getAddrAddress() %>" readonly>
					
								</div>
								
								<div class="col-3">
								<button type="button" onclick="addressCheck();"
									class="btn btn-primary btn-m" disabled>주소검색</button>
							</div>
								</div>
							</div>
							
							<div class="col-12">
								<label for="address2" class="form-label">상세주소 </label> <input
									type="text" class="form-control" id="addrAddressDet" name="addrAddressDet"
									value="<%= order.getAddrAddressDet()%>"  readonly>
								
							</div>

							<div class="col-12">
								<input type="text" class="form-control" id="comment" name="comment" value="<%= order.getComment() %>"
									placeholder="배송요청사항을 입력해주세요" readonly>
							</div>
						</div>
						<hr class="my-4">

						<h4 class="mb-3">결제수단</h4>

						<div class="my-3">
							<div class="row col-md-12">
								<div class="form-check col-md-3 ">
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" value="101" disabled checked > <label
										class="form-check-label" for="deposit" >KG이니시스</label>

								</div>
							</div>
							<!-- <div class="row col-md-12">
								<div class="form-check">
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" value="201" disabled > <label
										class="form-check-label" for="credit">신용카드</label>
								</div>
							</div> -->
						</div>
						<hr class="my-4">
					
				</div>
			</div>
		</main>
	</div>
	<script>
	
		function myPage(){
			
			location.href = "<%=request.getContextPath() %>/orderInfo.do"
			
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