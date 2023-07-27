<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- <html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"> -->
<html>
<head>

<title>회원가입 작성 - 티켓킹</title>

<link rel="stylesheet" href="/resources/join/css/newJoin.css" />
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#input-hphone-btn").click(function() {
			const phone = $("#user-hphone").val();
			console.log(phone);
	        $.ajax({
	            url : "/sms/send",
	            type: "POST",
	            data: {to:phone},
	            cache : false,
	            dataType: "text",
	            success : function(result) {
	            	code = result.smsConfirmNum;
	            	$("#flex-between").append("<div>"
							+"<input type=code id=code_input class=input-box icon-hphone"
							+" maxlength=13 style=width: 265px; padding-left: 50px;>"
							+"</div>"
							+"<div>"
							+"<input type=button id=checkBtn class=btn-hphone-on"
							+"value=확인>"
							+"</div>");
	            },
	            error : function(){
	            	alert('휴대폰 틀림')
	            	$("#flex-between").append("<div>"
							+"<input type=code id=code_input class=input-box icon-hphone"
							+" maxlength=13 style=width: 265px; padding-left: 50px;>"
							+"</div>"
							+"<div>"
							+"<input type=button id=checkBtn class=btn-hphone-on"
							+"value=확인>"
							+"</div>");
	            }
	        });
	    });
		
		$("#checkBtn").click(function() {
			if($("#code_input").val() == code){ // 위에서 저장한값을 ㅣ교함
		          alert('인증성공')
		      }else{
		          
		      }
	    });
	});
    </script>
</head>

<body>

	<div class="join-wrap">

		<div>
			<img src="/resources/join/images/logo.jpg"
				style="width: 150px; height: 102px;">
		</div>

		<div style="color: gray;">
			<div>(제약조건은 MembersDTO 확인)</div>
			<div>(휴대폰 인증 안됨)</div>
			<div>(오류 메세지 안 뜸..)</div>
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
							maxlength="13" value=""
							placeholder="휴대폰 번호" class="input-box icon-hphone"
							style="width: 265px; padding-left:50px;">
					</div>
					<div>
						<input type="button" id="input-hphone-btn" class="btn-hphone-on"
							value="인증요청">
					</div>
					
				</div>

			</section>
			
			<!-- <section class="section-wrap" style="margin-top: 30px;">
				<div class="section-title">이용약관 동의</div>

				<div class="checkbox-group" style="margin-top: 0;">
					<div class="checkbox-line check-all">
						<input type="checkbox" id="check-all" class="checkbox"> <label
							for="check-all">전체 동의</label>
					</div>
					<div class="checkbox-line">
						<input type="checkbox" id="check-1" class="checkbox"> <label
							for="check-1">만 14세 이상입니다<span class="check-req">(필수)</span></label>
					</div>
					<div class="checkbox-line detail-seperate">
						<div>
							<input type="checkbox" id="check-2" class="checkbox"> <label
								for="check-2">이용약관 동의<span class="check-req">(필수)</span></label>
						</div>
						<div>
							<a
								href="/html-file.php?file1=default.html&amp;file2=user-stipulation.html&amp;mode=join"
								class="check-detail" target="-blank">내용보기</a>
						</div>
					</div>
					<div class="checkbox-line detail-seperate" style="border: none;">
						<div>
							<input type="checkbox" id="check-3" class="checkbox"> <label
								for="check-3">개인정보 수집·이용 동의<span class="check-req">(필수)</span></label>
						</div>
						<div>
							<a
								href="/html-file.php?file1=default.html&amp;file2=user-defend-s.html&amp;mode=join"
								class="check-detail" target="-blank">내용보기</a>
						</div>
					</div>
				</div>
			</section> -->

			<input type="submit" id="submitComplete" class="btn-submit"
				value="가입완료" alt="가입완료">

		</form>
		
		
	</div>

</body>

</html>