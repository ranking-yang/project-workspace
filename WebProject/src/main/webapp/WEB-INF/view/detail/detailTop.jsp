<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/detail/css/detailTop.css" var="top_css"/>
<c:url value="/resources/detail/js/detailTop.js" var="top_js"/>
<!-- CSS -->
<link rel="stylesheet" href="${top_css}">
<!-- Icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- calendar -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<!-- body -->
	<div class="detail-top-con">                <!-- product-list로 돌아감 -->
        <div class="detail-top-now-category">📁 <a href="">(카테고리) > </a></div> <!-- 카테고리 -->
        <div class="detail-top-left">
            <!-- 좌측 작품 소개 칸 -->
            <div class="detail-top-info">            	
                <img src="" alt="포스터"> <!-- 포스터 이미지 -->
                <!-- 좌측 포스터 텍스트-->
                <div class="detail-top-info-con">
                    <div class="detail-top-info-icon">(DB지역)</div> <!-- DB 지역 -->
                    <div class="detail-top-info-icon">(DB분야)</div> <!-- DB 분야 -->
                    <p class="detail-top-info-subtitle">(DB서브제목)</p> <!-- DB 서브제목 -->
                    <div class="detail-top-info-title">(제목)</div> <!-- DB 제목 -->
                    <div class="detail-top-info-openrun">
                        <div class="detail-top-run-tit">
                            <div><span class="material-symbols-outlined">event_available</span></div>
                           <div class="detail-top-run-txt">(날짜)</div> <!-- DB 시작일~종료일 -->
                        </div>
                        <div class="detail-top-run-info"> 
                            <div><span class="material-symbols-outlined">schedule</span></div> 
                            <div class="detail-top-run-txt">(DB시간)</div>  <!-- DB 총 공연 시간 -->
                            <div><span class="material-symbols-outlined">person</span></div>
                            <div class="detail-top-run-txt">(DB연령대)</div> <!-- DB 연령대 -->
                        </div>
                        <div class="detail-top-run-tit">
                            <div><span class="material-symbols-outlined">location_on</span></div>
                            <div class="detail-top-run-txt">(장소)</div> <!-- DB 장소 -->
                        </div>
                    </div>
                </div>
                <div class="detail-top-info-price">
                    <div>
                        <div>티켓킹가</div>
                        <div>현재 최저가</div> <!-- DB 최저가 -->
                    </div>
                    <div>(DB가격)원 ~</div> <!-- DB 최저가 가격 -->
                </div>
            </div>
            <!-- 여백 -->
            <div></div>
        </div>
        <div class="detail-top-right">
            <!-- 달력 -->
            <div class="placeholder" data-maxdate="2023-07-30"></div>

            <div class="popup-time">
                <!-- 시간 -->
                <div>시간선택</div>
                <div class="popup-time-parent">
                    <input type="button" name="time" value="(DB시간1)">
                    <div>[남은 티켓: 1개]</div>
                 </div>
                 <div class="popup-time-parent">
                    <input type="button" name="time" value="(DB시간2)">
                    <div>[남은 티켓: 2개]</div>
                 </div>
            </div>
            <div class="popup-qty">
                <!-- 권종/수량 -->
                <div>권종/수량선택</div>
                <div class="popup-qty-parent">
                    <div class="popup-qty-age">성인</div>
                    <div class="popup-qty-price">10</div>
                    <div>원</div>
                    <button class="qty-minus">-</button>
                    <div class="qty-value">0</div>
                    <button class="qty-plus">+</button>
                </div>
                <div class="popup-qty-parent">
                    <div class="popup-qty-age">청소년</div>
                    <div class="popup-qty-price">20</div>
                    <div>원</div>
                    <button class="qty-minus">-</button>
                    <div class="qty-value">0</div>
                    <button class="qty-plus">+</button>
                </div>
                <div class="popup-qty-parent">
                    <div class="popup-qty-age">아동</div>
                    <div class="popup-qty-price">30</div>
                    <div>원</div>
                    <button class="qty-minus">-</button>
                    <div class="qty-value">0</div>
                    <button class="qty-plus">+</button>
                </div>
            </div>
            <div class="popup-totalPrice">
                <!-- 총 금액 -->
                <div>총 결제금액</div>
                <input type="text" name="totalPrice" value="" id="popup-totalPrice-value" readonly>
                <div>원</div>
            </div>
            <!-- 결제하기 버튼 -->
            <input type="submit" id="popup-submit" value="결제하기" disabled>
        </div>
    </div>

    <script src="${top_js}"></script>