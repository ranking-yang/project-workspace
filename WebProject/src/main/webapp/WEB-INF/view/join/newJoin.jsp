<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"> -->
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 작성 - 티켓킹</title>

<link rel="stylesheet" href="/resources/join/css/newJoin.css" />
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		
		var check = false;
		checkphone = false;
		$("#input-hphone-btn").click(function() {
			const phone = $("#user-hphone").val();
			console.log(phone);
	        $.ajax({
	            url : "/sms/test", // send로 변경시 sms 보냄.
	            type: "POST",
	            data: {to:phone},
	            cache : false,
	            dataType: "text",
	            success : function(result) {
	            	console.log(result);
	            	var obj = JSON.parse(result);
	            	console.log(obj.smsConfirmNum);
	            	code = obj.smsConfirmNum;
	            	if(check == false){
	            		$("#smsArea").append("<div class='flex-between'><div>"
								+"<input type='code' id='code_input' class='input-box icon-hphone'"
								+" maxlength='13' style='width:265px; padding-left: 50px;'"
								+" placeholder='인증 번호'>"
								+"</div>"
								+"<div>"
								+"<input type='button' id='checkBtn' class='btn-hphone-on'"
								+" value=확인>"
								+"</div></div>");
	            		check = true;
	            	}else{
	            		console.log("이미 누름");
	            	}
	            	
	            },
	            error : function(){
	            	alert('휴대폰 틀림')
	            }
	        });
	    });
		
	
		$(document).on("click","#checkBtn", function() {
			
			if($("#code_input").val() == code){ // 위에서 저장한값을 ㅣ교함
		          alert('인증성공')
		          /* $("#user-hphone").attr("disabled",true); */
		          $("#code_input").attr("disabled",true);
		          $("#checkBtn").attr("disabled",true);
		          $("#input-hphone-btn").attr("disabled",true);
		      }else{
		    	  
		      }
	    });
		
		/* $(document).on("click","#submitComplete", function() {
			$.ajax({
	            url : "/sms/test", // send로 변경시 sms 보냄.
	            type: "POST",
	            data: {to:phone},
	            cache : false,
	            dataType: "text",
	            success : function(result) {
	            	if(${"#user-id"}.val() == ""){
	            	}else if(){
	            	
	            	}else if(){
	            		
	            	}else if(){
	            		
	            	}
	            }
	            error : function(){
	            	
	            } 
	    });*/
		});
	 $(document).ready(function() {
	    $(document).on("click","#check-id-btn", function() {
			console.log("test");	
			
			var userid = $("#user-id").val();
			console.log(userid);
			$.ajax({
	            url : "/join/idcheck", 
	            type: "POST",
	            data: {id:userid},
	            cache : false,
	            dataType: "text",
	            success : function(result) {
	            	alert(result);
	            	
	            }
		});
	    
	    });
	    
	});
    </script>
</head>

<body>

	<div class="join-wrap">

		<div>
			<img src="/resources/common/image/logo.png" 
				style="width: 150px; height: 102px;"
				onclick="location.href='/main'">
		</div>

		<div style="color: gray; font-size: 25px;">

			<div>회원가입</div>
		</div>

		<form th:action="@{/user/newJoin}" method="post">
			<!-- 아이디 autocomplete="off"-->
			<section class="section-wrap-top">
				<div>
					<input type="text" id="user-id" name="member_id" placeholder="아이디"
					class="input-box icon-id" value="${member.member_id}"
					style="text-transform: lowercase; width:265px; padding-left:50px;">
					<input type="button" id="check-id-btn" class="btn-hphone-on"
						value="중복확인">
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

			<!-- 이름 -->
			<section class="section-wrap">
				<input type="text" id="user-name" name="member_name"
					placeholder="이름" value="${member.member_name}" class="input-box icon-name">
				<div class="input-alret-name"><span>${valid_member_name}</span></div>
			</section>

			<!-- 이메일 -->
			<section class="section-wrap">
				<input type="text" id="user-email" name="member_email"
					placeholder="이메일" value="${member.member_email}" class="input-box icon-email"
					oninput="removeSpace(this)">
				<div class="input-alret-email"><span>${valid_member_email}</span></div>
			</section>

			<!-- 생년월일 -->
			<section class="section-wrap">
				<input type="text" id="user-birth-date" name="member_birth"
					placeholder="생년월일" value="${member.member_birth}" class="input-box icon-birth-date"
					oninput="removeSpace(this)">
				<div class="input-alret-birth-date"><span>${valid_member_birth}</span></div>
			</section>

			<!-- 휴대폰 인증 -->
			<section class="section-wrap" id="smsArea">
				<div class="section-title">휴대폰 인증</div>
				<div class="flex-between">
					<div>
						<input type="tel" id="user-hphone" name="member_phone" 
							maxlength="13" value="${member.member_phone}"
							placeholder="휴대폰 번호" class="input-box icon-hphone"
							style="width: 265px; padding-left:50px;">
					</div>
					<div>
						<input type="button" id="input-hphone-btn" class="btn-hphone-on"
							value="인증요청">
					</div>
				</div>
				<div class="input-alret-phone"><span>${valid_member_phone}</span></div>
			</section>
			<!--  
			<section class="section-wrap" style="margin-top: 30px;">
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
			</section>
			-->
			<input type="submit" id="submitComplete" class="btn-submit"
				value="회원가입" alt="회원가입">
			<!-- <button>등록</button> -->

			<div class="join-submenu">
			<a href="/login">로그인</a> 
			<span>|</span> 
			<a href="/findId">아이디 찾기</a> 
			<span>|</span>
			<a href="/findPassword">비밀번호 찾기</a>

			</div>
		</form>
		
	</div>

</body>

</html>