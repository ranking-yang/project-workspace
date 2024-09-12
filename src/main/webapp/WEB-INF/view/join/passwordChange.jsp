<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"> -->
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경 - 티켓킹</title>

<link rel="stylesheet" href="/resources/join/css/passwordChange.css" />

</head>

<body>

	<div class="pasw-wrap">

		<div>
			<img src="/resources/common/image/logo.png"
				style="width: 150px; height: 102px;" 
				onclick="location.href='/main'">
		</div>
		<div style="color: gray; font-size: 25px;">
			<div>비밀번호 변경</div>
		</div><br>
		
		<form th:action="@{/passwordChange}" method="post">
			<!-- 아이디 autocomplete="off"-->
			<section class="section-wrap-top">
				<div>
					<input type="text" id="user-id" name="member_id" placeholder="아이디"
					class="input-box icon-id" value="${member.member_id}"
					style="text-transform: lowercase;">
				</div>
				<div class="input-alret-id"><span>${valid_member_id}</span></div>
			</section> 
			
			<!-- 비밀번호 / 비밀번호 확인 -->
			<section class="section-wrap">
				<input type="password" id="user-pass" name="member_pwd"
					placeholder="비밀번호" class="input-box icon-pass"
					autocomplete="new-password">
					
				<div class="input-alret-password"><span>${valid_member_pwd}</span></div>
			</section>

			<section class="section-wrap">
				<input type="password" id="user-pass-verify"
					name="member_pwd_verify" placeholder="비밀번호 확인"
					class="input-box icon-pass2" autocomplete="new-password">
				<div class="input-alret-password"><span>${pwd_check}</span></div>
			
			</section>
			
			<input type="submit" id="submitComplete" class="btn-submit"
				value="비밀번호 변경" alt="비밀번호 변경">
			<!-- <button>등록</button> -->
			<div class="findpw-submenu">
			<a href="/login">로그인</a> 
			<span>|</span> 
			<a href="/findId">아이디 찾기</a> 
			<span>|</span>
			<a id="join-btn" href="/user/newJoin">회원가입</a>
		</div>
		</form>
		
	</div>

</body>

</html>