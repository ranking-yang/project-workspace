<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/detail/css/detailTop.css" var="top_css"/>
<c:url value="/resources/detail/js/detailTop.js" var="top_js"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<!-- CSS -->
<link rel="stylesheet" href="${top_css}">
<!-- Icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- calendar -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>

<div class="detail-top-con">                <!-- product-list로 돌아감 -->
        <div class="detail-top-now-category">📁 <a href="">${category}></a></div> <!-- 카테고리 -->
        <div class="detail-top-left">
            <!-- 좌측 작품 소개 칸 -->
            <div class="detail-top-info">            	
                <img src="${post}" alt="포스터"> <!-- 포스터 이미지 -->
                <!-- 좌측 포스터 텍스트-->
                <div class="detail-top-info-con">
                    <div class="detail-top-info-icon">(DB지역)</div> <!-- DB 지역 -->
                    <div class="detail-top-info-icon">(DB분야)</div> <!-- DB 분야 -->
                    <p class="detail-top-info-subtitle">(DB서브제목)</p> <!-- DB 서브제목 -->
                    <div class="detail-top-info-title">${name}</div> <!-- DB 제목 -->
                    <div class="detail-top-info-openrun">
                        <div class="detail-top-run-tit">
                            <div><span class="material-symbols-outlined">event_available</span></div>
                           <div class="detail-top-run-txt">${stdate} ~ ${endate}</div> <!-- DB 시작일~종료일 -->
                        </div>
                        <div class="detail-top-run-info"> 
                            <div><span class="material-symbols-outlined">schedule</span></div> 
                            <div class="detail-top-run-txt">(DB시간)</div>  <!-- DB 총 공연 시간 -->
                            <div><span class="material-symbols-outlined">person</span></div>
                            <div class="detail-top-run-txt">(DB연령대)</div> <!-- DB 연령대 -->
                        </div>
                        <div class="detail-top-run-tit">
                            <div><span class="material-symbols-outlined">location_on</span></div>
                            <div class="detail-top-run-txt">${place}</div> <!-- DB 장소 -->
                        </div>
                    </div>
                </div>
                <div class="detail-top-info-price">
                    <div>
                        <div>티켓킹가</div>
                        <div>현재 최저가</div> <!-- DB 최저가 -->
                    </div>
                    <div>(DB가격)원</div> <!-- DB 최저가 가격 -->
                </div>
            </div>
            <!-- 여백 -->
            <div></div>
        </div>
        <div class="detail-top-right">
            <!-- 달력 -->
            <div class="placeholder"></div>

            <div class="popup-time">
                <div>시간선택</div>
                <!-- form 추가하기 -->
                <div class="popup-time-btn">
                    <input type="button" name="time" value="(DB시간)">
                    <div>[남은 티켓: 0개]</div>
                 </div>
            </div>
            <div class="popup-qty">
                <div>권종·수량선택</div>
                <!-- form 추가하기 -->
                <div class="popup-qty-sub">(DB수량)</div>
            </div>
            <div class="popup-totalPrice">
                <div>총 결제금액</div>
                <input type="text" name="totalPrice" value="TOTAL원" id="popup-totalPrice-value" readonly>
            </div>
            <button class="popup-submit">결제하기</button>
        </div>
    </div>  

    <script src="${top_js}"></script>

</body>
</html>