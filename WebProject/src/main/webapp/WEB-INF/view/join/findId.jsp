<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- <html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"> -->
<html>
<head>

<title>회원가입 작성 - 티켓킹</title>

<link rel="stylesheet" href="/resources/join/css/findId.css" />

</head>

<body>

	<div class="join-wrap">

		<div>
			<img src="/resources/join/images/logo.jpg"
				style="width: 150px; height: 102px;">
		</div>

		<div style="color: gray;">
			<div>아이디 찾기</div>
		</div>

		<form action="/new-join" method="post" autocomplete="off">

			<!-- 아이디 -->
			<section class="section-wrap-top">
				<input type="text" id="user-id" name="member_id" placeholder="아이디"
					class="input-box icon-id" oninput="removeSpace(this)"
					style="text-transform: lowercase;">
				<!-- 입력 형식에 맞지 않을 때 / 입력하지 않았을 때 얼럿 -->
				<div class="input-alret-id"></div>
			</section>

			<!-- 비밀번호 / 비밀번호 확인 -->
			<section class="section-wrap">
				<input type="password" id="user-pass" name="member_pwd"
					placeholder="비밀번호" class="input-box icon-pass"
					autocomplete="new-password">
				<div class="input-alret-password"></div>
			</section>

			<section class="section-wrap">
				<input type="password" id="user-pass-verify"
					name="member_pwd_verify" placeholder="비밀번호 확인"
					class="input-box icon-pass2" autocomplete="new-password">
				<div class="input-alret-password" style="visibility: hidden;"></div>
			</section>

			<!-- 이름 -->
			<section class="section-wrap">
				<input type="text" id="user-name" name="member_name"
					placeholder="이름" value="" class="input-box icon-name">
				<div class="input-alret-name"></div>
			</section>

			<!-- 이메일 -->
			<section class="section-wrap">
				<input type="text" id="user-email" name="member_email"
					placeholder="이메일" value="" class="input-box icon-email"
					oninput="removeSpace(this)">
				<div class="input-alret-email"></div>
			</section>

			<!-- 생년월일 -->
			<section class="section-wrap">
				<input type="text" id="user-birth-date" name="member_birth"
					placeholder="생년월일" value="" class="input-box icon-birth-date"
					oninput="removeSpace(this)">
				<div class="input-alret-birth-date"></div>
			</section>

			<!-- 휴대폰 인증 -->
			<section class="section-wrap">
				<div class="section-title">휴대폰 인증</div>
				<div class="flex-between">
					<div>
						<input type="tel" id="user-hphone" name="member_phone"
							maxlength="13" value="" onkeydown="checkChangeNumber();"
							placeholder="휴대폰 번호" class="input-box icon-hphone"
							style="width: 265px; padding-left: 50px;">
					</div>
					<div>
						<input type="button" id="input-hphone-btn" class="btn-hphone-on"
							value="인증요청">
					</div>
				</div>

			</section>
			
			<input type="submit" id="submitComplete" class="btn-submit"
				value="가입완료" alt="가입완료">

		</form>

	</div>

</body>

</html>