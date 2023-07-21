<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>

<title>로그인 - 관리자</title>

<link rel="stylesheet" href="/resources/login/css/login.css" />

</head>
<body style="max-height: 650px;">

	<div class="login-wrap">

		<div>
			<img src="/resources/login/images/logo2.jpg"
				style="width: 150px; height: 102px;">
		</div>

		<form action="/admin" method="post">
			<input type="hidden" name="r" value="/">

			<div style="margin-top: 50px;">
				<input type="text" name="id" placeholder="아이디"
					class="input-box icon-id">
			</div>
			<div style="margin-top: 20px;">
				<input type="password" name="pwd" placeholder="비밀번호"
					class="input-box icon-pass">
			</div>
			<div style="margin-top: 20px;">
				<input type="submit" class="login-btn" value="로그인">
			</div>
		</form>
	</div>

</body>
</html>