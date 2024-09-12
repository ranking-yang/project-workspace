<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<script src="https://kit.fontawesome.com/ad03eb7935.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${mypage_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	<%@ include file="./mypage-menu.jsp"%> <!-- 메뉴 -->
			
			<!-- 나의 티켓 -->
	
			<div id="mypage_value">
				<div class="mypage_value_title">나의 찜목록</div>
				<div>
					<!-- tickets는 Controller에서 model로 보낸 키 값으로 바꾸세요 -->
					<!-- 가져온 값 출력 -->
					<c:choose>
					<c:when test="${!empty wishlist}">
						<c:forEach var="product" items="${performances }">
							<div class="wish_product" data-category="${product.main_category}" data-pk="${product.performance_code}">
								<div class="poster">
									<img class="wish_poster" src="${product.poster}" alt="포스터">
								</div>
								<div class="wish_info">
									<div class="tag">
									<span>
					                    <c:set var="test" value="${product.address}" />${fn:substring(test, 0, 2)}
					                </span>
					                <span>
					                    ${product.sub_category}
					                </span>
									</div>
									<div class="wish_title">${product.performance_name }</div>
									<div class="wish_due">${product.start_date }~${product.end_date }</div>
									<div class="wish_price">${product.performance_price }원</div>
									<div>📍 ${product.place }</div>
								</div>
								<div class="wishBtns">
									<c:set var="liked" value="false" />
				                    <c:forEach var="wish" items="${wishlist}">
				                        <c:if test="${product.performance_code eq wish.performance_code}">
				                            <c:set var="liked" value="true" />
				                        </c:if>
				                    </c:forEach>
				                    <button class="likeBtn ${liked ? 'liked' : ''}" id="${product.performance_code}" onclick="toggleLike(event, '${product.performance_code}', '${member_code}')">
				                        <i class="fa-${liked ? 'solid' : 'regular'} fa-heart" style="color: ${liked ? '#e41b1b' : '#000000'};"></i>
				                    </button>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="noValue">찜한 작품이 없습니다.</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
	
		</div> <!-- 메뉴 /div -->
	
	</div> <!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>
	<script src="/resources/mypage/js/mypage_wishlist.js"></script>
	<script>
		$('.mypage_menu_btn').eq(1).addClass('clicked');
	</script>

</body>
</html>