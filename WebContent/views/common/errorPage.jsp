<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR | HELLO SMART WORLD</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css" rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<style type="text/css">
        
        body{
font-family: 'NanumBarunGothicYetHangul';}
</style>
</head>
<body>
	<h1 align="center"><%= message %></h1>
	<div align = "center">
	<button onclick = "location.href='<%= request.getContextPath()%>'" style ="width:50%">홈으로 돌아가기</button>
	</div>
</body>
</html>