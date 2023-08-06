<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/mypage/css/mypage_main.css" var="main_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<link rel="stylesheet" href="${main_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	<%@ include file="./mypage-menu.jsp"%> <!-- 메뉴 -->
			
			<!-- 마이페이지 value -->
	
			<div id="mypage_value">3</div>
	
		</div> <!-- 메뉴 /div -->
	
	</div> <!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

</body>
</html>