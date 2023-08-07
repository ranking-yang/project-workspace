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
	
	<%@ include file="./mypage-menu.jsp"%> <!-- 메뉴 -->
			
			<!-- 나의 티켓 -->
	
			<div id="mypage_value">
				<div class="mypage_value_title">나의 찜목록</div>
				<div>
					<!-- tickets는 Controller에서 model로 보낸 키 값으로 바꾸세요 -->
					<!-- 가져온 값 출력 -->
					<c:choose>
					<c:when test="{!empty tickets}"></c:when>
					<c:otherwise><div class="noValue">찜한 작품이 없습니다.</div></c:otherwise>
					</c:choose>
				</div>
			</div>
	
		</div> <!-- 메뉴 /div -->
	
	</div> <!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>
	
	<script>
		$('.mypage_menu_btn').eq(1).addClass('clicked');
	</script>

</body>
</html>