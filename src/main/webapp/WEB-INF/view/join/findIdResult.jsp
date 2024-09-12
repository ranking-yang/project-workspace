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

</head>

<body>

	<div class="join-wrap">

		<div>
			<img src="/resources/common/image/logo.png"
				style="width: 150px; height: 102px;">
		</div>

		<div style="color: gray;">
			<div>아이디 찾기</div>
		</div>
		
		<div>
			${findid}
		</div>
		
	</div>

</body>

</html>