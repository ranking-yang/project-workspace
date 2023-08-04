<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티켓킹 관리자</title>
    <link rel="stylesheet" href="../css/common.css">
</head>

<style>
    /* InquiryBox style */

    .inquiry-box {
        display: grid;
        grid-template-columns: ;
        margin: 5px;
        border: 2px solid #ddd;
        width: 1000px;
        height: 500px;
    }


</style>

<body class="allcss">

    <!-- 상단 메뉴바 -->
    <div class="topnav">
        <a class="active" href="index.html">티켓킹 관리자</a>
    </div>
    <!-- 사이드 메뉴바 -->
    <div class="sidenav">
        <div class="stitle">DashBoard</div>
        <a href="index.html">공지사항</a>
        <div class="stitle">API</div>
        <a href="api-list.html">API List</a>
        <div class="stitle">CS</div>
        <a href="qna.html">QnA</a>
        <a href="inquiry.html">1:1 문의</a>
        <div class="stitle">Chart</div>
        <a href="chart.html">통계</a>

    </div>

    <!-- 본문 -->
    <div class="main">
        <h3> 1:1 문의 관리(게시판 형식)</h3>
        <hr>
        <div class="inquiry-box">
            <div class="inquiry-title">제목</div>
            <div clsss="inquiru-main">본문</div>
            <div class="inquiry-name">작성자</div>
            <div class="inquiry-date">날짜</div>
            <div class="inquiry-answer">답변</div>
        </div>

    </div>
</body>

</html>