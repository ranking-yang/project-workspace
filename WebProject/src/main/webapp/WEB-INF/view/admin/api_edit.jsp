<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 본문 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
	$(document).on("click", "#updatebtn", function(){
		var show = new Object();
		show.performance_code= $("#edit_code").val();
		show.performance_name= $("#edit_title").val();
		show.performance_qty= $("#edit_qty").val();
		show.main_category= $("#cat1").val();
		show.sub_category= $("#cat2").val();
		show.performance_price= $("#edit_price").val();	
		show.start_date= $("#stdate").val();	
		show.end_date= $("#endate").val();	
		show.address= $("#edit_address").val();	
		show.place= $("#edit_place").val();
		show.poster= $("#edit_Thumbnail").attr("src");
		show.kid_state=$("#catkids").val();
		
		console.log(show);
		$.ajax({
			contentType: "application/json",
			type: "POST",
			data: JSON.stringify(show),
			url: "/admin/api/update",
			success: function(data) {
				alert("수정완료");
				$("#api_list").show();
				$("#api_edit").hide();
				standard_select();
			},
			
		});
	});
	
	$(document).on("click", "#backapibtn", function(){
		$("#api_list").show();
		$("#api_edit").hide();
		standard_select();
	});
</script>
<div class="main">
    <h3>API 리스트 관리</h3>
    <hr>
    <div class="top-nav-box">공연/전시/관람</div>
    <div class="table-box">
        <table>
            <tr>
                <td>코드</td>
                <td><input type="text" class="blank" id="edit_code"></td>
                <td>대분류</td> 
                <td><select id="cat1">
                        <option value="show">공연</option>
                        <option value="art">전시</option>
                        <option value="music">음악</option>
                        <option value="kid">키즈</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" class="blank" id="edit_title"></td>
                <td>소분류</td>
                <td><input type="text" class="blank" id="cat2"></td>
            </tr>
            <tr>
                <td>발행개수</td>
                <td><input type="text" class="blank" id="edit_qty"></td>
                <td>시작일</td>
                <td>
                    <label for="date"><input type="date" id="stdate"></label>
                </td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" class="blank" id="edit_price"></td>
                <td>종료일</td>
                <td>
                    <label for="date"><input type="date" id="endate"></label>
                </td>
            </tr>
            <tr>
             	<td>주소</td>
                <td><input type="text" class="blank" id="edit_address"></td>
                <td>장소</td>
                <td><input type="text" class="blank" id="edit_place"></td>
               
            </tr>
            <tr>
                <td>썸네일</td>
                <td><img class="blank" id="edit_Thumbnail" width='300'></td>
            </tr>
        </table>
    </div>
    <button id="updatebtn">저장</button>
    <button id="backapibtn">취소</button>
</div>
