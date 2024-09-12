<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 1:1문의</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/ad03eb7935.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/as/css/as-one-on-one.css">
<%@ include file="../common/commonCss.jsp"%>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="body">
		<div id="as-container">
			<div id="as-side-menu">
				<div id="as-side-menu-title">고객센터</div>
				<div id="notice" class="as-side-menu-subtitle">공지사항</div>
				<div id="freq-questions" class="as-side-menu-subtitle">자주 묻는
					질문</div>
				<div id="one-on-one" class="as-side-menu-subtitle selected">1:1
					문의</div>
			</div>
			<div id="as-board">
				<div id="as-board-list-header">
					<div id="as-board-title">1:1 문의</div>
				</div>
				<div id="as-board-detail">
					<div id="as-board-list-category">
						<div class="onedetail-title">조회</div>
						<div></div>
					</div>
				</div>

				<!-- 여기서 만들어야됨 -->
				<!------------- S : 오른쪽 컨텐츠 영역 ----------->
				<div class="mypage_right_wrap">
					<div style="margin-top: 17px;">
						
						<div style="width: 805px; margin-top: 10px; border: 1px solid #ccc; overflow: hidden; font-size: 15px;">
							<div style="float: left; width: 100px; height: 45px; padding: 13px 15px; background: #eee;">
								제목</div>
							<div style="float: left; width: 700px; padding: 9px 20px; background: #f9f9f9;">
								<label id="select_title" style="width: 590px; height: 24px; padding: 2px 5px; font-size: 15px; color: #313131;">${oneselect.one_title}</label>
								<label id="select_date" style="width: 100px; height: 24px; padding: 2px 5px; font-size: 15px; color: #313131; float:right;">${oneselect.one_date}</label>
							</div>
						</div>
						<div style="margin-top: 10px; border: 1px solid #ccc; width: 805px; height: 200px;">
							<label id="select_content" style="width: 745px; border: none; font-size: 15px; color: #313131; line-height: 22px; padding: 15px; resize: none;">${oneselect.one_content}</label>
						</div>
					</div>
					<div style="margin-top: 17px;">
						<div style="width: 805px; margin-top: 10px; border: 1px solid #ccc; overflow: hidden; font-size: 15px;">
							<div style="float: left; width: 100px; height: 45px; padding: 13px 15px; background: #eee;">
								답변</div>
							<div style="float: left; width: 700px; padding: 9px 20px; background: #f9f9f9;">
								<label id="select_answerdate" style="width: 100px; height: 24px; padding: 2px 5px; font-size: 15px; color: #313131; float:right;">${oneselect.answer_date}</label>
							</div>
						</div>
						<div style="margin-top: 10px; margin-bottom: 20px; border: 1px solid #ccc; width: 805px; height: 150px;">
							<label id="select_answer" style="width: 745px; border: none; font-size: 15px; color: #313131; line-height: 22px; padding: 15px; resize: none;">${oneselect.one_answer}</label>
						</div>
					</div>
				</div>
				<!------------- E : 오른쪽 컨텐츠 영역 ----------->
			</div>

		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script src="/resources/as/js/as.js"></script>
	<%@ include file="../common/commonJs.jsp"%>
</body>
</html>