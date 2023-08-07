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
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	 <script>
	 	// 메뉴 버튼 클릭시 이벤트
		$(function(){
	        $("#menuidex_btn").click(function () {
	        	console.log("test");
	        	$("#admin_as").show();
	        	$("#api_list").hide();
	        	$("#api_edit").hide();
	        	$("#inquriy_list").hide();
	        	$("#inquriy_detail").hide();
	        	$("#qna").hide();
	        	$("#chart").hide();
	        });
	        $("#menuapi_btn").click(function () {
	        	console.log("test2");
	        	$("#admin_as").hide();
	        	$("#api_list").show();
	        	$("#api_edit").hide();
	        	$("#inquriy_list").hide();
	        	$("#inquriy_detail").hide();
	        	$("#qna").hide();
	        	$("#chart").hide();
	        });
	        $("#menuinquiry_btn").click(function () {
	        	console.log("test2");
	        	$("#admin_as").hide();
	        	$("#api_list").hide();
	        	$("api_edit").hide();
	        	$("#inquriy_list").show();
	        	$("#inquriy_detail").hide();
	        	$("#qna").hide();
	        	$("#chart").hide();
	        });
	        $("#menuqna_btn").click(function () {
	        	console.log("test2");
	        	$("#admin_as").hide();
	        	$("#api_list").hide();
	        	$("#inquriy_list").hide();
	        	$("#inquriy_detail").hide();
	        	$("#qna").show();
	        	$("#chart").hide();
	        });
	        $("#menuchart_btn").click(function () {
	        	console.log("test2");
	        	$("#admin_as").hide();
	        	$("#api_list").hide();
	        	$("#api_edit").hide();
	        	$("#inquriy_list").hide();
	        	$("#inquriy_detail").hide();
	        	$("#qna").hide();
	        	$("#chart").show();
	        });
	        
		});
		
	 </script>
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
        <div class="stitle">API</div>
        <button id="menuapi_btn" class="indexbtn">API List</button>
        <div class="stitle">CS</div>
        <button id="menuqna_btn" class="indexbtn">QnA</button>
        <button id="menuinquiry_btn" class="indexbtn">1:1 문의</button>
        <div class="stitle">Chart</div>
        <button id="menuchart_btn" class="indexbtn">통계</button>

    </div>
    <div id="admin_as">
    	<%@ include file="admin_as.jsp" %>
    </div>
    <div id="api_list" hidden>
    	<%@ include file="api_list.jsp" %>
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
    <div id="chart" hidden>
    	<%@ include file="chart.jsp" %>
    </div>
	
</body>

</html>