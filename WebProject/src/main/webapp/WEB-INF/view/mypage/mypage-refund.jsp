<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<c:url value="/resources/mypage/css/mypage-ticket.css" var="mypage_ticket_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${mypage_css}">
<link rel="stylesheet" href="${mypage_ticket_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">취소/환불 내역</div>
		
			<c:choose>
				<c:when test="${!empty tickets}">
					<c:forEach items="${tickets}" var="ticket">
					
								<div id="mypage-ticket-con">
									
									<div id="mypage-ticket-top">
										<!-- 환불 스테이트에 따라서 바꾸기 -->
											<c:choose>
												<c:when test="${ticket.refund_status eq '환불요청'}"><div style="color: orange">환불요청</div></c:when>
												<c:otherwise><div style="color: gray">환불요청</div></c:otherwise>
											</c:choose>
											<div></div>
										<div>${ticket.refund_date }</div>
									</div>
										
									<div id="mypage-ticket-middle">										
										<!-- 포스터 -->
										<div>
						                    <img id="mypage-ticket-poster" src="${ticket.poster }" alt="공연포스터">
						                </div>
						                <!-- 공연 내역 -->
										<div>
											<div>${ticket.performance_name }</div>
											<div> 
												<c:choose>
													<c:when test="${!empty ticket.booking_time }">${ticket.booking_date } / ${ticket.booking_time }</c:when>
													<c:otherwise>유효기간 : ~ ${ticket.booking_date }</c:otherwise>
												</c:choose>
											</div>
											<div>총 ${ticket.booking_total_qty }매 / ${ticket.total_price }원</div>
											<div class="done">
													※ 이용 불가한 티켓입니다.
												</div>
										</div>
										<!-- 버튼들 -->
										<div>
											<div><button class="mypage-ticket-btn" onclick="goToDetail('${ticket.refund_code}')">환불내역</button></div>
										</div>
									</div>			
								</div>
											
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="noValue">취소/환불 내역이 없습니다.</div>
				</c:otherwise>
			</c:choose>

	</div>	<!-- 메뉴 /div -->

	</div>	<!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

	<script>
		$('.mypage_menu_btn').eq(3).addClass('clicked');
	</script>

</body>
</html>