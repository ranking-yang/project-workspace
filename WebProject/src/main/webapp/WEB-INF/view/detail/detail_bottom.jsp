<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/detail/css/detail_bottom.css"/>

<div id="detail_bottom_con">
   <!-- 메뉴영역 -->
    <div id="detailMenuBtns">
        <div class="detailMenuBtn" data-target="info">안내</div>
        <div class="detailMenuBtn" data-target="review">후기(${countReviews })</div>        
        <div class="detailMenuBtn" data-target="qna">Q&A(${qnaCount })</div>
        <div class="detailMenuBtn" data-target="place">장소</div>
        <div class="detailMenuBtn" data-target="refund">환불규정</div>
    </div>
    <div id="menuContents">
        <div class="menuContent" id="infoContent">
            <%@ include file="./frag/bottom_info.jsp" %>
        </div>
        <div class="menuContent" id="reviewContent">
            <%@ include file="./frag/bottom_review.jsp" %>
        </div>
        <div class="menuContent" id="qnaContent">
            <%@ include file="./frag/bottom_qna.jsp" %>
        </div>
        <div class="menuContent" id="placeContent">
            <%@ include file="./frag/bottom_place.jsp" %>
        </div>
        <div class="menuContent" id="refundContent">
            <%@ include file="./frag/bottom_refund.jsp" %>
        </div>
    </div>
</div>
<script src="/resources/detail/js/detail_bottom.js"></script>
