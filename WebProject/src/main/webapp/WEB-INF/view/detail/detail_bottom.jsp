<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail_bottom</title>
<link rel="stylesheet" href="/resources/detail/css/detail_bottom.css"/>
<script src="/resources/detail/js/detail_bottom.js" defer></script>
</head>
<body style="background-color: #fff; height: auto;">
	<section style="width:820px; margin:0 auto; padding-top:20px;">

    <!-- 메뉴영역, js/ajaxtabs.css -->
    <ul id="maintab" class="shadetabs FixedTopMenu" style="border-radius:10px 10px 0 0;">
      <li id="tab_01_notice" class="selected"><a onclick="loadTab('content_1', this)" class="tabLink" href="#default" rel="ajaxcontentarea"><span>안내</span></a></li>
      <li id="tab_02_review" class=""><a onclick="loadTab('content_2', this)"><span>후기<span style="letter-spacing:-1px;">(826)</span></span></a></li>
      <li class=""><a onclick="loadTab('content_3', this)"><span>Q&amp;A<span style="letter-spacing:-1px;">(24)</span></span></a></li>
      <li class=""><a onclick="loadTab('content_4', this)"><span>장소</span></a></li>
      <li class=""><a id="tab_05_refund" onclick="loadTab('content_5', this)"><span>환불규정</span></a></li>
    </ul>

    <!---------------------- 탭 영역 시작 ----------------------->
    <div id="ajaxcontentarea" class="contentstyle" style="border-radius:0 0 10px 10px">
    <!-- 안내탭 시작 -->
    <div class="contentstyle1" id="content_1">
    	<div class="main_tab_wrap">
        <div>
          <div class="viewpage_noti">예매정보</div>
          <div class="viewpage_text radius_box">
            <p>· 진행기간: ${startDate} ~ ${endDate}</p>
            <p>· 이용등급: ${age}</p>
            <p>· 이용시간: ${runtime}</p>
          </div>
        </div>

        <div style="margin-top:25px; ">
          <div class="viewpage_noti">기획사 공지사항</div>
          <div class="viewpage_text radius_box"><p>· 공연사 전화문의는 마지막 회차 공연 시작 전까지 가능합니다.</p></div>
        </div>

        <div style="margin-top:25px;">
          <div class="viewpage_noti">이용정보</div>
          <div class="viewpage_text radius_box"><p>· 예매가능시간: 공연 시작 10분 전까지</p>
			<p>· 티켓배부: 공연 시작 40분 전부터 공연장 매표소에서 배부</p>
			<p>· 티켓수령: 예매내역 제시 후 현장 수령(신분증/증빙자료 지참)</p>
			<p>· 입장시간: 공연 시작 15분 전부터 입장 가능</p>
			<p>· 좌석배정: 비지정석(타예매처 지정석 제외 후 매표소 선착순 배정)</p>
			<p class="txt_red">※ 각각 예매하더라도 함께 발권하면 연석 배정 가능합니다.</p></div>
        </div>


        <!-- 상세이미지 -->
        <div class="info_detail_poster" style="background-image: url('${poster}');">
          <%-- <img alt="상세이미지" src="${poster}"> --%>
          <div class="info_detail_gradient"></div>
          <div class="info_detail_btn" onclick="showMoreDetailImage()">펼쳐보기
            <img src="https://timeticket.co.kr/mobile_img/detail/icon_down.png" style="width:25px; vertical-align:2px;padding-left:10px;">
          </div>
        </div>
        <div id="main_img" class="main_img">
        	<!-- API에서 이미지 가져옴 -->
			<c:forEach items="${image}" var="item">
				<c:forEach	items="${item.styurl}" var="test">
					<img src="${test}">
				</c:forEach>
			</c:forEach>
		</div>	

        <div style="margin-top:25px;">
          <div class="viewpage_noti">유의사항</div>
          <div class="viewpage_text radius_box"><p>· 공연 시작 후 발권 또는 입장 불가(지연입장 불가)</p>
