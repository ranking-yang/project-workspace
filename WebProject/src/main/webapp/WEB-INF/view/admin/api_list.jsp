<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
function standard_select(){
	$.ajax({
        url : "/admin/api/select",
        type: "POST",
        success : function(result) {
        	$("#api-select-body").empty();
        	$(result).each(function(){
        		$("#api-select-body").append("<tr>"
        	    +"<td><input type='checkbox'></td>"
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
        		+"</tr>");
			});
        }
    	
    });
}
$(document).ready(function() {
	$("#selectAll").click(function() {
        var isChecked = $(this).prop("checked");
        $("input[type='checkbox']").prop("checked", isChecked);
    });
	$("#dbBtn").click(function() {
		standard_select();
        
    });
	
});
$(document).on("click", "#api_btn", function(){
			$("#api_list").hide();
			$("#api_edit").show();
			var index = $(this).parent().parent().index();
			var tr = $(this).parent().parent();
			var td = tr.children();
		   	// 선택한 정보 edit jsp에 넣기
		   	$("#api-select-body").ready(function(){
		   		
		   		$("#edit_code").val(td.eq(2).text());
			    $("#edit_title").val(td.eq(3).find("input").val());
			    $("#edit_qty").val(td.eq(4).find("input").val());
			    $("#cat1").val(td.eq(5).text()).prop("selected", true);
			    $("#cat2").val(td.eq(6).text());
			    $("#edit_price").val(td.eq(7).find("input").val());
			    $("#stdate").val(td.eq(8).text());
			    $("#endate").val(td.eq(9).text());
			    $("#edit_address").val(td.eq(10).text());
			    $("#edit_place").val(td.eq(11).text());
			    $("#edit_Thumbnail").prop("src", td.eq(12).find("img").prop("src"));
			   
		   	});
		   		
		});
		
$(document).on("click", "#title_btn", function() {
    var newValue = $("#titleInput").val();
    var selectedRows = $("#apitable").find("input[type='checkbox']:checked").closest("tr");

    selectedRows.each(function() {
        var titleInput = $(this).find("td:eq(3) input[type='text']");
        titleInput.val(newValue);
    });
});

$(document).on("click", "#qty_btn", function() {
    var newValue = $("#qtyInput").val();
    var selectedRows = $("#apitable").find("input[type='checkbox']:checked").closest("tr");

    selectedRows.each(function() {
        var qtyInput = $(this).find("td:eq(4) input[type='text']");
        qtyInput.val(newValue);
    });
});

$(document).on("click", "#price_btn", function() {
    var newValue = $("#priceInput").val();
    var selectedRows = $("#apitable").find("input[type='checkbox']:checked").closest("tr");

    selectedRows.each(function() {
        var priceInput = $(this).find("td:eq(7) input[type='text']");
        priceInput.val(newValue);
    });
});
$(document).on("click", "#delete", function() {
    var selectedRows = $("#apitable").find("input[type='checkbox']:checked").closest("tr");

    selectedRows.each(function() {
        $(this).remove(); // 선택된 행 삭제
    });
});
$(document).on("click", "#dbupdate", function() {
	var dataArray = [];
	$("#api-select-body tr").each(function(){
		var len = $(this).find("td").length;
		var show = new Object();
		for(var i=0; i< len; i++)
		{
			show.performance_code= $(this).find("td").eq(2).text();
			show.performance_name= $(this).find("td").eq(3).find("input").val();
			show.performance_qty= $(this).find("td").eq(4).find("input").val();
			show.main_category= $(this).find("td").eq(5).text();
			show.sub_category= $(this).find("td").eq(6).text();
			show.performance_price= $(this).find("td").eq(7).find("input").val();	
			show.start_date= $(this).find("td").eq(8).text();	
			show.end_date= $(this).find("td").eq(9).text();	
			show.address= $(this).find("td").eq(10).text();	
			show.place= $(this).find("td").eq(11).text();
			show.poster= $(this).find("td").eq(12).find("img").attr("src");
		}
		dataArray.push(show);
		
	});
	$.ajax({
		contentType: "application/json",
		type: "POST",
		data: JSON.stringify(dataArray),
		url: "/admin/api/allupdate",
		success: function(data) {
			alert("전체 수정완료");
			standard_select();
		}
		
	});
});

		</script>

  <!-- 본문 -->
  <div class="main">
    <h3>API 리스트 관리</h3>
    <hr>
    <button id="dbBtn">DB 확인</button>
    <button id="dbupdate" style="width:120px;">전체 수정</button>
    <button id="delete">삭제</button>
    <hr><br>
    <!-- API데이터 테이블 -->
    <label for="titleInput">제목 :</label>
    <input type="text" id="titleInput">
    <button id="title_btn">수정</button>

    <label for="qtyInput">발행개수 :</label>
    <input type="text" id="qtyInput">
    <button id="qty_btn">수정</button>

    <label for="priceInput">가격 :</label>
    <input type="text" id="priceInput">
    <button id="price_btn">수정</button>
    
    <div class="table-box">
      <table class="api-table" id="apitable">
      	<thead>
        <tr>
          <th><input type="checkbox" id="selectAll">선택</th>
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
        </tr>
        <thead>
        <tbody id="api-select-body">
        </tbody>
      </table>
    </div>
    
  </div>

