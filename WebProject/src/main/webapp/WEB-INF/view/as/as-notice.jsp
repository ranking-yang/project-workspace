<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[고객센터] 공지사항</title>
    <link rel="stylesheet" href="/resources/as/css/as.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ad03eb7935.js" crossorigin="anonymous"></script>
</head>
<body>
    <div id="as-container">
        <div id="as-side-menu">
            <div id="as-side-menu-title">고객센터</div>
            <div id="notice" class="as-side-menu-subtitle selected">공지사항</div>
            <div id="freq-questions"class="as-side-menu-subtitle">자주 묻는 질문</div>
            <div id="one-on-one" class="as-side-menu-subtitle">1:1 문의</div>
        </div>
        <div id="as-board">
            <div id="as-board-title">공지사항</div>
            <div id="as-board-list">
                <div id="as-board-list-category">
                    <div>번호</div>
                    <div>제목</div>
                    <div>작성일</div>
                </div>
                <div class="as-board-list-board">
                    <div>123</div>
                    <div>게시글 테스트입니다 테스트 테스트 제목입니다</div>
                    <div>23/07/19</div>
                </div>
            </div>
            <div id="as-board-list-page-buttons">
                <button class="page-buttons selected">1</button>
                <button class="page-buttons">2</button>
                <button class="page-buttons">3</button>
                <button class="page-buttons">4</button>
                <button class="page-buttons">5</button>
                <button class="page-buttons">6</button>

            </div>
        </div>

    </div>
    <script src="/resources/as/js/as.js"></script>
</body>
</html>