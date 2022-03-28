<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.uni.order.model.vo.Order, com.uni.member.model.vo.*"%>
<%

ArrayList<Order> order = (ArrayList<Order>) request.getAttribute("order");
String msg = (String) request.getSession().getAttribute("msg");
String contextPath = request.getContextPath();

PageInfo pi = (PageInfo) request.getAttribute("pi");
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회 | HELLO SMART WORLD</title>
<style>

.pageButton{
  background:rgb(73, 83, 113);
  color:#fff;
  border:none;
  position:relative;
  height:50px;
  font-size:11pt;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 6px;
}

.pageButton:hover{
  background:#fff;
  color:rgb(73, 83, 113);
  
}
.pageButton:before, .pageButton:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: rgb(73, 83, 113);
  transition:400ms ease all;
}
.pageButton:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.pageButton:hover:before,.pageButton:hover:after{
  width:100%;
  transition:800ms ease all;
}

</style>
<script	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
								<h5>주문내역</h5>
								<br>
								<table class="table table-striped">
									<tr class="danger">
										<th>주문번호</th>
										<th>주문일자</th>
										<th>상품명</th>
										<th>수량</th>
										<th>금액</th>
										<th>배송지 정보</th>
										<th></th>
										
									</tr>
									<%
									if (order.isEmpty()) {
									%>
									<tr>
										<td colspan="7" align="center">주문내역이 없습니다.</td>
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
										<td>
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
											<h6>
												배송요청사항 :
												<%=o.getComment()%></h6>
											<h6>운송장번호 : 운송장이 아직 등록되지 않았습니다.</h6>

										</td>

										<td><button type="button"
												class="btn btn-outline-secondary cancel">주문취소</button></td>
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
		<!-- 페이징바 만들기 -->
		<div class="pagingArea my-2" align="center">
			<!-- 맨 처음으로 (<<) -->
			<button class="pageButton" onclick="location.href='<%=contextPath%>/orderInfo.do?currentPage=1'">
				<i class="bi bi-chevron-double-left"></i></button>
				
			<!-- 이전페이지로(<) -->
			<%	if (currentPage == 1) {	%>
			<button class="pageButton" disabled><i class="bi bi-chevron-left"></i></button>
			<%	} else { %>
			<button class="pageButton" onclick="location.href='<%=contextPath%>/orderInfo.do?currentPage=<%=currentPage - 1%>'">
			<i class="bi bi-chevron-left"></i></button>
			<%	} %>

			<!-- 페이지 목록 -->
			<%	for (int p = startPage; p <= endPage; p++) {%>
			<%	if (p == currentPage) {	%>			
			<button class="pageButton" disabled><%=p%></button>
			<%  } else {  %>
			<button class="pageButton" onclick="location.href='<%=contextPath%>/orderInfo.do?currentPage=<%=p%>'"><%=p%></button>
			<%	}	%>
			<%	}	%>

			<!-- 다음페이지로(>) -->
			<%	if (currentPage == maxPage) {	%>
			<button class="pageButton" disabled><i class="bi bi-chevron-right"></i></button>
			<%	} else { %>
			<button class="pageButton"	onclick="location.href='<%=contextPath%>/orderInfo.do?currentPage=<%=currentPage + 1%>'">
				<i class="bi bi-chevron-right"></i>	</button>
			<%	}  %>

			<!-- 맨 끝으로 (>>) -->
			<button class="pageButton" onclick="location.href='<%=contextPath%>/orderInfo.do?currentPage=<%=maxPage%>'">
				<i class="bi bi-chevron-double-right"></i></button>
		</div>
	
	
	<script>
			//해당 라인의 주문취소 버튼을 누르면 오더넘버를 선택해 orderCancel.do로 값을 넘김
			$(".cancel").click(function(){
				
				var yn = confirm("주문을 취소하시겠습니까?")
				
				if(yn){
					var orderNo = $(this).parentsUntil().eq(1).children().eq(0).text();
					location.href = "<%=request.getContextPath()%>/orderCancel.do?orderNo="+ orderNo

							}

						});
	</script>
	<%@ include file="../../views/common/footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>