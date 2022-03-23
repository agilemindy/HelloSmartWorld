<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review | HELLO SMART WORLD</title>
<style type="text/css">

body {

	padding-top: 70px;

	padding-bottom: 30px;

}

.board_title {

	font-weight : 700;

	font-size : 22pt;

	margin : 10pt;

}

.board_info_box {

	color : #6B6B6B;

	margin : 10pt;

}

.board_author {

	font-size : 10pt;

	margin-right : 10pt;

}

.board_date {

	font-size : 10pt;

}

.board_content {

	color : #444343;

	font-size : 12pt;

	margin : 10pt;

}

.board_tag {

	font-size : 11pt;

	margin : 10pt;

	padding-bottom : 10pt;

}



</style>
</head>
<body>

	<article>

		<div class="container" role="main">

			<h2>board Content</h2>

			

			<div class="bg-white rounded shadow-sm">

				<div class="board_title">제목들어감</div>

				<div class="board_info_box">

					<span class="board_author">글쓴이 들어감,</span><span class="board_date">날짜들어감</span>

				</div>

				<div class="board_content">내용들어감</div>

				<div class="board_tag">별점 들어감 </div>

			</div>

			

			<div style="margin-top : 20px">

				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>

				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>

		</div>

		

	</article>



</body>
</html>