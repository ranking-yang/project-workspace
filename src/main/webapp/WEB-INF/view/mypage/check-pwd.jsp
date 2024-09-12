<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script defer src="/resources/mypage/js/check-pwd.js"></script>
<link rel="stylesheet" href="${mypage_css}">
<link rel="stylesheet" href="/resources/mypage/css/check-pwd.css">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">본인 확인</div>
		<div id="container">
			<input class="pwd-check box" type="text" name="member_id" value="${member.member_id}" form="form" readonly/>
			<input id="pwd-field" class="pwd-check box" type="password" name="member_pwd" placeholder="비밀번호를 입력해주세요" form="form"/>
			<input id="check-btn" class="box" type="submit" value="확인" form="form"/>
		</div>
		<form id="form" action="/mypage/info" method="POST"></form>
	</div>

	</div>
	<!-- 메뉴 /div -->

	</div>
	<!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

	<script>
		$('.mypage_menu_btn').eq(6).addClass('clicked');
	</script>

</body>
</html>