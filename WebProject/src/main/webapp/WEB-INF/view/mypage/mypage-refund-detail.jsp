<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<c:url value="/resources/mypage/css/mypage-ticket-detail.css" var="mypage_detail_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${mypage_css}">
<link rel="stylesheet" href="${mypage_detail_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">환불상세내역</div>
		
		<div class="mypage-detail-con">
			<div class="mypage-detail-ticket mypage-box">
				<div class="box-title">티켓명</div>
				<div class="value">${ticket.performance_name }</div>
				<div class="box-title">환불상태</div>
					<c:choose>
						<c:when test="${ticket.refund_status eq '환불요청'}">
							<div class="value" style="color: orange; font-weight: 500;">${ticket.refund_status}</div>
						</c:when>
						<c:otherwise>
							<div class="value" style="color: green; font-weight: 500;">${ticket.refund_status}</div>
						</c:otherwise>
					</c:choose>
				
				<div class="box-title">장소</div>
				<div class="value">${ticket.place }</div>
			</div>
			<div class="mypage-detail-option mypage-box">
				<div class="box-title">옵션</div>
				<div class="value">				
					<c:choose>
						<c:when test="${!empty ticket.booking_time }">${ticket.booking_date} / ${ticket.booking_time}
							( 
							<c:forEach items="${options}" var="option">
								${option.booking_type} ${option.booking_qty}매
							</c:forEach>
							)
						</c:when>
						<c:otherwise>유효기간 ~ ${ticket.booking_date} 
							( 
							<c:forEach items="${options}" var="option">
								${option.booking_type} ${option.booking_qty}매
							</c:forEach>
							)						
						</c:otherwise>
					</c:choose>					
				</div>
				<div class="box-title">환불번호</div>
				<div class="value">				
					${ticket.refund_code }
				</div>
			</div>
			<div class="mypage-detail-user mypage-box">
				<div class="box-title">이용자</div>
				<div class="value">				
					<sec:authentication property="principal.member_name"/>
				</div>
				<div class="box-title">결제금액</div>
				<div class="value">				
					${ticket.total_price}원
				</div>
				<div class="box-title">결제수단</div>
				<div class="value">				
					카드
				</div>
				<div class="box-title">환불요청일</div>
				<div class="value">				
					${ticket.refund_date}
				</div>
			</div>			
			<div id="back"><button id="back-btn">환불내역 전체보기</button></div>
		</div>
		
	</div>

	</div>	<!-- 메뉴 /div -->

	</div>	<!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

	<script>		
		$(document).ready(function() {
			
			 $('.mypage_menu_btn').eq(3).addClass('clicked');
		
		      $('#back-btn').click(function() {
		        location.href = '/mypage/refund';
		      });
		      
		  });
	</script>

</body>
</html>