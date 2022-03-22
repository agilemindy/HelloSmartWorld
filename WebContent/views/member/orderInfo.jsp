<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회 | HELLO SMART WORLD</title>
</head>
<body>
<%@ include file = "../../views/common/menubar.jsp" %>
<a href="/HelloSmartWorld/orderForm.do">주문하기</a>
	<section id="aa-product-category" >
		<div class="container"   align="center">
			<div class="row" >
				<div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
					<div class="aa-product-catg-content">

						<div class="aa-product-catg-body">
							<div class="table-responsive"> 
								<table class="table table-striped" >
									<tr class="danger">
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품명</th>
										<th>결제 금액</th>
										<th>주문 상세</th>
										<th><a href="https://tracker.delivery/#/:carrier_id/:track_id" target="_blank">배송조회</a></th>
										<!-- https://tracker.delivery/guide -->
										<!-- http://info.sweettracker.co.kr/apidoc/ -->
									</tr>
									<tr class="add">
										<% %>
									</tr>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<%@ include file = "../../views/common/footer.jsp" %>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>