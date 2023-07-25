<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 공지사항</title>
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
				<div id="notice" class="as-side-menu-subtitle selected">공지사항</div>
				<div id="freq-questions" class="as-side-menu-subtitle">자주 묻는
					질문</div>
				<div id="one-on-one" class="as-side-menu-subtitle">1:1 문의</div>
			</div>
			<div id="as-board">
				<div id="as-board-title">
					<span>공지사항</span>
					<!-- <button id="write-btn">글쓰기</button> -->
				</div>
				<div id="as-board-list">
					<div id="as-board-list-category">
						<div>번호</div>
						<div>제목</div>
						<div>작성일</div>
					</div>
					<c:forEach items="${listInPage}" var="notice">
						<div class="as-board-list-board">
							<div>${notice.notice_code}</div>
							<div>
								<a href="/as/notice/detail?no=${notice.notice_code}">${notice.notice_title}</a>
							</div>
							<div>${notice.notice_date}</div>
						</div>
					</c:forEach>
				</div>
				<div id="as-board-list-page-buttons">
					<button id="notice-prev-btn" class="move-buttons">&lt;</button>
					<c:forTokens delims="/" items="${pageBtnNum}" var="i">
						<c:choose>
							<c:when test="${i eq pagination.pageNum}">
								<input type="hidden" id="page-num" value="${pagination.pageNum}" />
								<input type="hidden" id="max-num" value="${pagination.maxNum}" />
								<button class="notice-page-buttons page-buttons selected"
									value="${i}">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="notice-page-buttons page-buttons" value="${i}">${i}</button>
							</c:otherwise>
						</c:choose>
					</c:forTokens>
					<button id="notice-next-btn" class="move-buttons">&gt;</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script src="/resources/as/js/as.js"></script>
	<%@ include file="../common/commonJs.jsp"%>
</body>
</html>