<p>· 지각으로 인해 관람하지 못할 시 환불/변경 불가</p>
<p>· 지역착오, 연령 미숙지로 관람하지 못할 시 환불/변경 불가</p>
<p>· 음식물 반입 금지. 공연 중 사진/동영상 촬영 금지</p>
<p class="txt_red">· 관람 당일은 결제 후 환불/변경 불가하니 신중히 예매하세요.</p></div>
        </div>

        <!--------- 장소안내 --------->
        <div style="margin-top:25px;">
          <div class="viewpage_noti">장소안내</div>
          <div class="viewpage_text radius_box" style="border-radius: 10px 10px 0 0;">
            <p>· 장소: ${space} &nbsp;/&nbsp; 총 200석</p>
            <p>· 주소: 서울 종로구 대학로10길 5 , 지하1층</p>
            <p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
          </div>
          <!-- 지도가 위치할 곳 -->
          <div align="center" style="margin-top:10px;">
            <div style="z-index:-1;" id="daum_map">
            	<img src="../resources/common/image/question-mark.png"> 
            </div>
          </div>
        </div>

        <!--------- 판매정보 --------->
        <div style="margin-top:25px; margin-bottom:25px;">
          <div class="viewpage_noti">판매정보</div>

          <div class="viewpage_text border_box">
            <div class="viewpage_flex">
              <div>주최/주관</div>
              <div>주식회사 엠컬쳐컴퍼니</div>
            </div>
            <div class="viewpage_flex">
              <div>문의전화</div>
              <div>📞 <a href="TEL:02-742-7611">02-742-7611</a></div>
            </div>
            <div class="viewpage_flex" style="display:none;">
              <div>문의링크</div>
              <div>🔗 <a href="" target="_blank" style="text-decoration:underline;"></a></div>
            </div>
            <div class="viewpage_flex">
              <div>환불규정</div>
              <div><a href="#tab_view" onclick="loadTab('content_5', document.getElementById('tab_05_refund'))"><span>환불규정 바로가기</span></a></div>
            </div>
            <div class="viewpage_flex">
              <div>환불방법</div>
              <div>마이티켓 &gt; 예매내역에서 직접 취소</div>
            </div>

          </div>
        </div>
		</div>
      </div>
  <!-- 후기탭 시작 -->
  <div class="contentstyle1" id="content_2" style=";">
  <div class="main_tab_wrap">
  <div class="score_section" style="padding-top:10px">
    <div class="score_section_left" style="margin-top:10px;">
      <div class="score_section_left_average">4.8</div>
      <div class="score_section_left_stars">
        <div class="score_section_left_star">
          <div class="score_section_left_star_filled" style="width: calc(4.8 * 24px);"></div>
        </div>
      </div>
      <div class="score_section_left_total">(826명)</div>
    </div>
    <div class="score_section_right" style="margin-top:15px; margin-left:5px;">
      <div class="progress_section">
        <div>5점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 89.1041162227603%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>4점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 6.295399515738499%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>3점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 3.1476997578692494%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>2점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 0.6053268765133172%;"></div>
        </div>
      </div>
      <div class="progress_section">
        <div>1점</div>
        <div class="progress_section_bar">
          <div class="progress_section_value" style="width: 0.847457627118644%;"></div>
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
    <div class="review_wrap" id="user_review_919427">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				김*현
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-07-15
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_919427">
			평점도 높고 후기도 많아서 기대 많이하고 갔는데 그 기대보다도 그 이상의 재미였어요! <br>
중간에 실제 라면냄새가 나서… 새벽에 라면을 끓여먹어야했지만ㅎㅎ <br>
배우들 연기도 최고였고 시나리오 전체적으로 구성이 탄탄하더라구요! 모든 연령한테 추천하고 싶은 연극이였습니다! 
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_919427" onclick="showFullReview(919427)">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 919427" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_919427.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_919427.jpeg" onclick="showOriginalRatio(919427)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_915998">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				장*규
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-07-11
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_915998">
			레트로 코미디답게 너무 재메있었어요!<br>
