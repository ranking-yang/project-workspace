<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script defer src="/resources/mypage/js/email-verify-popup.js"></script>
<style>
	#container {
		display: grid;
		grid-template-columns: repeat(10, 1fr);
		grid-template-rows: 20px 20px;
		width: 270px;
	}
	
	#verify-code {
		grid-column: 1/7;
		grid-row: 1/2;
		margin-right: 5px;
	}
	
	#btn {
		grid-column: 7/9;
		grid-row: 1/2;
		background-color: #46c8b4;
		text-align: center;
		border: none;
		outline: none;
		border-radius: 10px;
		margin-right: 5px;
	}
	
	#re-try {
		grid-column: 9/11;
		grid-row: 1/2;
		background-color: #46c8b4;
		text-align: center;
		border: none;
		outline: none;
		border-radius: 10px;
	}
	
	#text {
		margin-top: 5px;
		grid-column: 1/11;
		grid-row: 2/3;
		font-size: 15px;
	}
</style>
</head>
<body>

	<h3>이메일 인증</h3>
	
	<div id="container">
		<label for="verify-code"></label>
		<input id="verify-code" type="text"/>
		<input id="btn" type="button" value="확인"/>
		<input id="re-try" type="button" value="재전송"/>
		<span id="text">이메일로 인증코드가 발송되었습니다.</span>
	</div>
	
</body>
</html>