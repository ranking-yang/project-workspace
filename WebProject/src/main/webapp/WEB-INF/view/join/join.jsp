<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>회원가입 - 티켓킹</title>

<link rel="stylesheet" href="/resources/join/css/join.css" />

</head>
<body style="max-height: 650px;">

	<div class="join-wrap">
		<div>
			<img src="/resources/join/images/logo2.jpg"
				style="width: 150px; height: 102px;">
		</div>

		<div>
			<a id="join-btn" href="/new-join"> <input type="button"
				class="join-btn" value="티켓킹 회원가입">
			</a>
		</div>

		<div class="simple-title">
			<div class="simple-line">
				<span class="simple-text">간편 회원가입</span>
			</div>
		</div>

		<div class="social-wrap">
			<div>
				<img src="/resources/join/images/circle-naver.png" id="login-naver"
					class="social-join-btn" alt="네이버로그인">
			</div>
			<div>
				<img src="/resources/join/images/circle-kakao.png" id="login-kakao"
					class="social-join-btn" alt="카카오로그인">
			</div>
		</div>

		<div class="join-noti">
			<a href="/bbs-detail.php?bbs-num=65&amp;tb=board-faq" target="-blank"
				alt="불편사항"> 회원가입/로그인에 문제가 있어요! &gt; </a>
		</div>

	</div>

</body>
</html>