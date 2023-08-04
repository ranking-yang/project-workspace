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

<body class="allcss">

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
    <div id="main">
    	
    </div>
    
    <script>
		$(function(){
	        $("#menuapi_btn").click(function () {
	        	console.log("test");
	        	$("#main").load("./api_edit.jsp");	
	        });
		});
	 </script>

</body>

</html>