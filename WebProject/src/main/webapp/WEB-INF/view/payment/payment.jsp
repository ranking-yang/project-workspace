<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/payment/css/payment.css" var="payment_css" />
<c:url value="/resources/payment/js/payment.js" var="payment_js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
    // 결제 객체 초기화
	 const market = "${api_market}";
	 var IMP = window.IMP; 
     IMP.init(market);
</script>
<link rel="stylesheet" href="${payment_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<div class="payment-con">
		<!-- 페이지 타이틀 -->
		<div class="payment-title">티켓 예매하기</div>

		<div class="payment-selected-con">
			<!-- 티켓 정보 -->
			<div>
				<div class="payment-selected-subtitle">티켓정보</div>
				<div class="payment-selected-box">
					<div class="payment-selected-box-title">티켓명</div>
					<div id="payment-ticketname">${performance.performance_name}</div>
					<div class="payment-selected-box-title">이용장소</div>
					<div>${performance.address}</div>
				</div>
			</div>

			<!-- 예매 정보 -->
			<div>
				<div class="payment-selected-subtitle" id="payment-orders">예매정보</div>

				<c:forEach items="${orders}" var="ticket">
					<div class="payment-selected-box">
						<div class="payment-selected-box-title">선택옵션</div>
						<div>
							<c:choose>
								<c:when test="${!empty ticket.booking_time}">
									<input type="text" name="booking_date" value="${ticket.booking_date}"
									form="payment_success_form" style="width:90px" readonly />
									<input type="text" name="booking_time" value="${ticket.booking_time}"
									form="payment_success_form" style="width:90px" readonly />
								</c:when>
								<c:otherwise>
									<input type="text" name="booking_date" value="${ticket.booking_date}"
									form="payment_success_form" readonly />
								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="payment-selected-box-title">권종</div>
						<div>
						<input type="text" name="booking_type" value="${ticket.booking_type}"
								form="payment_success_form" readonly />
					    </div>
						<div class="payment-selected-box-title">티켓가격</div>
						<div>
						<input type="text" class="popup-qty-price" name="booking_price"
						value="${ticket.booking_price}" form="payment_success_form" readonly />
						</div>
						<div class="payment-selected-box-title">수량</div>
						<div>
						<input type="text" class="qty-value" name="booking_qty" value="${ticket.booking_qty}"
						form="payment_success_form" readonly />
						</div>
						<div class="payment-selected-box-title">총 가격</div>
						<!-- 쿠폰에 의한 변동가격 기본베이스 -->
						<div class="base-price">${ticket.booking_price * ticket.booking_qty}</div>
					</div>
				</c:forEach>

				<!-- 이용자 정보 -->
				<div>
					<div class="payment-selected-subtitle">이용자정보</div>
					<div class="payment-selected-box">
						<div class="payment-selected-box-title">이름</div>
						<div id="user_name">${user.member_name}</div>
						<div class="payment-selected-box-title">핸드폰</div>
						<div id="user_ph">${user.member_phone}</div>
					</div>
				</div>

				<!-- 쿠폰 사용 -->
				<div>
					<div class="payment-selected-subtitle">쿠폰할인</div>
					<div class="payment-coupon">
						<input type="hidden" id="member-coupon-code"/>
						<div class="payment-selected-box-title">할인 금액</div>
						<div id="coupon-value" class="payment-coupon-value"></div>
						<div>
							<button class="payment-chkcoupon-btn">쿠폰 확인</button>
						</div>
						<div>
							보유 쿠폰 <b style="color: red;">${coupon_count}장</b>
						</div>
					</div>
				</div>
				<!-- 총 금액 -->
				<div class="payment-total">
					<div class="payment-selected-subtitle">총 결제금액</div>
					<div id="payment-total-Price">${totalPrice}원</div>
				</div>
				<!-- 환불규정, 이용약관 -->
				<div class="payment-selected-policy">
					<div class="payment-selected-policy-subtitle">📜 티켓 환불규정</div>
					<div>
						<button class="policy-slide-btn" id="policy-refund-btn">보기</button>
					</div>
					<div class="policy_txt" id="policy-refund-txt">
						<b>[환불규정]</b> <br> <br> - 티켓 유효기간 이내 : 전액 환불 <br> <b
							style="color: red;">- 티켓 유효기간 만료 후 : 환불 불가</b> <br> · 유효기간은
						예매 옵션 및 이용정보에서 확인 가능합니다. <br> · 같은 상품이라도 예매 시점 및 옵션에 따라 유효기간이
						다를 수 있습니다. <br> · 이미 사용한 티켓은 환불이 불가합니다. <br> <br> <b>[환불방법]</b>
						<br> <br> <b style="color: skyblue;">- [마이티켓 >
							예매내역]에서 [환불신청] 버튼 클릭 후 진행</b> <br> · 환불은 즉시 처리되며 이후 티켓은 이용할 수
						없습니다. <br> · 일부 결제수단은 관리자 확인 후 환불이 진행됩니다. <br> · 체크카드는
						입금까지 업무일(평일) 기준 3~5일 가량 소요됩니다. <br>
					</div>
					<div class="payment-selected-policy-subtitle">📜 주의사항 및 약관</div>
					<div>
						<button class="policy-slide-btn" id="policy-clause-btn">보기</button>
					</div>
					<div class="policy_txt" id="policy-clause-txt">
						<b>[예매시 주의사항]</b> <br> <br> · 공연티켓은 <b
							style="color: red;">관람 당일에는 환불/변경이 불가</b>합니다. <br> ·
						지각/지역착오/연령미숙지로 티켓을 사용하지 못한 경우라도 환불/변경이 불가합니다. <br> · 각 티켓마다
						이용방법 및 환불규정에 차이가 있으니, 반드시 상세페이지의 안내사항 및 환불규정을 정확히 확인하신 뒤 예매를 진행하시기
						바랍니다. <br> · 부분환불, 날짜/시간 변경은 지원하지 않으며, 전체 내역을 환불한 뒤 재예매하셔야
						합니다. <br>
					</div>
				</div>
				<!-- 결제하기 -->
				<div class="payment-chkBox">
					<div>
						<input type="checkbox" id="payment-chk"> 상단의 환불규정 / 주의사항 /
						약관을 확인하였으며 이에 동의합니다.
					</div>
					<div>
						<button id="payment-btn">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<input type="hidden" name="booker_code"
	value="${user.member_code}" form="payment_success_form" />
	
	<input type="hidden" name="performance_code"
	value="${performance.performance_code}" form="payment_success_form" />
	
	<form action="/payment/success" method="POST" id="payment_success_form" ></form>

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

	<script src="${payment_js}"></script>

</body>
</html>