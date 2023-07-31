<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 상세페이지</title>
<link rel="stylesheet" href="/resources/search-list/css/search-list.css">
<%@ include file="../common/commonCss.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://kit.fontawesome.com/ad03eb7935.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="search-list-container">
		<c:choose>
			<%-- 검색된 값이 없을때 나오는 화면 --%>
			<c:when test="${empty searchList}">
				<div id="noSearchList">
					<div>🔎 검색어와 일치하는 티켓이 없습니다.</div>
					<div>지역/작품명 등 다른 검색어를 이용해서 검색해보세요</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="search-product-container">
					<div id="product">
		            	<c:forEach var="product" items="${searchList }">
				            <div class="product-module" data-pk="${product.performance_code }">
				                <img class="product-module-poster" src="${product.poster }" alt="포스터">
				                <div class="product-module-top">
				                    <div class="place">
				                        <span>
				                        	<c:set var="test" value="${product.address}"/>${fn:substring(test,0,2)}
				                        </span>
				                    </div>
				                    <c:choose>
					                    <c:when test="${empty product.wish_code}">
					                    	<button class="likeBtn" id="${product.performance_code }" onclick="toggleLike(event, '${product.performance_code }')">
					                        <i class="fa-regular fa-heart" style="color: #000000;"></i> 
					                    </button>
					                    </c:when>
					                    <c:otherwise>
						                    <button class="likeBtn liked" id="${product.performance_code }" onclick="toggleLike(event, '${product.performance_code }')">
						                        <i class="fa-solid fa-heart" style="color: #e41b1b;"></i>
						                    </button>
					                    </c:otherwise>
				                    </c:choose>
				                </div>
				                <div class="product-module-title">${product.performance_name }</div>
				                <div class="product-module-bottom">
				                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
				                    <div class="price">${product.performance_price }원</div>
				                </div>
				           </div>
				        </c:forEach>
		    		</div>
            		<div class="scroll-up"><img src="https://timeticket.co.kr/mobile_img/btn_scrollup.png" alt=""> </div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<%@ include file="../common/footer.jsp" %>
	<%@ include file="../common/commonJs.jsp" %>
	<script src="/resources/search-list/js/search-list.js"></script>
</body>
</html>