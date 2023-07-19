<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>회원가입 - 타임티켓</title>

<link rel="stylesheet" href="/resources/join/css/join.css" />

</head>
<body style="max-height: 650px;">

	<div class="join_wrap">
		<div>
			<img src="/resources/join/images/logo2.jpg"
				style="width: 150px; height: 102px;">
		</div>

		<div>
			<a id="join_btn" href="/new-join"> <input type="button"
				class="join_btn" value="타임티켓 회원가입">
			</a>
		</div>

		<div class="simple_title">
			<div class="simple_line">
				<span class="simple_text">간편 회원가입</span>
			</div>
		</div>

		<div class="social_wrap">
			<div>
				<img src="/resources/join/images/circle_naver.png" id="login_naver"
					class="social_join_btn" alt="네이버로그인">
			</div>
			<div>
				<img src="/resources/join/images/circle_kakao.png" id="login_kakao"
					class="social_join_btn" alt="카카오로그인">
			</div>
		</div>

		<div class="join_noti">
			<a href="/bbs_detail.php?bbs_num=65&amp;tb=board_faq" target="_blank"
				alt="불편사항"> 회원가입/로그인에 문제가 있어요! &gt; </a>
		</div>

	</div>

</body>
</html>