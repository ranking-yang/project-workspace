<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#add_theater").click(function() {
		$("#apiaddtable").empty();
        $.ajax({
            url : "/admin/api/theater_show",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"		
            		+"<td><button id='api_btn'>수정</button></td>"
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
            		+"<td>"+this.lat+"</td>"
            		+"<td>"+this.lon+"</td>"
            		+"</tr>");
    			});
            },
            error: function(e){
            	console.log(e);
            }
        });
    });
	$("#add_music").click(function() {
		$("#apiaddtable").empty();
        $.ajax({
            url : "/admin/api/theater_music",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"		
            		+"<td><button id='api_btn'>수정</button></td>"
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
            		+"<td>"+this.lat+"</td>"
            		+"<td>"+this.lon+"</td>"
            		+"</tr>");
    			});
            },
            error: function(e){
            	console.log(e);
            }
        });
    });
	$("#add_kid").click(function() {
		$("#apiaddtable").empty();
        $.ajax({
            url : "/admin/api/theater_kids",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"		
            		+"<td><button id='api_btn'>수정</button></td>"
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
            		+"<td>"+this.lat+"</td>"
            		+"<td>"+this.lon+"</td>"
            		+"</tr>");
    			});
            },
            error: function(e){
            	console.log(e);
            }
        });
    });
	$("#add_showing").click(function() {
		$("#apiaddtable").empty();
        $.ajax({
            url : "/admin/api/showing",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"		
            		+"<td><button id='api_btn'>수정</button></td>"
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
            		+"<td>"+this.lat+"</td>"
            		+"<td>"+this.lon+"</td>"
            		+"</tr>");
    			});
            },
            error: function(e){
            	console.log(e);
            }
        });
    });
	$("#add_table_btn").click(function() {
		
	});
});

	</script>

  <!-- 본문 -->
  <div class="main">
    <h3>API 리스트 관리</h3>
    <hr>
    <!-- API데이터 테이블 -->
    <button id="add_theater">공연 추가</button>
    <button id="add_music">음악 추가</button>
    <button id="add_kid">키즈 추가</button>
    <button id="add_showing">전시 추가</button>
    <button id="add_table_btn">추가</button>
    <button id="delete">삭제</button>
    <div style="overflow-x:auto; overflow-y:auto;" class="table-box">
      <table class="api-table" id="apiaddtable">
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
          <th>위도</th>
          <th>경도</th>
        </tr>
      </table>
    </div>
    
  </div>

