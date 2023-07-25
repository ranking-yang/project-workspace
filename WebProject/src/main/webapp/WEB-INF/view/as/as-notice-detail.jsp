<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/resources/as/css/as-detail.css">
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
            <div class="as-board-detail">
                <div id="as-board-detail-header">
                    <div id="as-board-detail-title">${notice.notice_title}</div>
                    <div id="as-board-detail-date">${notice.notice_date}</div>
                </div>
                <div id="as-board-detail-body">
                    <div id="as-board-detail-content">${notice.notice_content}</div>
                </div>
                <div id="as-board-detail-footer">
                    <div id="as-board-detail-listBtn">
                        <button onclick="location.href='/as/notice'">목록</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="/resources/as/js/as.js"></script>
</body>
</html>