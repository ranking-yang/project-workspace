<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="/resources/as/css/as.css">
<link rel="stylesheet" href="/resources/as/css/as-detail.css">
<script src="https://kit.fontawesome.com/ad03eb7935.js"
	crossorigin="anonymous"></script>
<%@ include file="../common/commonCss.jsp"%>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="body">
		<div id="as-container">
			<div id="as-side-menu">
				<div id="as-side-menu-title">고객센터</div>
				<div id="notice" class="as-side-menu-subtitle">공지사항</div>
				<div id="freq-questions" class="as-side-menu-subtitle selected">자주 묻는
					질문</div>
				<div id="one-on-one" class="as-side-menu-subtitle">1:1 문의</div>
			</div>
			<div id="as-board">
				<div id="as-board-title">자주 묻는 질문</div>
				<div class="as-board-detail">
					<div id="as-board-detail-header">
						<div id="as-board-detail-title">${freq.question_title}</div>
						<div id="as-board-detail-date">${freq.question_category}</div>
					</div>
					<div id="as-board-detail-body">
						<div id="as-board-detail-content">${freq.question_content}</div>
					</div>
					<div id="as-board-detail-footer">
						<div id="as-board-detail-listBtn">
							<button onclick="location.href='/as/freq'">목록</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script src="/resources/as/js/as.js"></script>
	<%@ include file="../common/commonJs.jsp"%>
</body>
</html>