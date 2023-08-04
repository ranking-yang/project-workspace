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
    /* 필터스타일 */
    .filter {
        width: 800px;
    }
    /* 테이블스타일 */
    .table-box {
        width: auto;
        height: 500px;
        border: 1px solid #ddd;
    }

    table {
        border-collapse: collapse;
        border-spacing: 0;
        width: 1000px;
        border: 1px solid #ddd;
    }

    th,
    td {
        text-align: center;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2
    }

    .inquiry-title {
        width: 500px;
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
        <div class="filter">
            <label for="date">시작일:
                <input type="date" id="date"></label>
            <label for="date">종료일:
                <input type="date" id="date"></label>
            <select id="keyword">
                <option value="option1">제목</option>
                <option value="option2">내용</option>
                <option value="option2">제목+내용</option>
                <option value="option2">작성자</option>
            </select>
            <label for="text">
                <input type="text" id="keyword"></label>
            <button>검색</button>
        </div>
        <div style="overflow-x:auto; overflow-y:auto;" class="table-box">
            <table class="api-table" id="atable">
                <tr>
                    <th class="inquiry-number">No.</th>
                    <th class="inquiry-title">제목</th>
                    <th class="inquiry-name">작성자</th>
                    <th class="inquiry-date">등록일</th>
                    <th class="inquiry-state">답변여부</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td><a href="inquiry-detail.html">티켓 환불문의</a></td>
                    <td>권영준</td>
                    <td>2023-07-31</td>
                    <td>미완료</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>티켓 환불문의</td>
                    <td>권영준</td>
                    <td>2023-07-31</td>
                    <td>미완료</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>티켓 환불문의</td>
                    <td>권영준</td>
                    <td>2023-07-31</td>
                    <td>미완료</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>티켓 환불문의</td>
                    <td>권영준</td>
                    <td>2023-07-31</td>
                    <td>미완료</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>티켓 환불문의</td>
                    <td>권영준</td>
                    <td>2023-07-31</td>
                    <td>미완료</td>
                </tr>
        </div>
    </body>

</html>