<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.ArrayList, com.uni.admin.model.vo.*" %>
<%
	String contextPath = request.getContextPath();

	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon1.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet"/>

<style>
	.outer{
		width:100%;
		height:800px;
		background:black;
		color:white;
		margin:auto;
		margin-top:50px;
		margin-bottom: 50px;
	}
	
	#insertForm>table{
		border:1px solid white;
		text-align:center;
		width:650px;       
	}
	
	#insertForm>table input, #insertForm>table textarea{
		width:90%;
		box-sizing:border-box;
	}	
	
	
	.button{
		border-radius: 15px;
		border: 3px solid white;
		background: black;
		color: white;
	}
	
	
</style>
</head>
<body>

	<%@ include file = "adminMenubar.jsp" %>
	
	<div class="outer">
		<br>
		
		<h2 align="center">재고등록</h2>
		<br>
		
		<form id="insertForm" action="<%= contextPath %>/insertInventory.do" method="post" enctype="multipart/form-data">
			<table align="center" id="table">  	
				<thead>		          
					<tr>
						<th width="100">제품아이디</th>
						<td width="500">					
							<select id = "P_ID" name = "P_ID">
							<% for(Product p : list){ %>
								<option value="<%= p.getP_id() %>"><%= p.getP_id() %></option>								
							<% } %>
							</select>																	
						</td>
					</tr>						
				</thead>
				<tbody>							
				</tbody>
				<tfoot>
					<tr>
						<th>입출고</th>
						<td>
							<select id="inven" name="inven">
								<option value="입고">입고</option>
								<option value="출고">출고</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="text" name="AMOUNT" required></td>
					</tr>
				</tfoot>
								
			</table>            
			
			<br>

			<br>
			
			<div class="btns" align="center">
				<button type="reset" class="button" style="margin-right: 30px;" OnClick="javascript:history.back(-1)">취소하기</button>
				<button type="submit" class="button">등록하기</button>				
			</div>
		</form>
	</div>
	
	<%@ include file = "../../views/common/footer.jsp" %>
</body>
</html>
<script>

	$(function(){
		$("#P_ID").change(function(){
			var input = $("#P_ID").val();
			$.ajax({
				url : "inventorySelect.do",
				data : {keyword:input},
				type : "get",
				success : function(map) {
					
					var $tableBody = $("#table tbody")
					$tableBody.html("");
					$.each(map["jArr"], function(index, value){
						console.log(value)
						
						var $tr1 = $("<tr>");
						var $th1 = $("<th>").text("제품명");
						var $nameTd = $("<td>").text(value.p_name); // <td>1</td>
						var $tr2 = $("<tr>");
						var $th2 = $("<th>").text("제조사");
						var $brandTd = $("<td>").text(value.brand);
						var $tr3 = $("<tr>");
						var $th3 = $("<th>").text("색상");
						var $colorTd = $("<td>").text(value.color);
						var $tr4 = $("<tr>");
						var $th4 = $("<th>").text("용량");
						var $capacityTd = $("<td>").text(value.capacity);
						var $tr5 = $("<tr>");
						var $th5 = $("<th>").text("가격");
						var $priceTd = $("<td>").text(value.price);
						
												
						$tr1.append($th1);
						$tr1.append($nameTd);						
						$tr2.append($th2);
						$tr2.append($brandTd);
						$tr3.append($th3);
						$tr3.append($colorTd);
						$tr4.append($th4);
						$tr4.append($capacityTd);
						$tr5.append($th5);
						$tr5.append($priceTd);
						
						
						$tableBody.append($tr1);
						$tableBody.append($tr2);
						$tableBody.append($tr3);
						$tableBody.append($tr4);
						$tableBody.append($tr5);
												
						
						
				})
				
				},
				error : function(){
					console.log("ajax통신실패")
				}
			})
		})
	})
	
	
	
</script>