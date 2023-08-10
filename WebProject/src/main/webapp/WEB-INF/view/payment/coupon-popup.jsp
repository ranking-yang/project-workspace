<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유쿠폰</title>
<link rel="stylesheet" href="/resources/payment/css/coupon-popup.css">
<script defer src="/resources/payment/js/coupon-popup.js"></script>
</head>
<body>

	<h1>쿠폰목록</h1>

	<section id="coupon-container">
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
				<div>
					<div>쿠폰</div>
				</div>
				<div>
					<div>${coupon.coupon_name}</div>
				</div>
				<div>
					<div>만료날짜: ${coupon.expiry_date}</div>
				</div>
				<div>
					<c:choose>
						<c:when test="${empty coupon.discount_rate}">
							<div>할인: ${coupon.discount_money}원</div>
						</c:when>
						<c:otherwise>
							<div>할인: ${coupon.discount_rate * 100}%</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:forEach>
	</section>

</body>
</html>