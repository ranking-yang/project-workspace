<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연, 전시, 체험, 키즈 상세페이지</title>
	<%@ include file="../common/commonCss.jsp" %>
    <link rel="stylesheet" href="/resources/product-list/css/product-list.css">
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://kit.fontawesome.com/ad03eb7935.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="product-container">
        <div id="navmenu">
            <div id="area">
                <a class="submenu" href="">전체</a>
                <a class="submenu" href="">대학로</a>
                <a class="submenu" href="">서울</a>
                <a class="submenu" href="">경기·인천</a>
                <a class="submenu" href="">충청·대전</a>
                <a class="submenu" href="">경상·대구·부산</a>
                <a class="submenu" href="">전라·광주</a>
                <a class="submenu" href="">강원</a>
                <a class="submenu" href="">제주</a>

            </div>
            <div id="filter">
                <a href="">인기순</a>
                <a href="">별점순</a>
                <a href="">최저가순</a>
                <a href="">최고가순</a>
            </div>
        </div>
        <div id="page-title">${main_category }</div>
        <div id="product">
        <c:forEach var="product" items="${performances }">
            <div class="product-module" data-pk="${product.performance_code }">
                <img class="product-module-poster" src="${product.poster }" alt="포스터">
                <div class="product-module-top">
                    <div class="place">
                        <span><c:set var="test" value="${performance.address}" />
                       ${fn:substring(test,0,2)}</span>
                    </div>
                    <c:choose>
	                    <c:when test="${product.wish_code empty}">
	                    	<button class="likeBtn" id="${product.performance_code }" onclick="toggleLike(event, '${product.performance_code }')">
	                        <i class="fa-regular fa-heart" style="color: #000000;"></i> 
	                    </button>
	                    </c:when>
	                    <c:otherwise>
		                    <button class="likeBtn" id="${product.performance_code }" onclick="toggleLike(event, '${product.performance_code }')">
		                        <i class="fa-regular fa-heart" style="color: #000000;"></i>
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
		<%@ include file="../common/scroll.jsp" %>
    </div>
    <%@ include file="../common/footer.jsp" %>

<script src="/resources/product-list/js/product-list.js"></script>
<%@ include file="../common/commonJs.jsp" %>
</body>
</html>