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

<form name="reply_write_frm"  onsubmit="return reply_check()" target="h_blank" style="margin:0;">

  <div style="float:left;">
    <textarea id="content_comment2" name="content_comment2" style="font-size:15px; color:#000; font-weight:300; width:520px; 
    height: 300px padding:5px 10px; padding-left: 10px; height:80px; line-height:170%; border:1px solid #e6e6e6;" 
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
</form>

<!-- 로그인개선 : NeoHero 2009.07.30 -->
<iframe name="h_blank" id="h_blank" src="" width="0" height="0" style="visibility:hidden">
</iframe>
</div>
</div>
<div>
<span id="replyViewLabel" name="replyView">
<div style="width:100%; padding-top:15px;">
<div id="Q&A_text_container" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">
</div>
	<form name="reply_frm_1"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  
  <tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;">
    <span style="font-size:15px; color:#555; font-weight:400;">
    <img src="https://timeticket.co.kr/img/sns_icon/icon_conn_kakao.gif" style="padding-right:3px;">
     kakao_2908656890
     </span>&nbsp;&nbsp;(2023-07-13 15:22:23)&nbsp;&nbsp;&nbsp;
     <a href="#reply" onclick="GoWrite( 'writeDiv_2', '', '', '', '', '2', '등록합니다' )">
     <img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기">
     </a>
     </td>
  </tr>
  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">8월에도 공연이 있나요?</td>
  </tr>
  <tr id="habuReply_2">
   <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
	<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
	 <tbody>
	 <tr>
      <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
       <img src="https://timeticket.co.kr/img/reply_icon.png">
      </td>
      <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2023-07-13 16:38:25)&nbsp;&nbsp;
      </td>
     </tr>
  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">연극 '라면'은 8월에도 진행됩니다. 날짜 선택하실 때 달력을 8월로 지정하시면 예매가 가능한 날짜를 확인하실 수 있습니다. :)</td>
  </tr>
    </tbody>
    </table>
   </td>
  </tr>
  <tr id="writeDiv_2" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody>
       <tr>
        <td>
          <table style="width:100%;">
          <tbody>
           <tr>
            <td><textarea id="content_comment2" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;"></textarea></td>
           </tr>
          </tbody>
         </table>
        </td>
        <td style="width:74px; padding-left:5px;">
        <input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;">
        </td>
       </tr>
      </tbody>
     </table>
    </td>
   </tr>
  </tbody>
 </table>
