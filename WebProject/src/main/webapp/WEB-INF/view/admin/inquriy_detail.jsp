<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>    
$(document).on("click","#oneon_submit",function() {
    console.log("답변");
    
	var answer = $("#select_answer").val();
	$.ajax({
		url : "/admin/oneon/answer",
        type: "POST",
        data:{
        	onecode:code,
        	oneonanswer:answer
        },
        success : function(result) {
        	$("#inquriy_list").show();
        	$("#inquriy_detail").hide();
        	getList();
        }
		});
	});
</script>
 <div class="main">
     <h3> 1:1 문의 관리(게시판 형식)</h3>
     <hr>
     <div class="inquiry-box">
         <div class="mypage_right_wrap">
				<div style="margin-top: 17px;">
					<div style="width: 905px; margin-top: 10px; border: 1px solid #ccc; overflow: hidden; font-size: 18px;">
						<div style="float: left; width: 100px; height: 45px; padding: 13px 15px; background: #eee;">
							제목</div>
						<div style="float: left; width: 700px; hight:50px; padding: 9px 20px; background: #f9f9f9;">
							<label id="select_title" style="width: 590px; height: 24px; padding: 2px 5px; font-size: 18px; color: #313131;"></label>
							<label id="select_date" style="width: 100px; height: 24px; padding: 2px 5px; font-size: 18px; color: #313131; float:right;"></label>
						</div>
					</div>
					<div style="margin-top: 10px; border: 1px solid #ccc; width: 905px; height: 200px;">
						<label id="select_content" style="width: 745px; border: none; font-size: 18px; color: #313131; line-height: 22px; padding: 15px; resize: none;"></label>
					</div>
				</div>
				<div style="margin-top: 17px;">
					<div style="width: 905px; margin-top: 10px; border: 1px solid #ccc; overflow: hidden; font-size: 18px;">
						<div style="float: left; width: 100px; height: 45px; padding: 13px 15px; background: #eee;">
							답변</div>
						<div style="float: left; width: 700px; hight:50px; padding: 9px 20px; background: #f9f9f9;">
							<label id="select_answerdate" style="width: 100px; height: 24px; padding: 2px 5px; font-size: 18px; color: #313131; float:right;"></label>
						</div>
					</div>
					<div style="margin-top: 10px; border: 1px solid #ccc; width: 905px; height: 150px;">
						<textarea id="select_answer" style="width: 870px; height: 120px; border: none; font-size: 18px; color: #313131; line-height: 22px; padding: 15px; resize: none;" placeholder= "답변 등록"></textarea>
					</div>
					<button id="oneon_submit" style="float: right;">등록</button>
				</div>
			</div>
     </div>

 </div>

        
