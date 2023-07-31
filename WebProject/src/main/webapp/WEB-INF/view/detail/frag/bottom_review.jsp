<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="contentstyle1" id="content_2" style=";">
  <div class="main_tab_wrap">
  <div class="score_section" style="padding-top:10px">
    <div class="score_section_left" style="margin-top:10px;">
      <div class="score_section_left_average">0</div>
      <div class="score_section_left_stars">
        <div class="score_section_left_star">
          <div class="score_section_left_star_filled" style="width: calc(0 * 24px);"></div>
        </div>
      </div>
      <div class="score_section_left_total">(0명)</div>
    </div>
    <div class="score_section_right">
      <div class="progress_section">
        <div>5점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 0%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>4점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 0%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>3점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 0%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>2점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 0%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>1점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 0%;"></div>
        </div>
      </div>
    </div>
  </div>
  
<div style="padding:10px 10px 10px 10px; background:#f5f5f5; margin: 15px;">

		<div style="padding:10px 10px 10px 10px; overflow:hidden;">

<form name="reply_write_frm" onsubmit="return reply_check()" target="h_blank" style="margin:0;">
    <div style="float:left;">
      <textarea id="content_comment" name="content_comment" style="font-size:15px; color:#000; font-weight:300; width:520px; padding-left:10px; height:80px; line-height:170%; border:1px solid #e6e6e6;" placeholder="리뷰를 작성해주세요"></textarea>
      <br>
      <input type="number" id="star_rating" min="0" max="5" step="0.5" value="0">
      <br>
      <input type="file" id="image_upload" accept="image/*">
      <br>
    </div>
    <div style="float:right;">
      <button style="width:110px; height:92px; border:1px solid #e6e6e6; font-size:18px; font-weight:600; color:#555; background:#fff; margin-top:; text-align:center; cursor:pointer;" onclick="submitForm()">등록</button>
    </div>
  </form>
<!-- 로그인개선 : NeoHero 2009.07.30 -->
<iframe name="h_blank" id="h_blank" src="" width="0" height="0" style="visibility:hidden"></iframe>
</div>
</div>
  
  
  <div class="review_start" style=";">
  	<div class="review_text" id="review_text_container">
    </div>
  </div>
</div>
</div>