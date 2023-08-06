<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${mypage_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	<%@ include file="./mypage-menu.jsp"%> <!-- 메뉴 -->
			
			<!-- 나의 티켓 -->
	
			<div id="mypage_value">
				<div class="mypage_value_title">예매내역</div>
					
					<c:choose>
					<c:when test="${!empty tickets}">
						<c:forEach items="${tickets}" var="ticket">
							
							<div id="mypage_ticket_con">
								
								<div>
									
									<!-- ticket에서 불러와서 출력하기 -->
									
									<!--  추가해야할것 → 상세내역, 환불하기, 후기작성 버튼 하면 경로 잡기 / 보내야할 값도 -->
									
								</div>
								
							</div>
							
						</c:forEach>
					</c:when>
						<c:otherwise><div class="noValue">예매 내역이 없습니다.</div></c:otherwise>
					</c:choose>
	
		</div> <!-- 메뉴 /div -->
	
	</div> <!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>
	
	<script>
		$('.mypage_menu_btn').eq(2).addClass('clicked');
	</script>

</body>
</html>