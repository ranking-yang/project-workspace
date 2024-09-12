<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 자주 묻는 질문</title>
<link rel="stylesheet" href="/resources/as/css/as.css">
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
				<div id="freq-questions" class="as-side-menu-subtitle selected">자주
					묻는 질문</div>
				<div id="one-on-one" class="as-side-menu-subtitle">1:1 문의</div>
			</div>
			<div id="as-board">
				<div id="as-board-title">자주 묻는 질문</div>
				<div id="freq-questions-top3-container">
					<div class="freq-question-top3-module" data-num="9">
						<div class="freq-q-top3-icon">
							<img src="/resources/as/images/freq-q-refund-icon.png" alt="">
						</div>
						<div class="freq-q-top3-title">
							<span class="freq-q-span">Q</span> 티켓을 환불하고 싶어요!
						</div>
					</div>
					<div class="freq-question-top3-module" data-num="5">
						<div class="freq-q-top3-icon">
							<img src="/resources/as/images/freq-q-ticket-icon.png" alt="">
						</div>
						<div class="freq-q-top3-title">
							<span class="freq-q-span">Q</span> 티켓은 어떻게 사용하나요?
						</div>
					</div>
					<div class="freq-question-top3-module" data-num="2">
						<div class="freq-q-top3-icon">
							<img src="/resources/as/images/freq-q-receipt-icon.png" alt="">
						</div>
						<div class="freq-q-top3-title">
							<span class="freq-q-span">Q</span> 티켓은 어떻게 예매하나요?
						</div>
					</div>
				</div>
				<div id="as-board-list">
					<div id="as-board-list-category-freq">
						<div>분류</div>
						<div>제목</div>
					</div>
					<c:forEach items="${listInPage}" var="freq">
						<div class="as-board-list-board-freq">
							<div><span class="faq-top">${freq.question_category}</span></div>
							<div>
								<a href="/as/freq/detail?no=${freq.question_code}">${freq.question_title}</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="as-board-list-page-buttons">
					<button id="freq-prev-btn" class="move-buttons">&lt;</button>
					<c:forTokens delims="/" items="${pageBtnNum}" var="i">
						<c:choose>
							<c:when test="${i eq pagination.pageNum}">
								<input type="hidden" id="page-num" value="${pagination.pageNum}" />
								<input type="hidden" id="max-num" value="${pagination.maxNum}" />
								<button class="freq-page-buttons page-buttons selected"
									value="${i}">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="freq-page-buttons page-buttons" value="${i}">${i}</button>
							</c:otherwise>
						</c:choose>
					</c:forTokens>
					<button id="freq-next-btn" class="move-buttons">&gt;</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script src="/resources/as/js/as.js"></script>
	<%@ include file="../common/commonJs.jsp"%>
</body>
</html>