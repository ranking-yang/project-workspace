<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
        <div class="detail-top-now-category">📁 <a href="/product/performance?main_category=${performance.main_category}">${perfomance.main_category} > </a></div> <!-- 카테고리 -->
        <div class="detail-top-left">
            <!-- 좌측 작품 소개 칸 -->
            <div class="detail-top-info">            	
                <img src="${performance.poster}" alt="포스터"> <!-- 포스터 이미지 -->
                <!-- 좌측 포스터 텍스트-->
                <div class="detail-top-info-con">
                    <div class="detail-top-info-icon"> <!-- DB 지역 -->
                    	<c:set var="test" value="${performance.address}" />
                    	${fn:substring(test,0,2)}
					</div>
                    <div class="detail-top-info-icon">${performance.sub_category}</div> <!-- DB 분야 -->
                    <div class="detail-top-info-title">${performance.performance_name}</div> <!-- DB 제목 -->
                    <div class="detail-top-info-openrun">
                        <div class="detail-top-run-tit">
                            <div><span class="material-symbols-outlined">event_available</span></div>
                           <div class="detail-top-run-txt">${performance.start_date} ~ ${performance.end_date}</div> <!-- DB 시작일~종료일 -->
                        </div>
                        <div class="detail-top-run-info"> 
                            <div><span class="material-symbols-outlined">schedule</span></div> 
                            <div class="detail-top-run-txt">${runtime}</div>  <!-- DB 총 공연 시간 -->
                            <div><span class="material-symbols-outlined">person</span></div>
                            <div class="detail-top-run-txt" id="detail-top-age">${age}</div> <!-- DB 연령대 -->
                        </div>
                        <div class="detail-top-run-tit">
                            <div><span class="material-symbols-outlined">location_on</span></div>
                            <div class="detail-top-run-txt">${performance.place}</div> <!-- DB 장소 -->
                        </div>
                    </div>
                </div>
                <div class="detail-top-info-price">
                    <div>
                        <div>티켓킹가</div>
                        <div>구매 가능 티켓 수 : ${performance.performance_qty}매</div> <!-- DB 최저가 -->
                    </div>
                    <div id="lowestprice"> <!-- DB 최저가 가격 --> </div>
                </div>
            </div>
            <!-- 여백 -->
            <div></div>
        </div>
        <div class="detail-top-right">
            <!-- 달력 -->   
            <div class="placeholder" data-startdate="${performance.start_date}" data-maxdate="${performance.end_date}"></div>
            <div class="popup-time-parent">	            
	            <!-- 시간 JS에서 생성 -->
	        </div>
            <div class="popup-qty">
                <!-- 권종/수량 -->
                <div class="popup-text">권종/수량선택</div>                
                <c:forEach items="${discountRates}" var="discount">
                	<div class="popup-qty-parent">
	                    <div class="popup-qty-age">${discount.generation}</div>
	                   		 <fmt:parseNumber var="price" value="${performance.performance_price - (performance.performance_price * discount.discount_rate)})" integerOnly="true" />
	                    <div class="popup-qty-price">${price}</div>
	                    <div>원</div>
	                    <button class="qty-minus">-</button>
	                    <div class="qty-value">0</div>
	                    <button class="qty-plus">+</button>
                	</div>
                </c:forEach>
                
            </div>
            <div class="popup-totalPrice">
                <!-- 총 금액 -->
                <div>총 결제금액</div>
                <div id="popup-totalPrice-value"></div>
                <div>원</div>
            </div>
            <!-- 결제하기 버튼 -->
            <button id="popup-payment-btn">결제하기</button>
        </div>
    </div>

	<script>
		const timetable = JSON.parse('${timetable}');
		const totalQty = '${perfomance.performance_qty}';
	</script>
    <script src="${top_js}"></script>