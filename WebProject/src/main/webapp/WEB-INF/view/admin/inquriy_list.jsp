<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

$(document).on("click", "#inquriy_title", function(){
		console.log("test?문의");
		$("#inquriy_list").hide();
		$("#inquriy_detail").show();
		/* var index = $(this).parent().parent().index();
		var tr = $(this).parent().parent();
		var td = tr.children(); */
	   	// 선택한 정보 edit jsp에 넣기
	   	/* $("#api_edit").ready(function(){
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
		    $("#catkids").val(td.eq(11).text()).prop("selected", true);
		    $("#edit_Thumbnail").val(td.eq(12).text());
	   	});
		 */
});

		</script>

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
                    <td><input type="button" value="티켓 환불문의" id ="inquriy_title"></td>
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
                </table>
        </div>
   </div>
    