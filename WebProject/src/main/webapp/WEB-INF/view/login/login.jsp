<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>

<title>로그인 - 타임티켓</title>

<link rel="stylesheet" href="/resources/login/css/login.css" />

</head>
<body style="max-height: 650px;">

	<div class="login_wrap">

		<div>
			<img src="/resources/login/images/logo2.jpg"
				style="width: 150px; height: 102px;">
		</div>

		<form action="/login/?mode=login_reg" method="post">
			<input type="hidden" name="r" value="/">

			<div style="margin-top: 50px;">
				<input type="text" name="member_id" placeholder="아이디"
					class="input_box icon_id">
			</div>
			<div style="margin-top: 20px;">
				<input type="password" name="member_pwd" placeholder="비밀번호"
					class="input_box icon_pass">
			</div>
			<div style="margin-top: 20px;">
				<input type="submit" class="login_btn" value="로그인">
			</div>

			<div class="login_submenu">
				<a href="/findId">아이디 찾기</a> <span>|</span> <a
					href="/findPassword">비밀번호 찾기</a> <span>|</span>
				<a id="join_btn" href="/join/">회원가입</a>
			</div>
		</form>

		<div class="simple_title">
			<div class="simple_line">
				<span class="simple_text">간편 로그인</span>
			</div>
		</div>

		<div class="social_wrap">
			<div>
				<img src="/resources/login/images/circle_naver.png" id="login_naver"
					class="social_join_btn" alt="네이버로그인">
			</div>
			<div>
				<img src="/resources/login/images/circle_kakao.png" id="login_kakao"
					class="social_join_btn" alt="카카오로그인">
			</div>
		</div>

		<div class="join_noti">
			<a href="/bbs_detail.php?bbs_num=65&amp;tb=board_faq" target="_blank"
				alt="불편사항"> ※ 회원가입/로그인에 문제가 있어요! &gt; </a>
		</div>

	</div>

</body>
</html>