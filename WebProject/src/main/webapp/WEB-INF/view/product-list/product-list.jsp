<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연, 전시, 음악, 키즈 상세페이지</title>
<link rel="stylesheet"
	href="/resources/product-list/css/product-list.css">
<%@ include file="../common/commonCss.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://kit.fontawesome.com/ad03eb7935.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="product-container">
		<c:choose>
			<%--페이지 제목처리 --%>
			<c:when test="${main_category eq 'show'}">
				<div id="page-title">공연</div>
			</c:when>
			<c:when test="${main_category eq 'art'}">
				<div id="page-title">전시</div>
			</c:when>
			<c:when test="${main_category eq 'music'}">
				<div id="page-title">음악</div>
			</c:when>
			<c:when test="${main_category eq 'kid'}">
				<div id="page-title">키즈</div>
			</c:when>
			<c:when test="${main_category eq 'md_category'}">
				<div id="page-title">MD 추천작</div>
			</c:when>
			<c:when test="${main_category eq 'area' or not empty area_code}">
				<div id="page-title">지역별</div>
			</c:when>
		</c:choose>
		<div id="navmenu">
			<c:choose>
				<%--페이지 서브메뉴 처리 --%>
				<c:when test="${main_category eq 'area' or not empty area_code}">
					<div id="areaBtns">
						<span class="areaBtn" data-area="a01">서울</span> <span
							class="areaBtn" data-area="a02">경기</span> <span class="areaBtn"
							data-area="a03">강원</span> <span class="areaBtn" data-area="a04">인천</span>
						<span class="areaBtn" data-area="a05">충청</span> <span
							class="areaBtn" data-area="a06">세종</span> <span class="areaBtn"
							data-area="a07">대전</span> <span class="areaBtn" data-area="a08">전라</span>
						<span class="areaBtn" data-area="a09">광주</span> <span
							class="areaBtn" data-area="a10">경상</span> <span class="areaBtn"
							data-area="a11">부산</span> <span class="areaBtn" data-area="a12">대구</span>
						<span class="areaBtn" data-area="a13">울산</span> <span
							class="areaBtn" data-area="a14">제주</span>
					</div>
				</c:when>
				<c:otherwise>
					<div></div>
				</c:otherwise>
			</c:choose>
			<div id="filters">
				<span class="filter" data-sort="score">별점순</span>
				<span class="filter" data-sort="asc">최저가순</span>
				<span class="filter" data-sort="desc">최고가순</span>
			</div>
		</div>
		<div id="product">
			<c:forEach var="product" items="${performances}">
				<div class="product-module" data-category="${product.main_category}"
					data-pk="${product.performance_code}">
					<img class="product-module-poster" src="${product.poster}"
						alt="포스터">
					<div class="product-module-top">
						<div class="tag">
							<c:choose>
								<%--태그에 대한 처리 --%>
								<c:when test="${main_category eq 'area' and empty area_code}">
									<span> <c:set var="test" value="${product.address}" />${fn:substring(test, 0, 2)}</span>
									<span> ${product.sub_category} </span>
								</c:when>
								<c:when test="${main_category eq 'area' and not empty area_code}">
									<span> ${product.sub_category} </span>
								</c:when>
								<c:otherwise>
									<span> <c:set var="test" value="${product.address}" />${fn:substring(test, 0, 2)}</span>
								</c:otherwise>
							</c:choose>
						</div>
						<c:choose>
							<c:when test="${empty member_id}">
								<div></div>
							</c:when>
							<c:otherwise>
								<c:set var="liked" value="false" />
								<c:forEach var="wish" items="${wishlist}">
									<c:if
										test="${product.performance_code eq wish.performance_code}">
										<c:set var="liked" value="true" />
									</c:if>
								</c:forEach>
								<button class="likeBtn ${liked ? 'liked' : ''}"
									id="${product.performance_code}"
									onclick="toggleLike(event, '${product.performance_code}', '${member_code}')">
									<i class="fa-${liked ? 'solid' : 'regular'} fa-heart"
										style="color: ${liked ? '#e41b1b' : '#000000'};"></i>
								</button>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="product-module-title">${product.performance_name}</div>
					<div class="product-module-bottom">
						<div class="star">
							<c:forEach items="${scorenavgs}" var="scorenavg">
								<c:if test="${scorenavg.performance_code eq product.performance_code}">⭐ ${scorenavg.review_avg} (${scorenavg.review_count})</c:if>
							</c:forEach>
						</div>
						<div class="price">${product.performance_price}원</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<%@ include file="../common/scroll.jsp"%>
	</div>
	<%@ include file="../common/footer.jsp"%>

	<script src="/resources/product-list/js/product-list.js"></script>
	<%@ include file="../common/commonJs.jsp"%>
</body>
</html>