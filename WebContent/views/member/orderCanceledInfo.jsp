<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.uni.order.model.vo.Order"%>
<%
Member m = (Member) request.getSession().getAttribute("loginUser");
ArrayList<Order> order = (ArrayList<Order>) request.getAttribute("order");
String msg = (String)request.getSession().getAttribute("msg");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회 | HELLO SMART WORLD</title>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
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
	<%@ include file="../../views/common/menubar.jsp"%>
	<section id="aa-product-category">
		<div class="container" align="center">
			<div class="row my-5">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="aa-product-catg-content">

						<div class="aa-product-catg-body">
							<div class="table-responsive">
							<h5>취소내역</h5><br>
								<table class="table table-striped">
									<tr class="danger">
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품명</th>
										<th>수량</th>
										<th>금액</th>
										<th>결제방법</th>
										<th>상세보기</th>
										
									</tr>
									<%
									if (order.isEmpty()) {
									%>
									<tr>
										<td colspan="7" align="center">취소내역이 없습니다.</td>
									</tr>
									<%
									} else {
									for (Order o : order) {
									%>

									<tr class="add">
										<td><%=o.getOrderNo()%></td>
										<td><%=o.getOrderDate()%></td>
										<td><%=o.getpId()%></td>
										<td><%=o.getAmount()%></td>
										<td><%=o.getPrice() + "원"%></td>
										<td><%=o.getPayCode() == 101 ? "무통장입금" : "신용카드"%></td>
										<td>

											<button type="button" class="btn btn-dark"
												data-toggle="modal" data-target="#myModal">상세보기</button> <!-- The Modal -->
											<div class="modal" id="myModal">
												<div class="modal-dialog">
													<div class="modal-content">

														<!-- Modal Header -->
														<div class="modal-header">
															<h5 class="modal-title">배송상세보기</h5>
														</div>

														<!-- Modal body -->
														<div class="modal-body">
															<h6>
																수취인 :
																<%=o.getAddrName()%></h6>
															<h6>
																연락처 :
																<%=o.getAddrPhone()%></h6>
															<h6>
																배송지 :
																<%=o.getAddrAddress()%></h6>
															<h6>
																상세주소 :
																<%=o.getAddrAddressDet()%></h6>
															<h6>운송장번호 :</h6>
														</div>

														<!-- Modal footer -->
														<div class="modal-footer">											
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">Close</button>
														</div>

													</div>
												</div>
											</div>
										</td>
										


									</tr>
									<%
									}
									}
									%>

								</table>

							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../../views/common/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>