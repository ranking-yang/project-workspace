<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/payment/css/afterpayment.css" var="afterpayment_css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="${afterpayment_css}">
</head>
<body>

    <div class="afterpay-con">
        <div class="afterpay-title">예매완료</div>
        <div class="afterpay-notion-con">
            <span class="material-symbols-outlined" style="font-size: 120px; color: rgb(120,86,184);">check_circle</span>
            <div>결제가 완료되었습니다.</div>
            <div>결제 정보는 마이페이지 > 예매내역에서 확인가능합니다.</div>
        </div>
        <!-- 결제 끝나고 가져올 값들 -->
        <div class="afterpay-value-con">
            <div class="afterpay-value-top">
                <div style="color: rgb(120,86,184)">결제내역</div>
                <div></div>
                <div style="color: gray">${payment.payment_date}</div>                
            </div>
            <div class="afterpay-value-middle">
                <div>
                    <img class="afterpay-value-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2022/01/27/1643271898-98-0_N_7_255x357_70_2.jpg" alt="공연포스터">
                </div>
                <!-- 결제정보 텍스트로만 반복해서 나오게 -->
                <div class="afterpay-value-text">
                    <div class="afterpay-value-title">(제목)</div>
                    <div class="afterpay-value-date">(날짜 + 구매한거)</div>
                    <div class="afterpay-value-qty">총 (갯수)매 / (가격)원</div>
                </div>
                <div></div>
            </div>
        </div>
        <div class="afterpay-value-bottom">
            <button id="afterpay-goHome" onclick="/main">홈으로</button>
            <button id="afterpay-checkReserve">예매내역 확인</button>
        </div>
    </div>

</body>
</html>