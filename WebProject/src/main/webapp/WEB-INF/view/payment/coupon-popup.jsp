<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유쿠폰</title>
<link rel="stylesheet" href="/resources/payment/css/coupon-popup.css">
<script defer src="/resources/payment/js/coupon-popup.js"></script>
</head>
<body>

	<h1 id="title">쿠폰목록</h1>

	<section id="coupon-container">
		<c:if test="${empty couponList}">
			<div class="noValue">사용 가능한 쿠폰이 없습니다.</div>
		</c:if>
		<c:forEach items="${couponList}" var="coupon">
			<div class="coupon" data-coupon-name="${coupon.coupon_name}"
				<c:choose>
					<c:when test="${empty coupon.discount_rate}">
						data-discount-money="${coupon.discount_money}"
					</c:when>
					<c:otherwise>
						data-discount-rate="${coupon.discount_rate}"
					</c:otherwise>
				</c:choose>
				data-member-coupon-code="${coupon.member_coupon_code}">
				<div class="contents">
					<div class="coupon-name text">${coupon.coupon_name}</div>
				</div>
				<div class="contents">
					<div class="expiry-date text">만료날짜: ${coupon.expiry_date}</div>
				</div>
				<c:choose>
					<c:when test="${empty coupon.discount_rate}">
						<div class="contents">
							<fmt:formatNumber type="number" var="discount_money" value="${coupon.discount_money}" />
							<div class="discount text">할인: ${discount_money}원</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="contents">
							<fmt:formatNumber type="percent" var="discount_rate" value="${coupon.discount_rate}" />
							<div class="discount text">할인: ${discount_rate}</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="contents">
					<div class="coupon-text">coupon</div>
				</div>
			</div>
		</c:forEach>
	</section>

</body>
</html>