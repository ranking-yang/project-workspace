<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>티켓킹 관리자</title>
    <link rel="stylesheet" href="../css/common.css">
</head>
<style>
.table-box {
    width: auto;
    height: auto;
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
        <h3>티켓킹 공지사항 관리(게시판 형식)</h3>
        <hr>
        <div>
            <table>
                <th>No.</th>
                <th>title</th>
                <th>name</th>
                <th>date</th>
                <th>hits</th>
                <tr>
                    <td>1</td>
                    <td>test</td>
                    <td>관리자</td>
                    <td>2023/08/02</td>
                    <td>100</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>test2</td>
                    <td>관리자</td>
                    <td>2023/08/02</td>
                    <td>200</td>
                </tr>

            </table>
        </div>
    </div>

</body>

</html>