배우분들 연기도 수준급이라 몰입도 잘되었습니당.<br>

		</div>
		<br>
    <div class="review_text_seemore" id="seemore_915998" onclick="showFullReview(915998)" style="display: none;">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 915998" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_915998.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_915998.jpeg" onclick="showOriginalRatio(915998)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_914548">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				고*혜
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-07-08
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_914548">
			배우분들 연기도 엄청 뛰어나시고 자연스러우셔서 너무 좋았습니다! 굉장히 귀여운 공연이였어요. 가운데 계신 배우님 덕분에 너무 웃기고 재미있게 봤는데요ㅋㅋㅋㅋ 중간에 웃참하시느라 고생 많으셨습니다ㅋㅋㅋㅋㅋㅋ 그리고 이한배우님 등장하시마자 뒤에서 나지막히 우와...잘생겼다.... 하신 분.... 저랑 같은 생각 하셨네요.........감사합니다....
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_914548" onclick="showFullReview(914548)">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 914548" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_914548.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_914548.jpeg" onclick="showOriginalRatio(914548)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_900836">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				김*영
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-06-14
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_900836">
			연극 보는내내 시간이 어떻게 흘러갔는지 몰랐네요ㅎㅎ 80년대생 사람으로 추억의 음악들, 그리고 공연장 밖에 전시 되어있었던 물건들(삐삐, 테이프, 잡지 등)보고 잠시 그 시절로 돌아간 것 같아 기분이 몽글몽글 했네요:) 배우들 연기 정말 잘하셨고 극 끝날 때쯤 라면 그릇 핀조명 하나로 비추는 장면이 인상적이었습니다.<br>
잘 봤습니다^^
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_900836" onclick="showFullReview(900836)">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 900836" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_900836.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_914548.jpeg" onclick="showOriginalRatio(900836)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_901927">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				정*윤
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-06-12
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_901927">
			너무너무 재밌었고 계속 웃으면서 봤어요 배우분들 연기 다 너무 잘히셔서 몰입도가 너무 좋았습니다 ㅠㅠ 너무 재밌었어요 
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_901927" onclick="showFullReview(901927)" style="display: none;">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 901927" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_901927.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_901927.jpeg" onclick="showOriginalRatio(901927)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_862432">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				우*희
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-06-08
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_862432">
			첨으로 연극을 보려갔는데 너무 좋았어요~~~~~
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_862432" onclick="showFullReview(862432)" style="display: none;">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 862432" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_862432.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_862432.jpeg" onclick="showOriginalRatio(862432)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_892558">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				류*수
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-06-05
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_892558">
			배우님들의 열정적인 연기에 빠져들어서 봤어요!<br>
저는 특히 멀티맨.... 계속 웃으면서 봤네요ㅎㅎ 정말 재밌으니 보는 거 강추!
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_892558" onclick="showFullReview(892558)" style="display: none;">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 892558" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_892558.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_892558.jpeg" onclick="showOriginalRatio(892558)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_899071">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				스*일
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-06-04
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_899071">
			생애 첫 연극이 연극라면 입니다~무대위에 있는 분들이 펼치는  땀과 노력이  고스란히 내가 느낄수 있어서 좋았습니다. 앞으로도 연극 많이 관람 할듯합니다. 행복 주셔서 감사 드립니다~
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_899071" onclick="showFullReview(899071)" style="display: none;">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 899071" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_899071.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_899071.jpeg" onclick="showOriginalRatio(899071)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_898452">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				신*철
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-06-03
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_898452">
			굿굿.  연인 및 부부 공감 백배^^
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_898452" onclick="showFullReview(898452)" style="display: none;">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 898452" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_898452.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_898452.jpeg" onclick="showOriginalRatio(898452)">
    </div>
  </div>
</div>

<div class="review_wrap" id="user_review_857623">
	<div class="review_title">
		<div class="review_title_left">
      <div class="review_title_left_stars">
        <div class="review_title_left_star">
          <div class="review_title_left_star_filled" style="width: calc(5 * 19px);"></div>
        </div>
      </div>
			<div class="review_title_left_name" style="padding-left: 10px;">
				권*정
			</div>
		</div>
		<div class="review_title_right" style="padding-right:8px;">
			2023-05-31
		</div>
	</div>

	<div class="review_text">
		<div class="review_text_area" id="text_857623">
			다른연극을 보러가다가  우연히 티켓박스 오픈전에  줄서고계신분들이많아서  그다음 연극으로  정해서 관람하였습니다.공연시간이 어떻게 지나간지도  모를만큼 짧게 느껴졌고   즐겁게 웃고  힐링 타임가졌습니다.웃는가운데에서도 알려주는현재젊은이들의 사회특징을 내포하고있기도하네요.아직보지않은 지인과 재관람 의지도 있답니다. 주변에 소개많이하겠습니다.
		</div>
		<br>
    <div class="review_text_seemore" id="seemore_857623" onclick="showFullReview(857623)">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div class="img_label 857623" viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_857623.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_857623.jpeg" onclick="showOriginalRatio(857623)">
    </div>
  </div>
