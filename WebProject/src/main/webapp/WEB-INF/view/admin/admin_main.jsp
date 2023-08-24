<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓킹 관리자</title>
<link rel="stylesheet" href="/resources/admin/css/admin_common.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	// 메뉴 버튼 클릭시 이벤트
	$(function() {
		$("#menuidex_btn").click(function() {
			console.log("test");
			$("#admin_as").show();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").hide();
			$("#api_edit").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").hide();
			$("#md_recom").hide();
			$("#chart").hide();
			$("#coupon").hide();
		});
		$("#menufaq_btn").click(function () {
        	$("#admin_as").hide();
        	$("#admin_faq").show();
        	$("#api_list").hide();
        	$("#api_add").hide();
        	$("#api_edit").hide();
        	$("#inquriy_list").hide();
        	$("#inquriy_detail").hide();
        	$("#qna").hide();
        	$("#refund").hide();
        	$("#md_recom").hide();
        	$("#chart").hide();
        	$("#coupon").hide();
        });
		$("#menuapi_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").show();
			$("#api_add").hide();
			$("#api_edit").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").hide();
			$("#md_recom").hide();
			$("#chart").hide();
			$("#coupon").hide();
		});
		$("#menuapi_add_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").show();
			$("#api_edit").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").hide();
			$("#md_recom").hide();
			$("#chart").hide();
			$("#coupon").hide();
		});
		$("#menuinquiry_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").hide();
			$("api_edit").hide();
			$("#inquriy_list").show();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").hide();
			$("#md_recom").hide();
			$("#chart").hide();
			$("#coupon").hide();
		});
		$("#menuqna_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").show();
			$("#refund").hide();
			$("#md_recom").hide();
			$("#chart").hide();
			$("#coupon").hide();
		});
		$("#menurefund_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").show();
			$("#md_recom").hide();
			$("#chart").hide();
			$("#coupon").hide();
		});
		$("#menuchart_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").hide();
			$("#api_edit").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").hide();
			$("#md_recom").hide();
			$("#chart").show();
			$("#coupon").hide();
		});
		$("#menumd_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").hide();
			$("#api_edit").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").hide();
			$("#md_recom").show();
			$("#chart").hide();
			$("#coupon").hide();
		});
		$("#menucoupon_btn").click(function() {
			console.log("test2");
			$("#admin_as").hide();
			$("#admin_faq").hide();
			$("#api_list").hide();
			$("#api_add").hide();
			$("#api_edit").hide();
			$("#inquriy_list").hide();
			$("#inquriy_detail").hide();
			$("#qna").hide();
			$("#refund").hide();
			$("#md_recom").hide();
			$("#chart").hide();
			$("#coupon").show();
		});
		
	});
</script>
</head>
<body class="allcss">
<!--  +"<td><input type='checkbox' name='_selected_all_'/></td>"+-->
    <!-- 상단 메뉴바 -->
    <div class="topnav">
        <a class="active" href="/admin/api">티켓킹 관리자</a>
        <input type="button" value="로그아웃" onclick="location.href='/logout'">
    </div>
    <!-- 사이드 메뉴바 -->
    <div class="sidenav">
        <div class="stitle">DashBoard</div>
        <button id="menuidex_btn" class="indexbtn">공지사항</button>
        <button id="menufaq_btn" class="indexbtn">FAQ</button>
        <div class="stitle">API</div>
        <button id="menuapi_btn" class="indexbtn">API 조회</button>
        <button id="menuapi_add_btn" class="indexbtn">API 추가</button>
        <div class="stitle">CS</div>
        <button id="menuqna_btn" class="indexbtn">QnA</button>
        <button id="menuinquiry_btn" class="indexbtn">1:1 문의</button>
        <button id="menurefund_btn" class="indexbtn">환불</button>
        <div class="stitle">Chart</div>
        <button id="menuchart_btn" class="indexbtn">통계</button>
        <div class="stitle">recommend</div>
        <button id="menumd_btn" class="indexbtn">MD 추천</button>
        <div class="stitle">Coupon</div>
		<button id="menucoupon_btn" class="indexbtn">쿠폰</button>
 	</div>
    <div id="admin_as" hidden>
    	<%@ include file="admin_as.jsp" %>
    </div>
    <div id="admin_faq" hidden>
    	<%@ include file="admin_faq.jsp" %>
    </div>
    <div id="api_list" hidden>
    	<%@ include file="api_list.jsp" %>
    </div>
    <div id="api_add" hidden>
    	<%@ include file="api_add.jsp" %>
    </div>
    <div id="api_edit" hidden>
    	<%@ include file="api_edit.jsp" %>
    </div>
   	<div id="inquriy_list" hidden>
    	<%@ include file="inquriy_list.jsp" %>
    </div>
    <div id="inquriy_detail" hidden>
    	<%@ include file="inquriy_detail.jsp" %>
    </div>
    <div id="qna" hidden>
    	<%@ include file="qna.jsp" %>
    </div>
    <div id="refund" hidden>
    	<%@ include file="refund.jsp" %>
    </div>
    <div id="md_recom" hidden>
    	<%@ include file="md_recom.jsp" %>
    </div>
    <div id="coupon" hidden>
		<%@ include file="coupon.jsp"%>
	</div>
    <div id="chart">
    	<%@ include file="chart.jsp" %>
    </div>
	
</body>

</html>