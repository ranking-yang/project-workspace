<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<c:url value="/resources/mypage/css/mypage-ticket-refund.css" var="mypage_refund_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${mypage_css}">
<link rel="stylesheet" href="${mypage_refund_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">환불상세내역</div>
		
		<div id="ticket-refund-con">
			<div class="ticket-refund-box">
				<div class="ticket-refund-box-title">예매내역 확인</div>
 
				<div id="ticket-value">
					<div id="poster">
						<img src="${ticket.poster}" alt="공연포스터" />
					</div>
					<div id="ticket-performance">
						<div id="ticket-performance-title">${ticket.performance_name}</div>
						<div class="ticket-performance-subtitle">장소</div>
						<div class="ticket-performance-txt">${ticket.place}</div>
						<div class="ticket-performance-subtitle">관람일</div>
						<div class="ticket-performance-txt">						
							<c:choose>
								<c:when test="${!empty ticket.booking_time}">
									${ticket.booking_date} / ${ticket.booking_time}
								</c:when>
								<c:otherwise>
									[유효기간 ~ ${ticket.booking_date}]
								</c:otherwise>
							</c:choose>   
						</div>
						<div class="ticket-performance-subtitle">선택옵션</div>
						<div class="ticket-option-value">
							<c:forEach items="${options}" var="option">
								<div>${option.booking_type} - ${option.booking_qty}매</div>
							</c:forEach>
						</div>
					</div>
				</div>

			</div>
			<div class="ticket-refund-box">
				<div class="ticket-refund-box-title">위약 공제금 확인</div>
				<div>※ 전액 환불 대상입니다</div>
			</div>
			<div class="ticket-refund-box">
				<div class="ticket-refund-box-title">환불금액</div>
				<div id="refund-value">
					<div>결제 금액</div>
					<div class="refund-value-db">${ticket.total_price}원</div>
					<div>결제 수단</div>
					<div class="refund-value-db">
						<c:choose>
							<c:when test="${ticket.payment_way eq 'cash'}">-</c:when>	
							<c:otherwise>카드</c:otherwise>			
						</c:choose>
					</div>
					<div>사용 쿠폰</div>
					<div class="refund-value-db">
						<c:choose>
							<c:when test="${!empty ticket.coupon_name}">${ticket.coupon_name }</c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</div>
					<div><b>최종 환불 금액</b></div>
					<div class="refund-value-db"><b>${ticket.total_price}원</b></div>
				</div>
			</div>
			<div class="ticket-refund-box">
				<div class="ticket-refund-box-title">환불진행 안내</div>
				<div id="ticket-refund-notice">
				· 환불 금액에 대한 카드결제 취소가 진행됩니다. <br>
				· 신용카드는 익월 청구액에서 제외되며, 체크카드는 카드사에 따라 영업일 기준 3~5일 후 연결된 계좌로 입금됩니다. <br>
				· 환불신청 후 철회 또는 티켓 사용이 불가합니다. 결제/취소 세부사항은 카드사 고객센터를 통해 확인해주세요.
				</div>
			</div>
			<div id="ticket-refund-btn">
				<div><input type="checkbox" id="refund-chk"> 환불진행 안내사항을 확인했습니다.</div>
				<div><button id="refund_btn">환불 진행하기</button></div>
			</div>
		</div>
		
		<input type="hidden" name="payment_code" value="${ticket.payment_code }" form="refund_form"/>
		<form action="/mypage/ticket/refund/request" id="refund_form" method="post"></form>
		
	</div>

	</div>	<!-- 메뉴 /div -->

	</div>	<!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

	<script>
		$('.mypage_menu_btn').eq(2).addClass('clicked');
		
		$('#refund_btn').click(function() {
		      if ($('#refund-chk').prop('checked')) {
				
		    	  if (confirm("정말 환불 하시겠습니까?")) {
		    		  $('#refund_form').submit();
					}		       	
		        
		      } else {
		        alert('환불 안내사항을 확인해주세요');
		      }
		});
	</script>

</body>
</html>