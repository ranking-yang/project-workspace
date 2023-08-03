<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="th" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- <html lang="ko" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"> -->
<html>
<head>
<meta charset="EUC-KR">
<<<<<<< Updated upstream
<title>회원가입 작성 - 티켓킹</title>
=======
<title>아이디 찾기 - 티켓킹</title>
>>>>>>> Stashed changes

<link rel="stylesheet" href="/resources/join/css/findId.css" />
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
<<<<<<< Updated upstream
								+"</div></div>");
=======
								+"</div></div><br>");
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
		});
=======
>>>>>>> Stashed changes
	    
	});
    </script>
</head>

<body>

	<div class="findid-wrap">

		<div>
			<img src="/resources/common/image/logo.png"
<<<<<<< Updated upstream
				style="width: 150px; height: 102px;">
		</div>

		<div style="color: gray;" class="section-title">
			<div>아이디 찾기</div>
		</div>

		<form th:action="@{/findId/find}" method="post">
=======
				style="width: 150px; height: 102px;"
				onclick="location.href='/main'">
		</div>
		<div style="color: gray; font-size: 25px;">
			<div>아이디 찾기</div>
		</div><br>
		
		<form th:action="@{/findId}" method="post">
>>>>>>> Stashed changes
			
			<!-- 이름 -->
			<section class="section-wrap">
				<input type="text" id="user-name" name="member_name"
					placeholder="이름" value="${member.member_name}" class="input-box icon-name">
				<div class="input-alret-name"><span>${valid_member_name}</span></div>
			</section>

<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
			<!-- 생년월일 -->
			<section class="section-wrap">
				<input type="text" id="user-birth-date" name="member_birth"
					placeholder="생년월일" value="${member.member_birth}" class="input-box icon-birth-date"
					oninput="removeSpace(this)">
				<div class="input-alret-birth-date"><span>${valid_member_birth}</span></div>
			</section>

			<!-- 휴대폰 인증 -->
			<section class="section-wrap" id="smsArea">
<<<<<<< Updated upstream
				<div class="section-title">휴대폰 인증</div>
=======
				<!-- <div class="section-title">휴대폰 인증</div> -->
>>>>>>> Stashed changes
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
			
<<<<<<< Updated upstream
			
			<input type="submit" id="submitComplete" class="findid-submit"
				value="아이디 찾기" alt="아이디 찾기">
			<!-- <button>등록</button> -->
			
			<div class="findid-submenu">
				<a href="/login">로그인</a> <span>|</span> <a
					href="/findPassword">비밀번호 찾기</a> <span>|</span>
				<a id="join-btn" href="/user/newJoin">회원가입</a>
			</div>
		</form>
		
=======
			<input type="submit" id="submitComplete" class="btn-submit"
				value="아이디 찾기" alt="아이디찾기">
			<!-- <button>등록</button> -->
			<div class="findid-submenu">
			<a href="/login">로그인</a> <span>|</span> <a
				href="/findPassword">비밀번호 찾기</a> <span>|</span>
			<a id="join-btn" href="/user/newJoin">회원가입</a>
		</div>
		</form>
		
		
>>>>>>> Stashed changes
	</div>

</body>

</html>