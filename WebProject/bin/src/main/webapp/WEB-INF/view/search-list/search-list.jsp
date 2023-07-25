<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 상세페이지</title>
<link rel="stylesheet" href="/resources/search-list/css/search-list.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/ad03eb7935.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="product-container">
		<c:choose>
			<%-- 검색된 값이 없을때 나오는 화면 --%>
			<c:when test="${empty lijson}">
				<div id="noSearchList">
					<p>🔎 검색어와 일치하는 티켓이 없습니다.</p>
					<p>지역/작품명 등 다른 검색어를 이용해서 검색해보세요</p>
				</div>
			</c:when>
			<c:otherwise>
				<div id="product">
				<c:forEach items="${lijson}" var="item">
        		<div class="product-module">
        			<img class="product-module-poster" src="${item.thumbnail}" alt="" style="border-radius:8px; width:250px;">
                	<div class="product-module-top">
                    <div class="place">
                        
        				<span>${item.place}</span>
        					
                    </div>
                    <button class="likeBtn" id="btn1" onclick="toggleLike(event, 'btn1')">
                        <i class="fa-regular fa-heart" style="color: #000000;"></i>
                    </button>
                </div>
        			<div class="product-module-title" style="font-size:15px;">${item.title}</div>
                <div class="product-module-bottom">
                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
                    <div>가격</div>
                </div>
        		</div>
        		</c:forEach>
        		</div>
            		<div class="scroll-up"><img src="https://timeticket.co.kr/mobile_img/btn_scrollup.png" alt=""> </div>
			</c:otherwise>
		</c:choose>
	</div>
	<script src="/resources/search-list/js/search-list.js"></script>
</body>
</html>