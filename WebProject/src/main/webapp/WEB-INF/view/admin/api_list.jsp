<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#dbBtn").click(function() {
        $.ajax({
            url : "/admin/api/select",
            type: "POST",
            success : function(result) {
            	$(result).each(function(){
            		console.log(result);
            		$("#apitable").append("<tr>"		
            		+"<td><button id='api_btn'>수정</button></td>"
            		+"<td>"+this.performance_code+"</td>"		
            		+"<td width='300'><input type='text' value='"+this.performance_name+"'/></td>"
            		+"<td width='50'><input type='text' value='"+this.performance_qty+"'/></td>"
            		+"<td>"+this.main_category+"</td>"
            		+"<td>"+this.sub_category+"</td>"
            		+"<td width='100'><input type='text' value='"+this.performance_price+"'/></td>"
            		+"<td width='100'>"+this.start_date+"</td>"
            		+"<td width='100'>"+this.end_date+"</td>"
            		+"<td width='200'>"+this.address+"</td>"
            		+"<td width='150'>"+this.place+"</td>"
            		+"<td width='50'><img src='"+this.poster+"' width='50'/></td>"
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
	
});
$(document).on("click", "#api_btn", function(){
			$("#api_list").hide();
			$("#api_edit").show();
			var index = $(this).parent().parent().index();
			var tr = $(this).parent().parent();
			var td = tr.children();
		   	// 선택한 정보 edit jsp에 넣기
		   	$("#api_edit").ready(function(){
		   		console.log(td.eq(1).text());
		   		$("#edit_code").val(td.eq(1).text());
			    $("#edit_title").val(td.eq(2).text());
			    $("#edit_qty").val(td.eq(3).text());
			    $("#cat1").val(td.eq(4).text()).prop("selected", true);
			    $("#cat2").val(td.eq(5).text()).prop("selected", true);
			    $("#edit_price").val(td.eq(6).text());
			    $("#stdate").val(td.eq(7).text());
			    $("#endate").val(td.eq(8).text());
			    $("#edit_address").val(td.eq(9).text());
			    $("#edit_place").val(td.eq(10).text());
			    $("#edit_Thumbnail").val(td.eq(11).text());
		   	});
		   		
		});
		</script>

  <!-- 본문 -->
  <div class="main">
    <h3>API 리스트 관리</h3>
    <hr>
    <!-- API데이터 테이블 -->
    <button id="dbBtn">DB 확인</button>
    <button id="add_table_btn">추가</button>
    <button id="delete">삭제</button>
    <div class="table-box">
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
          <th>썸네일</th>
          <th>위도</th>
          <th>경도</th>
        </tr>
      </table>
    </div>
    
  </div>

