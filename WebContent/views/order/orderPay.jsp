<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.uni.member.model.vo.Member"%>
<%
String pId = request.getParameter("pId");
String addrName = request.getParameter("addrName");
String addrPhone = request.getParameter("addrPhone");
String addrAddress = request.getParameter("addrAddress");
String addrAddressDet = request.getParameter("addrAddressDet");
String comment = request.getParameter("comment") != "" ? request.getParameter("comment") : "요청사항 없음";
String payCode =request.getParameter("payCode");
String price = request.getParameter("price");
String userNo = request.getParameter("userNo");


Member m = (Member) request.getSession().getAttribute("loginUser");
String name = m.getUserName();
String phone = m.getPhone();
String address = m.getAddress();
String email = m.getEmail();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기 | HELLO SMART WORLD</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	 
	 <script>

	 
    $(function(){
    	var IMP = window.IMP; // 생략가능
		IMP.init('imp18234463');	//아임포트 관리자계정
		//결제 시스템을 실행시키는 함수
	  	IMP.request_pay({
	  		pg : 'html5_inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%=pId%>',
            amount : '100',
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					let purchaseVo = {
							pId : '<%=pId%>',
	                        addrName : '<%=addrName%>',
	                        addrPhone : '<%=addrPhone%>',
	                        addrAddress : '<%=addrAddress%>',
	                        addrAddressDet : '<%=addrAddressDet%>',
	                        comment : '<%=comment%>',
	                        payCode : '<%=payCode%>',
	                        price : '<%=price%>',
	                        userNo : '<%=userNo%>'
						
						}
					// 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
	                // 결제내역을 사용자에게 보여주기 위해 필요함.
	               			$.ajax({
						url : "orderProduct.do",
						type : "post",
						data : purchaseVo,
						dataType : "text",
						success : 
							location.href = "<%= request.getContextPath()%>/orderResult.do"
							,
						error : function(a,b,c){
							console.log("ajax 통신 실패")
						}
					});
				} else {
					var msg = '결제에 실패하였습니다. \n';
					msg += rsp.error_msg;
					alert(msg);
					location.href = "<%= request.getContextPath()%>/productList.do"
				}
			
			});
        
    });
    </script> 
    

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
</body>
</html>