<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${mypage_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 Q&A -->

	<div id="mypage_value">
		<div class="mypage_value_title">나의 Q&A</div>
		<div>
			<c:choose>
				<c:when test="${!empty userQna}">
					<c:forEach items="${userQna }" var="qna">
						<div class="qnaCon">
							<div class="qnaHeader">
								<c:if test="${qna.qa_answer ne null }">
									<div class="qnaStatus complete">답변완료</div>
								</c:if>
								<c:if test="${qna.qa_answer eq null }">
									<div class="qnaStatus processing">처리중</div>
								</c:if>
								<div class="qnaDate">${qna.qa_date }</div>
							</div>
							<div class="qnaBody">
								<div class="qnaPerformanceName" data-pk="${qna.performance_code }" data-category="${qna.main_category }">${qna.performance_name }</div>
								<div class="qnaContent">${qna.qa_content }</div>
							</div>
							<c:if test="${qna.qa_answer ne null }">
								<div class="qnaAnswer"><span class="ans">┗  A</span>  ${qna.qa_answer }</div>
							</c:if>
							<c:if test="${qna.qa_answer eq null }">
								<div></div>
							</c:if>
							</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="noValue">문의 내역이 없습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	</div>
	<!-- 메뉴 /div -->

	</div>
	<!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>
	<script src="/resources/mypage/js/mypage_qna.js"></script>
	<script>
		$('.mypage_menu_btn').eq(5).addClass('clicked');
	</script>

</body>
</html>