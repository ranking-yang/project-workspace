<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="../resources/admin/css/Admin_PageApi.css">
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$("#dbBtn").click(function() {
	        $.ajax({
	            url : "/admin/api/select",
	            type: "POST",
	            success : function(result) {
	            	$(result).each(function(){
	            		
	            		$("#apiTable").append("<tr>"
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
	            }
	        	
	        });
	    });
	});
    </script>
</head>
<body>
	<button id="dbBtn">DB 확인</button>
	<button id="theaterAdd" onclick="location.href='/admin/api/theater'">공연추가</button>
	<button id="showAdd" onclick="location.href='/admin/api/showing'">전시추가</button>

	<table id="apiTable" border="1">
		<th>코드</th>
		<th>제목</th>
		<th>티켓매수</th>
		<th>대분류</th>
		<th>소분류</th>
		<th>티켓가격</th>
		<th>시작일</th>
		<th>종료일</th>
		<th>주소</th>
		<th>장소</th>
		<th>키즈</th>
		<th>썸네일</th>

	</table>
	
</body>
</html>