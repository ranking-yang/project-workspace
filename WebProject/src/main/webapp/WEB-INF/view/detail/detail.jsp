<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/commonCss.jsp" %>
<title>상세페이지</title>
</head>
<body>
	
	<%@ include file="../common/header.jsp" %>	
	
	<!-- detail -->
	<div style="background-color: rgb(244, 244, 244); padding-bottom: 20px">
	
		<jsp:include page="./detailTop.jsp" />
		
		<jsp:include page="./detail_bottom.jsp" />		
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<%@ include file="../common/commonJs.jsp" %>

</body>
</html>