</form>
<form name="reply_frm_3"  target="h_blank" style="margin:0;">
  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">
  
  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_kakao.gif" style="padding-right:3px;"> kakao_1890701747</span>&nbsp;&nbsp;(2023-05-13 10:29:07)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_4', '', '', '', '', '4', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기"></a></td>
  </tr>
  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">안녕하세요? 전상희라고 하는데 오늘 공연을 아침 8시경에 예배를 했는데 처음엔 예매확잉이 보였는데 갑자기 예매권이 보이질 않아요~ 결제내역도 있고 잘 예매가 된것같은데.. 확인 부탁드려요</td>
  </tr>
  <tr id="habuReply_4">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2023-05-13 13:52:52)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">회원님 예매내역을 조회해 본 결과 정상적으로 예매 완료되셨음이 확인됩니다. 마이티켓 &gt; 예매내역을 통해 확인 가능하며, 카카오 알림톡으로 발송된 예매내역을 통해서도 확인 가능한 점 참고 부탁드립니다.</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_4" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_5"  target="h_blank" style="margin:0;">
  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_naver.gif" style="padding-right:3px;" > naver_39316695</span>&nbsp;&nbsp;(2023-05-01 07:04:52)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_6', '', '', '', '', '6', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">만 11세 미만 (초4 13년생)은 보호자동반시 괸람가능할까요?</td>
  </tr>

  <tr id="habuReply_6">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2023-06-01 11:03:30)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">연극 라면은 보호자 동반시 8세까지 관람 가능합니다. 단, 7세 이하 미취학 아동은 보호자 동반시에도 관람 불가한 점 참고 부탁드립니다.</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_6" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_5"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">dalcomiss</span>&nbsp;&nbsp;(2022-10-30 21:16:34)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_7', '', '', '', '', '7', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">내 인생 최악의 연극. 연극 티켓 바꿔주는 직원인가? 대놓고 싸움을 걸고, 20분까지 입장이라 20분에 입장했는데 연극 극장안에 들여보내주지않아 4만원 가까이 돈을 날림. 여기 연극 직원들 태도의 문제 덕분에 앞으로 대학로에서 연극 볼 생각이 싹 살아짐~^^ 덕분에 최악의 연극을 거를 수 있는 계기가 되었고, 대학로 연극의 끝을 봄 일주일의 끝을 연극으로 마무리하려던 내 계획이 틀어져서 연극 볼 수 없었음 20분까지 입장이면 왜 20분에 들어가면 안되나요~?? ^^ 20분에 들어간 사람도 있던데~ 차별하는건지요? 법적 법적 하시던데 협박도 하신건가요?</td>
  </tr>

  <tr id="habuReply_7">
    <td></td>
  </tr>


  <tr id="writeDiv_7" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_8"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">dalcomiss</span>&nbsp;&nbsp;(2022-10-30 21:10:26)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_9', '', '', '', '', '9', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">그리고 왜 제 후기가 가려졌나요? 1점짜리 후기는 가리는 건가요?</td>
  </tr>

  <tr id="habuReply_9">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2022-10-31 10:10:35)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">이용후기는 포토후기 우선으로 노출되며, 포토후기 하단을 확인하면 정상적으로 확인 가능합니다. 서비스 운영상 필요한 경우(욕설/비하/스포일러 등)가 아니면 삭제하지 않는 점 참고 부탁드립니다.</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_9" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_8"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">dalcomiss</span>&nbsp;&nbsp;(2022-10-30 21:09:45)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_10', '', '', '', '', '10', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">왜 20분까지 입장이면 20분에 들어갔을때 못들어가게 하셨나요? 직원분 3명이서 계속 기달리라는 말만하고 결국 돈 날렸습니다.</td>
  </tr>

  <tr id="habuReply_10">
    <td></td>
  </tr>


  <tr id="writeDiv_10" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_11"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_naver.gif" style="padding-right:3px;" > naver_44505770</span>&nbsp;&nbsp;(2022-08-31 19:37:59)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_12', '', '', '', '', '12', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">소비자가 좌석 지정은 못하나요?</td>
  </tr>

  <tr id="habuReply_12">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2022-09-01 09:17:01)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">연극 '라면'은 비지정석으로 예매만 가능합니다. 공연별 좌석 배정 방식은 '안내 &gt; 관람정보' 영역을 확인해주세요. :)</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_12" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_13"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">ffkee3</span>&nbsp;&nbsp;(2022-08-11 00:09:26)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_14', '', '', '', '', '14', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">안녕하세요 학생인데 학생증을 잃어버려서 그런대 학생증 필수 지참이라는데 티켓도 이미 사서 환불이 안되는데 어떻게 하나요..</td>
  </tr>

  <tr id="habuReply_14">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2022-08-11 10:33:18)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">관람 연령이 지정된 공연 특성상 연령을 증빙할 수 있는 자료가 필요합니다. 학생증 외에 가능한 증빙자료에 대해서는 공연사(02-742-7611)로 문의 부탁드립니다.</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_14" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_15"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_naver.gif" style="padding-right:3px;" > naver_164704362</span>&nbsp;&nbsp;(2022-08-10 16:24:08)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_16', '', '', '', '', '16', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">10월달에도 공연하나요?<br>
단체 관람 예약하려 합니다</td>
  </tr>

  <tr id="habuReply_16">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2022-08-10 17:58:28)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">연극 '라면'은 오픈런 공연으로 10월에도 진행될 예정입니다. 단체 관람 문의는 고객 센터(1599-3089)로 연락 주시면 도움 드리도록 하겠습니다. :)</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_16" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_17"  target="h_blank" style="margin:0;">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">bmwwwww5</span>&nbsp;&nbsp;(2022-08-09 20:18:22)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_18', '', '', '', '', '18', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" ></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">비가 많이 와서요<br>
10일공연 정상 진행 하나요????</td>
  </tr>

  <tr id="habuReply_18">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2022-08-10 10:11:46)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">우천으로 인해 공연 진행이 어려울 경우 공연사에서 개별로 안내를 드리고 있습니다. 금일 공연은 정상 진행될 예정이며 보다 세부적인 사항은 공연사(02-742-7611)로 문의 부탁드립니다.</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_18" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table style="width:100%;">
      <tbody><tr>
        <td>
          <table style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" ></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="https://timeticket.co.kr/mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>


</div>

<div style="text-align:center; font-size:14px; padding:20px 0 10px 0;">
	<font style="font-size:14px">이전 <span style="margin:4px; width:22px; height:16px; padding:3px;><a href=&quot;#replyView&quot; class=&quot;goPage&quot; val=&quot;start=0&amp;number=4343&amp;id=&amp;action=" "="" onfocus="this.blur()"><font color="red"><b>1</b></font></span><span style="margin:4px; width:16px; height:16px; padding:3px;"><a href="#replyView" class="goPage" val="start=10&amp;number=4343&amp;id=&amp;action=" onfocus="this.blur()">2</a></span><span style="margin:4px; width:16px; height:16px; padding:3px;"><a href="#replyView" class="goPage" val="start=20&amp;number=4343&amp;id=&amp;action=" onfocus="this.blur()">3</a></span><a href="#replyView" class="goPage" val="start=10&amp;number=4343&amp;id=&amp;action=" onfocus="this.blur()"> 다음</a></font>
</div>


</span>
	</div>
</div>
</div>