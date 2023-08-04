<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="contentstyle1" id="content_3">
  <div class="main_tab_wrap">
  <div class="main_tab_title">티켓 관련 문의사항을 남겨주세요.</div>

	<div style="font-size:15px; color:#777; margin:15px 15px 0 15px;">
		※ 환불/취소요청은 <a href="myticket.php?mode=buy">
		<span style="font-weight:400; text-decoration:underline; color:#000;">마이티켓 &gt; 환불신청
		</span>
		</a>, 이용 불편 및 요청사항은 
		<a href="bbs_list.php?tb=board_private">
		<span style="font-weight:400; text-decoration:underline; color:#000;">1:1문의
		</span>
		</a>를 이용해주세요.
	</div>

	<div style="padding:10px 10px 10px 10px; background:#f5f5f5; margin:15px;">

		<div style="padding:10px 10px 0 10px; overflow:hidden;">
<div id="reply_write_frm2" name="reply_write_frm" style="margin:0; display:none;">

  <div style="float:left;">
    <textarea id="content_comment2" name="content_comment2" style="font-size:15px; color:#000; font-weight:300; width:520px; 
    height: 300px padding:5px 10px; padding-left: 10px; height:90px; line-height:170%; border:1px solid #e6e6e6;" 
    placeholder="· Q&amp;A를 통한 일정변경/환불 문의는 처리되지 않습니다.
· 날짜/시간 변경은 불가하며 환불 후 다시 예매해야 합니다.
· 티켓 환불은 마이티켓>예매내역에서 신청 가능합니다."></textarea>
  </div>
  <div style="float:right;">
    <button style="width:110px; height:92px; border:1px solid #e6e6e6;
     font-size:18px; font-weight:600; color:#555; background:#fff;
      margin-top:; text-align:center; cursor:pointer;" onclick="submitForm2()">등록
    </button>
  </div>
</div>
</div>
</div>
<div>
<div id="QnA_text_container" style="width:100%; border:1px solid #e6e6e6; background:#fff;">
</div>
</div>
</div>
</div>
<script>
//페이지가 로드될 때 폼의 가시성 설정
function setFormVisibility2() {
  var userId = "${sessionScope.userId}";
  var form = document.getElementById("reply_write_frm2");

  if (!userId) {
    form.style.display = "none"; // 폼 숨김
  } else {
    form.style.display = "block"; // 폼 보이기
  }
}
</script>