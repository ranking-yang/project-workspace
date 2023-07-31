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
                <span class="submenu selected" id="all">전체</span>
                <span class="submenu" id="seoul">서울</span>
                <span class="submenu" id="gyeong-in">경기·인천</span>
                <span class="submenu" id="chung-dae">충청·대전</span>
                <span class="submenu" id="gyeong-dae-bu">경상·대구·부산</span>
                <span class="submenu" id="jeon-kwang">전라·광주</span>
                <span class="submenu" id="Gangwon">강원</span>
                <span class="submenu" id="jeju">제주</span>
            </div>
            <div id="filters">
                <span class="filter">인기순</span>
                <span class="filter">별점순</span>
                <span class="filter">최저가순</span>
                <span class="filter">최고가순</span>
            </div>
        </div>
        <div id="page-title">${main_category }</div>
        <div id="product">
        <c:forEach var="product" items="${performances }">
            <div class="product-module" data-category="${main_category}" data-pk="${product.performance_code}">
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
		<%@ include file="../common/scroll.jsp" %>
    </div>
    <%@ include file="../common/footer.jsp" %>

<script src="/resources/product-list/js/product-list.js"></script>
<%@ include file="../common/commonJs.jsp" %>
</body>
</html>