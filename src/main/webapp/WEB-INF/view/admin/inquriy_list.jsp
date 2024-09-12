<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
function getList() {
	// 오늘 날짜 가져오기
    var today = new Date();
    // 원하는 형식으로 날짜 문자열 만들기 (yyyy-mm-dd)
    var year = today.getFullYear();
    var month = ("0" + (today.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더함
    var day = ("0" + today.getDate()).slice(-2);

    var resultday = year + "-" + month + "-" + day;
	$.ajax({
        url : "/admin/inqurity/select",
        type: "GET",
        success : function(result) {
        	$(".inquiry-body").empty();
        	$(result).each(function(){
        		let row = $('<tr>');
        		if($(this)[0].one_state == 1){
        			row.append("<td><span class='processing'>답변대기</span></td>");
        		}else if($(this)[0].one_state == 2){
        			row.append("<td><span class='complete'>답변완료</span></td>");
        		}
        		row.append("<td class='one-on-code'>"+$(this)[0].one_code+"</td>"
        		+"<td>"+$(this)[0].one_title+"</td>"
        		+"<td>"+$(this)[0].writer_code+"</td>"
        		+"<td>"+$(this)[0].one_date+"</td>"
        		+"<td><button class='addOneOnAnswer'>답변</button></td>"
        		+"</tr>");
        		$(".inquiry-body").append(row);
        	});
        }
	});
}
$(document).ready(function(){
	getList();

	$(".inquiry-body").on("click", ".addOneOnAnswer", function() {
		code = $(this).closest("tr").find(".one-on-code").text();
        $("#inquriy_list").hide();
		$("#inquriy_detail").show();
		$.ajax({
	        url : "/admin/inqurity/details",
	        type: "GET",
	        data:{
	        	onecode:code
	        },
	        success : function(result) {
	        	$("#select_title").text(result.one_title);
	        	$("#select_date").text(result.one_date);
	        	$("#select_content").text(result.one_content);
	        	if(result.one_answer !== null && result.one_answer !== ""){
	        		$("#select_answer").text(result.one_answer);
	        	}else{
	        		$("#select_answer").text("");
	        	}
	        }
		
	    });
	});
});
//마우스 hover 시 <a> 태그의 밑줄 추가
$(document).on("mouseenter", ".one-on-title", function() {
    $(this).css("text-decoration", "underline");
});

// 마우스 hover 종료 시 <a> 태그의 밑줄 제거
$(document).on("mouseleave", ".one-on-title", function() {
    $(this).css("text-decoration", "none");
});

$(document).on("click", "#search_oneon", function(){
	std = $("#datestr").val();
	end = $("#dateend").val();
	text = $("#keywordtext").val();
	keyword = $("#keyword").val();

	if (std == '' && !end =='' || !std == '' && end =='') {
        alert("시작일과 종료일을 모두 입력해주세요.");
        return; // 함수 실행 중단
    }else{
    	$.ajax({
            url : "/admin/inqurity/search",
            type: "GET",
            data:{
            	stdate:std,
            	endate:end,
            	searchtext:text,
            	option:keyword
            },
            success : function(result) {
            	$(".inquiry-body").empty();
            	$(result).each(function(){
            		let row = $('<tr>');
            		if($(this)[0].one_state == 1){
            			row.append("<td><span class='processing'>답변대기</span></td>");
            		}else if($(this)[0].one_state == 2){
            			row.append("<td><span class='complete'>답변완료</span></td>");
            		}
            		row.append("<td class='one-on-code'>"+$(this)[0].one_code+"</td>"
            		+"<td>"+$(this)[0].one_title+"</td>"
            		+"<td>"+$(this)[0].writer_code+"</td>"
            		+"<td>"+$(this)[0].one_date+"</td>"
            		+"<td><button class='addOneOnAnswer'>답변</button></td>"
            		+"</tr>");
            		$(".inquiry-body").append(row);
            	});
            }
    	}); 
    }
})
		</script>

    <!-- 본문 -->
    <div class="main">
        <h3> 1:1 문의 관리(게시판 형식)</h3>
        <hr>
        <div class="filter">
            <label for="date">시작일:
                <input type="date" id="datestr"></label>
            <label for="date">종료일:
                <input type="date" id="dateend"></label>
            <select id="keyword">
                <option value="title">제목</option>
                <option value="writer">작성자</option>
            </select>
            <label for="text">
                <input type="text" id="keywordtext"></label>
            <button id="search_oneon">검색</button>
        </div>
        <div style="overflow-x:auto; overflow-y:auto;" class="table-box">
            <table class="api-table" id="atable">
            	<thead>
                <tr>
                    <th class="inquiry-state">답변여부</th>
                    <th class="inquiry-number">No.</th>
                    <th class="inquiry-title">제목</th>
                    <th class="inquiry-name">작성자</th>
                    <th class="inquiry-date">등록일</th>
                    <th class="inquiry-btn">답변하기</th>
                </tr>
                </thead>
                <tbody class="inquiry-body">
                </tbody>
           </table>
        </div>
   </div>
    