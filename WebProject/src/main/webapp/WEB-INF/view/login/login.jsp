<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>

<title>로그인 - 티켓킹</title>

<link rel="stylesheet" href="/resources/login/css/login.css" />
<script defer src="/resources/login/js/login.js"></script>
</head>
<body style="max-height: 650px;">

	<div class="login-wrap">
		<div>
			<img src="/resources/common/image/logo.png"
				style="width: 150px; height: 102px;"
				onclick="location.href='/main'">

		</div>

		<form action="/loginProc" method="post" autocomplete="off">
			<input type="hidden" name="r" value="/">

			<div style="margin-top: 50px;">
				<input type="text" name="member_id" placeholder="아이디"
					class="input-box icon-id">
			</div>
			<div style="margin-top: 20px;">
				<input type="password" name="member_pwd" placeholder="비밀번호"
					class="input-box icon-pass">
			</div>
			<div style="margin-top: 20px;">
				<input type="submit" class="login-btn" value="로그인">
			</div>

			<div class="login-submenu">
				<a href="/findId">아이디 찾기</a> <span>|</span> <a
					href="/findPassword">비밀번호 찾기</a> <span>|</span>
				<a id="join-btn" href="/user/newJoin">회원가입</a>

			</div>
		</form>

		<div class="simple-title">
			<div class="simple-line">
				<span class="simple-text">간편 로그인</span>
			</div>
		</div>

		<div class="social-wrap">
			<div>
				<button id="naver-login-btn" class="simple-login-btns">
					<img src="/resources/login/images/circle-naver.png"
						id="login-naver" class="social-join-btn" alt="네이버로그인">
				</button>
			</div>
			<div>
				<button id="kakao-login-btn" class="simple-login-btns">
					<img src="/resources/login/images/circle-kakao.png"
						id="login-kakao" class="social-join-btn" alt="카카오로그인">
				</button>
			</div>
		</div>

		<div class="join-noti">
			<a href="/bbs-detail.php?bbs-num=65&amp;tb=board-faq" target="-blank"
				alt="불편사항"> ※ 회원가입/로그인에 문제가 있어요! &gt; </a>
		</div>

		<br /> <a href="/admin" style="font-size: 20px;">관리자?</a>
	</div>

</body>
</html>