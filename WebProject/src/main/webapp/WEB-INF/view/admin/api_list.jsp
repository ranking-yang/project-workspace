<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>티켓킹 관리자</title>
  <link rel="stylesheet" href="/resources/admin/css/admin_common.css">
  <!-- 테이블 스타일 -->
  <style>
    .table-box {
      width: auto;
      height: auto;
      border: 1px solid #ddd;
    }

    table {
      border-collapse: collapse;
      border-spacing: 0;
      width: 2800px;
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

        /* 공통 버튼 스타일 */
        button {
        margin-top: 10px;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    /* 추가 버튼 스타일 */
    #add {
        background-color: #4CAF50;
        color: white;
    }
    #add:hover {
        background-color: #45a049;
    }

    /* 삭제 버튼 스타일 */
    #delete {
        background-color: #f44336;
        color: white;
        margin-left: 10px;
    }
    #delete:hover {
        background-color: #d32f2f;
    }
  </style>
  
  <script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#dbBtn").click(function() {
	        $.ajax({
	            url : "/admin/api/select",
	            type: "POST",
	            success : function(result) {
	            	$(result).each(function(){
	            		console.log(this.poster);
	            		$("#apitable").append("<tr>"
	            		+"<td><input type='checkbox' name='_selected_all_'/></td>"+
	            		+"<td><a href='api-edit.html'>수정</a></td>"
	            		+"<td>"+this.performance_code+"</td>"		
	            		+"<td>"+this.performance_name+"</td>"
	            		+"<td>"+this.performance_qty+"</td>"
	            		+"<td>"+this.main_category+"</td>"
	            		+"<td>"+this.sub_category+"</td>"
	            		+"<td>"+this.performance_price+"</td>"
	            		+"<td>"+this.start_date+"</td>"
	            		+"<td>"+this.end_date+"</td>"
	            		+"<td>"+this.address+"</td>"
	            		+"<td>"+this.place+"</td>"
	            		+"<td>"+this.kid_state+"</td>"
	            		+"<td>"+this.poster+"</td>"
	            		+"</tr>");
	    			});
	            },
	            error: function(e){
	            	console.log(e);
	            }
	        	
	        });
	    });
	});
    </script>
</head>

<body class="allcss">

  <!-- 상단 메뉴바 -->
  <div class="topnav">
    <a class="active" href="index.html">티켓킹 관리자</a>
    <input class="active" type="button" value="로그아웃" onclick="location.href='/logout'">
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
    <h3>API 리스트 관리</h3>
    <hr>
    <!-- API데이터 테이블 -->
    <button id="dbBtn">DB 확인</button>
    <button id="add">추가</button>
    <button id="delete">삭제</button>
    <div style="overflow-x:auto; overflow-y:auto;" class="table-box">
      <table class="api-table" id="apitable">
        <tr>
          <th>옵션</th>
          <th>코드</th>
          <th>제목</th>
          <th>발행개수</th>
          <th>대분류</th>
          <th>소분류</th>
          <th>가격</th>
          <th>시작일</th>
          <th>종료일</th>
          <th>주소</th>
          <th>장소</th>
          <th>키즈</th>
          <th>썸네일</th>
        </tr>
      </table>
    </div>
    
  </div>

</body>

</html>