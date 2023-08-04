<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/detail/css/detailTop.css" var="top_css" />
<c:url value="/resources/detail/js/detailTop.js" var="top_js" />
<!-- CSS -->
<link rel="stylesheet" href="${top_css}">
<!-- Icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- calendar -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- body -->
<div class="detail-top-con">
	<!-- product-list로 돌아감 -->
	<div class="detail-top-now-category">
		📁 <a href="/product/performance?main_category=${performance.main_category}">${performance.main_category}> </a>
	</div>
	<!-- 카테고리 -->
	<div class="detail-top-left">
		<!-- 좌측 작품 소개 칸 -->
		<div class="detail-top-info">
			<img src="${performance.poster}" alt="포스터">
			<!-- 포스터 이미지 -->
			<!-- 좌측 포스터 텍스트-->
			<div class="detail-top-info-con">
				<div class="detail-top-info-icon">
					<!-- DB 지역 -->
					<c:set var="test" value="${performance.address}" />
					${fn:substring(test,0,2)}
				</div>
				<div class="detail-top-info-icon">${performance.sub_category}</div>
				<!-- DB 분야 -->
				<div class="detail-top-info-title">${performance.performance_name}</div>
				<!-- DB 제목 -->
				<div class="detail-top-info-openrun">
					<div class="detail-top-run-tit">
						<div>
							<span class="material-symbols-outlined">event_available</span>
						</div>
						<div class="detail-top-run-txt">${performance.start_date}~
							${performance.end_date}</div>
						<!-- DB 시작일~종료일 -->
					</div>
					<div class="detail-top-run-info">
						<div>
							<span class="material-symbols-outlined">schedule</span>
						</div>
						<div class="detail-top-run-txt">-</div>
						<!-- DB 총 공연 시간 -->
						<div>
							<span class="material-symbols-outlined">person</span>
						</div>
						<div class="detail-top-run-txt" id="detail-top-age">전체관람가</div>
						<!-- DB 연령대 -->
					</div>
					<div class="detail-top-run-tit">
						<div>
							<span class="material-symbols-outlined">location_on</span>
						</div>
						<div class="detail-top-run-txt">${performance.place}</div>
						<!-- DB 장소 -->
					</div>
				</div>
			</div>
			<div class="detail-top-info-price">
				<div>
					<div>티켓킹가</div>
					<div>구매 가능 티켓 수 : ${performance.performance_qty}매</div>
					<!-- DB 최저가 -->
				</div>
				<div id="lowestprice">
					<!-- DB 최저가 가격 -->
				</div>
			</div>
		</div>
		<!-- 여백 -->
		<div></div>
	</div>
	<div class="detail-top-right">
		<div class="popup-option">
			<div class="popup-text">옵션선택</div>
			<div id="popup-option-btn">
			[유효기간 ~
			<input type="text" name="booking_date"
				value="${performance.end_date}" form="payment_proceed_form" style="width: 80px;"
				readonly />
			]
			</div>
		</div>
		<div class="popup-qty">
			<!-- 권종/수량 -->
			<div class="popup-text">권종/수량선택</div>
			<c:forEach items="${discountRates}" var="discount">
				<div class="popup-qty-parent">
					<c:choose>
						<c:when test="${discount.generation eq 'adult'}">
							<input type="text" name="booking_type" value="일반"
								form="payment_proceed_form" readonly />
						</c:when>
						<c:when test="${discount.generation eq 'youth'}">
							<input type="text" name="booking_type" value="청소년"
								form="payment_proceed_form" readonly />
						</c:when>
						<c:when test="${discount.generation eq 'child'}">
							<input type="text" name="booking_type" value="어린이"
								form="payment_proceed_form" readonly />
						</c:when>
					</c:choose>
					<fmt:parseNumber var="price"
						value="${performance.performance_price - (performance.performance_price * discount.discount_rate)})"
						integerOnly="true" />
				    
					<input type="text" class="popup-qty-price" name="booking_price"
						value="${price}" form="payment_proceed_form" readonly />
					<div>원</div>
					<button class="qty-minus">-</button>
					<input type="text" class="qty-value" name="booking_qty" value="0"
						form="payment_proceed_form" readonly />
					<button class="qty-plus">+</button>
				</div>
			</c:forEach>

		</div>
		<div class="popup-totalPrice">
			<!-- 총 금액 -->
			<div>총 결제금액</div>
			<input type="text" name="total_price" value=""
				id="popup-totalPrice-value" form="payment_proceed_form" readonly />
			<div>원</div>
		</div>
		<!-- 결제하기 버튼 -->
		<input type="submit" id="popup-payment-btn" value="결제하기"
			disabled="disabled" form="payment_proceed_form" />
	</div>
</div>

<input type="hidden" name="performance_code"
	value="${performance.performance_code}" form="payment_proceed_form" />

<form action="/payment/request" id="payment_proceed_form" method="POST"></form>

<script>
		const totalQty = '${performance.performance_qty}';
	</script>
<script src="${top_js}"></script>