<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script defer src="/resources/mypage/js/mypage-info.js"></script>
<link rel="stylesheet" href="${mypage_css}">
<link rel="stylesheet" href="/resources/mypage/css/mypage-info.css">
<link
	href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
	rel="stylesheet">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">회원정보수정</div>
		<div id="info-container">
			<c:choose>
				<c:when
					test="${fn:startsWith(member.member_id, 'naver_') || fn:startsWith(member.member_id, 'kakao_')}">
					<div class="info-box">
						<input class="info" type="text" name="member_id"
							value="${member.member_id}" form="form" readonly>
						<span class="material-icons-outlined"> account_circle </span>
					</div>
					<div class="info-box">
						<input class="info" type="password" placeholder="간편로그인 연동 계정"
							disabled> <span class="material-icons-outlined">
							lock </span>
					</div>
					<div class="info-box">
						<input class="info" type="text" name="member_name"
							value="${member.member_name}" spellcheck="false" form="form">
						<span class="material-icons-outlined"> face </span>
					</div>
					<div class="info-box" id="email-box">
						<div>
							<input class="info" id="email" type="email" name="member_email"
								value="${member.member_email}" spellcheck="false" form="form">
							<span class="material-icons-outlined"> email </span> <span
								id="email-feedback" class="check-span"></span>
						</div>
						<div>
							<button id="email-verify">인증</button>
						</div>
					</div>
					<c:choose>
						<c:when test="${empty member.member_birth}">
							<script>
								alert('생일을 등록하고 생일쿠폰을 받아가세요');
							</script>
							<div class="info-box">
								<input class="info" type="date" name="member_birth" form="form" />
								<span class="material-icons-outlined"> cake </span>
							</div>
						</c:when>
						<c:otherwise>
							<div class="info-box">
								<fmt:parseDate var="birthString" value="${member.member_birth}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate var="birth" value="${birthString}"
									pattern="yyyy-MM-dd" />
								<input class="info" type="text" name="member_birth"
									value="${birth}" form="form" readonly> <span
									class="material-icons-outlined"> cake </span>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<div class="info-box">
						<input class="info" type="text" name="member_id"
							value="${member.member_id}" form="form" readonly> <span
							class="material-icons-outlined"> account_circle </span>
					</div>
					<div class="info-box">
						<input id="modify-pwd" class="info" type="password"
							placeholder="비밀번호변경">
						<span class="material-icons-outlined"> lock </span>
						<span id="password-feedback" class="check-span"></span>
					</div>
					<div class="info-box">
						<input id="modify-check" class="info" name="member_pwd"
							type="password" placeholder="비밀번호확인" form="form">
						<span class="material-icons-outlined" id="chk-icon"> lock </span>
						<span id="check-feedback" class="check-span"></span>
					</div>
					<div class="info-box">
						<input class="info" type="text" name="member_name"
							value="${member.member_name}" spellcheck="false" form="form">
						<span class="material-icons-outlined"> face </span>
					</div>
					<div class="info-box" id="email-box">
						<div>
							<input class="info" id="email" type="email" name="member_email"
								value="${member.member_email}" spellcheck="false" form="form">
							<span class="material-icons-outlined"> email </span>
							<span id="email-feedback" class="check-span"></span>
						</div>
						<div>
							<button id="email-verify">인증</button>
						</div>
					</div>
					<div class="info-box">
						<fmt:parseDate var="birthString" value="${member.member_birth}"
							pattern="yyyy-MM-dd" />
						<fmt:formatDate var="birth" value="${birthString}"
							pattern="yyyy-MM-dd" />
						<input class="info" type="text" name="member_birth"
							value="${birth}" form="form" readonly>
						<span class="material-icons-outlined"> cake </span>
					</div>
					<div class="info-box">
						<fmt:formatNumber var="phone" value="${member.member_phone}"
							pattern="###,####,####" />
						<c:set var="memberPhone" value="${fn:replace(phone, ',', '-')}" />
						<input class="info" id="phone" type="tel" name="member_phone"
							value="0${memberPhone}" form="form">
						<span class="material-icons-outlined"> phone_iphone </span>
						<span id="phone-feedback" class="check-span"></span>
					</div>
				</c:otherwise>
			</c:choose>
			<input type="hidden" value="false" id="verified-email"/>
			<input type="hidden" value="${member.member_email}" id="origin-email"/>
			<input type="hidden" value="${member.member_code}" name="member_code"
				form="form" />
			<input id="modify-btn" type="submit" value="수정"
				form="form" />
			<form id="form" method="post" action="/mypage/modify"></form>
		</div>
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