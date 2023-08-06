<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/payment/css/afterpayment.css" var="afterpayment_css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<%@ include file="../common/commonCss.jsp"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="${afterpayment_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>

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
                    <img class="afterpay-value-poster" src="${performance.poster}" alt="공연포스터">
                </div>
                <!-- 결제정보 total -->
                <div class="afterpay-value-text">
                    <div class="afterpay-value-title">${performance.performance_name}</div>
                    <div class="afterpay-value-date">
                    <c:choose>
						<c:when test="${!empty tickets[0].booking_time}">
							${tickets[0].booking_date} / ${tickets[0].booking_time}
						</c:when>
						<c:otherwise>
							[유효기간 ~ ${tickets[0].booking_date}]
						</c:otherwise>
					</c:choose>              
                    </div>
                    <div class="afterpay-value-qty">총 
                   	    <c:set var= "sum" value = "0" />
	                    <c:forEach items="${tickets}" var="ticket">
	                    	<c:set var= "sum" value="${sum + ticket.booking_qty}"/>
	                    </c:forEach>
	                    <c:out value="${sum}"/>매 / ${payment.total_price}원</div>
                </div>
                <div></div>
            </div>
        </div>
        <div class="afterpay-value-bottom">
            <button id="afterpay-goHome" onclick ="location.href='../main'">홈으로</button>
            <button id="afterpay-checkReserve" onclick="location.href='../mypage'">예매내역 확인</button>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

</body>
</html>