</div>

  </div>
  <div class="review_seemore_wrap">
    <div class="review_seemore"></div>
  </div>
</div>
</div>
  </div>
  
  <!-- Q&A탭 시작 -->
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

<!-- 장소탭 시작 -->
<div class="contentstyle1" id="content_4">
<div class="main_tab_wrap">
	<div class="main_tab_title">장소안내</div>

  <div class="viewpage_text radius_box" style="margin-top:10px; border-radius: 10px 10px 0 0;">
    <p>· 장소: ${space}</p>
    <p>· 주소: 서울 종로구 대학로10길 5 , 지하1층</p>
    <p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
  </div>
  <!-- 지도가 위치할 곳 -->
          <div align="center" style="margin-top:10px;">
            <div style="z-index:-1;" id="daum_map">
            	<img src="../resources/common/image/question-mark.png"> 
            </div>
          </div>
</div>
</div>

<!-- 환불규정탭 시작 -->
<div class="contentstyle1" id="content_5">
<div class="main_tab_wrap">
	<p class="main_tab_title">환불규정 및 안내사항</p>

	<!-- 상품별 환불규정 분기처리, main_tab.php -->
	<div class="viewpage_text radius_box" style="margin-top:10px; padding-top:0; border-radius: 10px;">
		<p class="viewpage_noti">[환불규정]</p>
<p class="txt_blue">
  <span class="txt_red">※ 구매시점과 무관하게 관람 당일은 환불/변경 불가</span><br>
  ※ 관람 당일 지각/연령미숙지/지역착오로 인한 환불/변경 불가
</p>
<p style="padding-top:10px;">
  1) 구매 당일 요청 시 전액 환불<span class="txt_red"> (단, 당일 관람티켓은 환불 불가)</span><br>
  2) 관람일 7일 전 ~ : 티켓 금액 전액 환불<br>
  3) 관람일 6일 전 ~ 4일 전까지 : 10% 공제 후 환불<br>
  4) 관람일 3일 전 ~ 2일 전까지 : 20% 공제 후 환불<br>
  5) 관람일 1일 전 : 30% 공제 후 환불<br>
  6) <span class="txt_red">관람일 당일(자정) 및 이후 : 환불/취소/변경 불가</span><br>
  <span style="color:#777;">※ 환불 기준 날짜는 밤12시(자정) 기준으로 산정됩니다.</span>
</p>
<p class="viewpage_noti">[주의사항]</p>
<p>
  <span class="txt_red">- 부분환불, 날짜/시간 변경은 지원하지 않습니다.</span><br>
  - 부분환불, 변경을 원하시는 경우 전체 환불 후 재구매하셔야 합니다.<br>

  - 관람 당일 티켓은 환불/취소/변경 불가하니 유의해주세요.<br>
  - 지각/연령미숙지/지역착오로 관람하지 못하더라도 환불 불가합니다.
</p>
<p class="viewpage_noti">[환불방법]</p>
<p style="padding-top:10px; color:#777;">
  <span class="txt_blue">[마이티켓 &gt; 예매내역]에서 [환불신청] 버튼 클릭 후 진행</span><br>
  · 환불은 즉시 처리되며 이후 티켓은 이용할 수 없습니다.<br>
  · 일부 결제수단은 관리자 확인 후 환불이 진행됩니다.<br>
  · 휴대폰결제는 결제월 이후 환불시 수수료가 청구될 수 있습니다.<br>
  · 체크카드/무통장입금은 입금까지 업무일(평일) 기준 3~5일 가량 소요됩니다.
</p>
	</div>

</div>
</div>
</section>
</body>
</html>