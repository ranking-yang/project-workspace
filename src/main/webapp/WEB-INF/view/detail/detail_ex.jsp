<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<%@ include file="../common/commonCss.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaomapAppkey}" }></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		if (chkEndDate("${performance.end_date}")) {
			alert('판매가 종료된 상품입니다.');
			history.back();
		}
	});

	function chkEndDate(enddate) {
		let endDate = new Date(enddate + "T23:59:59");
		const today = new Date();

		if (endDate < today) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	
	<%@ include file="../common/header.jsp" %>	
	
	<!-- detail -->
	<div style="background-color: rgb(244, 244, 244); padding-bottom: 20px">
	
		<jsp:include page="./detailTop_ex.jsp" />
		
		<jsp:include page="./detail_bottom_ex.jsp" />		
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<%@ include file="../common/commonJs.jsp" %>

</body>
</html>