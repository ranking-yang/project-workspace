<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var columntitle = "<tr><th>코드</th><th>제목</th><th>발행개수</th><th>대분류</th><th>소분류</th><th>가격</th><th>시작일</th><th>종료일</th><th>주소</th><th>장소</th><th>썸네일</th><th>위도</th><th>경도</th></tr>";
	$("#add_theater").click(function() {
		$("#apiaddtable").empty();
		$("#apiaddtable").append(columntitle);
        $.ajax({
            url : "/admin/api/theater_show",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"	
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
	$("#add_music").click(function() {
		$("#apiaddtable").empty();
		$("#apiaddtable").append(columntitle);
        $.ajax({
            url : "/admin/api/theater_music",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"	
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
	$("#add_kid").click(function() {
		$("#apiaddtable").empty();
		$("#apiaddtable").append(columntitle);
        $.ajax({
            url : "/admin/api/theater_kids",
            type: "GET",
            success : function(result) {
            	$(result).each(function(){
            		$("#apiaddtable").append("<tr>"	
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
$(document).on("click", "#add_table_btn", function() {
		console.log("add");
		var dataArray = [];
		$("#apiaddtable tr").each(function(){
			var len = $(this).find("td").length;
			console.log(len);
			var show = new Object();
			for(var i=0; i< len; i++)
			{
				show.performance_code= $(this).find("td").eq(0).text();
				show.performance_name= $(this).find("td").eq(1).find("input").val();
				show.performance_qty= $(this).find("td").eq(2).find("input").val();
				show.main_category= $(this).find("td").eq(3).text();
				show.sub_category= $(this).find("td").eq(4).text();
				show.performance_price= $(this).find("td").eq(5).find("input").val();	
				show.start_date= $(this).find("td").eq(6).text();	
				show.end_date= $(this).find("td").eq(7).text();	
				show.address= $(this).find("td").eq(8).text();	
				show.place= $(this).find("td").eq(9).text();
				show.poster= $(this).find("td").eq(10).find("img").attr("src");
				show.lat= $(this).find("td").eq(11).text();	
				show.lon= $(this).find("td").eq(12).text();	
			
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
				console.log('done');
			},
			
		});
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
    <div class="table-box">
      <table class="api-table" id="apiaddtable">
        
      </table>
    </div>
    
  </div>

