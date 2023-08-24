<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
$(document).ready(function() {
	var columntitle = "<tr><th><input type='checkbox' id='selectAddAll'>선택</th><th>코드</th><th>제목</th><th>발행개수</th><th>대분류</th><th>소분류</th><th>가격</th><th>시작일</th><th>종료일</th><th>주소</th><th>장소</th><th>썸네일</th><th>위도</th><th>경도</th></tr>";
	$("#add_theater").click(function() {
		$("#apiaddtable").empty();
		$("#apiaddtable").append(columntitle);
        $.ajax({
            url : "/admin/api/theater_show",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"
            		+"<td><input type='checkbox'></td>"
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
            		+"<td>"+this.latitude+"</td>"
            		+"<td>"+this.longitude+"</td>"
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
		$("#apiaddtable").append(columntitle);
        $.ajax({
            url : "/admin/api/theater_music",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"
            		+"<td><input type='checkbox'></td>"
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
            		+"<td>"+this.latitude+"</td>"
            		+"<td>"+this.longitude+"</td>"
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
		$("#apiaddtable").append(columntitle);
        $.ajax({
            url : "/admin/api/theater_kids",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"
            		+"<td><input type='checkbox'></td>"
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
            		+"<td>"+this.latitude+"</td>"
            		+"<td>"+this.longitude+"</td>"
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
		$("#apiaddtable").append(columntitle);
        $.ajax({
            url : "/admin/api/showing",
            type: "GET",
            success : function(result) {
            	console.log(result);
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"
            		+"<td><input type='checkbox'></td>"
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
            		+"<td>"+this.latitude+"</td>"
            		+"<td>"+this.longitude+"</td>"
            		+"</tr>");
    			});
            },
            error: function(e){
            	console.log(e);
            }
        });
    });
$(document).on("click", "#add_table_btn", function() {
		console.log("add");
		var dataArray = [];
		$("#apiaddtable tr").each(function(){
			var len = $(this).find("td").length;
			console.log(len);
			var show = new Object();
			for(var i=0; i< len; i++)
			{
				show.performance_code= $(this).find("td").eq(1).text();
				show.performance_name= $(this).find("td").eq(2).find("input").val();
				show.performance_qty= $(this).find("td").eq(3).find("input").val();
				show.main_category= $(this).find("td").eq(4).text();
				show.sub_category= $(this).find("td").eq(5).text();
				show.performance_price= $(this).find("td").eq(6).find("input").val();	
				show.start_date= $(this).find("td").eq(7).text();	
				show.end_date= $(this).find("td").eq(8).text();	
				show.address= $(this).find("td").eq(9).text();	
				show.place= $(this).find("td").eq(10).text();
				show.poster= $(this).find("td").eq(11).find("img").attr("src");
				show.latitude= $(this).find("td").eq(12).text();	
				show.longitude= $(this).find("td").eq(13).text();	
			
			}
			dataArray.push(show);
			
		});
		console.log(dataArray);
		$.ajax({
			contentType: "application/json",
			type: "POST",
			data: JSON.stringify(dataArray),
			url: "/admin/api/add",
			success: function(data) {
				alert("data 추가 완료");
				$("#apiaddtable").empty();
			}
		});
	});
});
$(document).ready(function(){
	$(document).on("click","#selectAddAll",function() {
	    var isChecked = $(this).prop("checked");
	    $("input[type='checkbox']").prop("checked", isChecked);
	});
	$(document).on("click", "#addtitle_btn", function() {
	    var newValue = $("#addtitleInput").val();
	    var selectedRows = $("#apiaddtable").find("input[type='checkbox']:checked").closest("tr");

	    selectedRows.each(function() {
	        var titleInput = $(this).find("td:eq(2) input[type='text']");
	        titleInput.val(newValue);
	    });
	});

	$(document).on("click", "#addqty_btn", function() {
	    var newValue = $("#addqtyInput").val();
	    var selectedRows = $("#apiaddtable").find("input[type='checkbox']:checked").closest("tr");

	    selectedRows.each(function() {
	        var qtyInput = $(this).find("td:eq(3) input[type='text']");
	        qtyInput.val(newValue);
	    });
	});

	$(document).on("click", "#addprice_btn", function() {
	    var newValue = $("#addpriceInput").val();
	    var selectedRows = $("#apiaddtable").find("input[type='checkbox']:checked").closest("tr");

	    selectedRows.each(function() {
	        var priceInput = $(this).find("td:eq(6) input[type='text']");
	        priceInput.val(newValue);
	    });
	});
	$(document).on("click", "#delete", function() {
	    var selectedRows = $("#apiaddtable").find("input[type='checkbox']:checked").closest("tr");

	    selectedRows.each(function() {
	        $(this).remove(); // 선택된 행 삭제
	    });
	});
});

	</script>

  <!-- 본문 -->
  <div class="main">
    <h3>API 리스트 관리</h3>
    <hr>
    <!-- API데이터 테이블 -->
    <button id="add_theater"style="width:120px;">공연 추가</button>
    <button id="add_music"style="width:120px;">음악 추가</button>
    <button id="add_kid"style="width:120px;">키즈 추가</button>
    <button id="add_showing"style="width:120px;">전시 추가</button>
    <button id="add_table_btn">저장</button>
    <button id="delete">삭제</button>
    <hr><br>
    <label for="addtitleInput">제목 :</label>
    <input type="text" id="addtitleInput">
    <button id="addtitle_btn">수정</button>

    <label for="addqtyInput">발행개수 :</label>
    <input type="text" id="addqtyInput">
    <button id="addqty_btn">수정</button>

    <label for="addpriceInput">가격 :</label>
    <input type="text" id="addpriceInput">
    <button id="addprice_btn">수정</button>
    <div class="table-box">
      <table class="api-table" id="apiaddtable">
        
      </table>
    </div>
    
  </div>

