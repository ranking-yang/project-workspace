<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url value ="/resources/product-list/css/product-list.css" var="maincss"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연, 전시, 체험, 키즈 상세페이지</title>
    <link rel="stylesheet" href="${maincss}">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ad03eb7935.js" crossorigin="anonymous"></script>
</head>
<body>
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
        <div id="page-title">전시</div>
        <div id="product">
        	<c:forEach items="${json}" var="item">
        		<div class="product-module">
        			<img class="product-module-poster" src="${item.poster}" alt="" style="border-radius:8px; width:250px;">
                <div class="product-module-top">
                    <div class="place">
                        
        				<span>${item.fcltynm}</span>
        					
                    </div>
                    <button class="likeBtn" id="btn1" onclick="toggleLike(event, 'btn1')">
                        <i class="fa-regular fa-heart" style="color: #000000;"></i>
                    </button>
                </div>
        			<div class="product-module-title" style="font-size:15px;">${item.prfnm}</div>
                <div class="product-module-bottom">
                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>

                    <div class="price">${product.performa nce_price }원</div>

                </div>
        		</div>
        	</c:forEach>
            
           </div>
        </div>
        <div class="scroll-up">
            <img src="https://timeticket.co.kr/mobile_img/btn_scrollup.png" alt="">
        </div>
    </div>

<script src="/resources/product-list/js/product-list.js"></script>
</body>
</html>