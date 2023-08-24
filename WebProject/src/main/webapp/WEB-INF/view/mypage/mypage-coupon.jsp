<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/mypage/css" var="mypage_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<link rel="stylesheet" href="${mypage_css}/mypage.css">
<link rel="stylesheet" href="${mypage_css}/mypage-coupon.css" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">나의 쿠폰</div>
		<div id="coupon-container">
			<!-- tickets는 Controller에서 model로 보낸 키 값으로 바꾸세요 -->
			<!-- 가져온 값 출력 -->
			<c:if test="${empty coupons}">
				<div class="noValue">사용 가능한 쿠폰이 없습니다.</div>
			</c:if>
			<c:forEach items="${coupons}" var="coupon">
				<div class="coupon-elements">
					<div class="contents">
						<div class="coupon-name text">${coupon.coupon_name}</div>
					</div>
					<div class="contents">
						<div class="expiry-date text">만료기한: ${coupon.expiry_date}</div>
					</div>
					<c:choose>
						<c:when test="${empty coupon.discount_rate}">
							<div class="contents">
								<fmt:formatNumber type="number" var="discount_money"
									value="${coupon.discount_money}" />
								<div class="discount text">${discount_money}원</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="contents">
								<fmt:formatNumber type="percent" var="discount_rate"
									value="${coupon.discount_rate}" />
								<div class="discount text">${discount_rate}</div>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="contents">
						<div class="coupon-text">coupon</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	</div>
	<!-- 메뉴 /div -->

	</div>
	<!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

	<script>
		$('.mypage_menu_btn').eq(0).addClass('clicked');
	</script>

</body>
</html>