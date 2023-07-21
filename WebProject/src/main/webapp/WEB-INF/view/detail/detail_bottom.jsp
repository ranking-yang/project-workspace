<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail_bottom</title>
<link rel="stylesheet" href="/resources/detail/css/detail_bottom.css"/>
<link rel="stylesheet" href="/resources/detail/css/detail_bottom2.css"/>
<link rel="stylesheet" href="/resources/detail/css/detail_bottom3.css"/>
<link rel="stylesheet" href="/resources/detail/css/detail_bottom4.css"/>
<link rel="stylesheet" href="/resources/detail/css/detail_bottom5.css"/>
<script src="/resources//detail/js/detail_bottom.js"></script>
<style>
  .main_tab_wrap {
    border: 1px solid #eee;
    border-top: none;
    padding: 30px 59px;
    border-radius:0 0 10px 10px;
  }

  /* 상세 이미지 펼쳐보기 */
  .info_detail_btn {
    position: absolute;
    bottom: 15px;
    width: 94%;
    height: 55px;
    line-height: 55px;
    margin-left: 3%;
    border: 1px solid #ccc;
    border-radius: 10px;
    background: #fff;
    color: #000;
    font-size: 20px;
    font-weight: 600;
    text-align: center;
    box-shadow:1px 1px 3px 2px #ddd;
  }
  .info_detail_poster {
    position: relative;
    margin-top: 35px;
    width: 100%;
    height: 700px;
    color: #fff;
    font-size: 20px;
    background-size: 100%;
    background-repeat: no-repeat;
    background-position-y: 0%;
    background-image: url('https://timeticket.co.kr/wys2/file_attach_thumb/2021/05/21/1621571534-67-0_wonbon_N_7_600x600_70_2.jpg');
  }
  .info_detail_gradient {
    width: 100%;
    height: 700px;
    background-image: linear-gradient(to bottom,
    rgba(255, 255, 255, 0) 40%,
    rgba(255, 255, 255, 0.4) 60%,
    rgba(255, 255, 255, 0.8) 80%,
    rgb(255, 255, 255) 100%);
  }

  /* 상세 이미지 스타일   */
  .main_img { margin-top:35px; width:700px; text-align: center; }
  .main_img img { display:block; width:100%; }

  .viewpage_flex {
  display: flex; justify-content: flex-start;
  }
  .viewpage_flex div:nth-child(1) {
    padding-left:10px; width: 120px; color: #888;
  }
  .viewpage_flex div:nth-child(2) {
    color: #000;
  }
  .viewpage_flex a {
    text-decoration: underline;
  }
  .border_box {
  border: 1px solid #eee;
  padding: 10px 20px;
  border-radius: 10px;
  margin-top: 5px;
  }
  .border_box .viewpage_flex {
    border-bottom: 1px solid #eee; padding-bottom: 8px; margin-bottom: 8px;
  }
  .border_box .viewpage_flex:last-child {
    border: none; padding-bottom: 0; margin-bottom: 0;
  }

  .now_engine { padding-bottom:15px; font-size:15px; font-weight:400; }
  .now_engine a { color:#555; }

</style>
</head>
<body style="background-color: #fff; height: auto;">

	<section style="width:820px; margin:0 auto; padding-top:20px;">
    <div class="review_preview" style=";">
    	
      <div class="review_preview_container">
        <div class="review_preview_title_section">
          <div class="review_preview_left">
            <span class="review_preview_title">이용후기</span>
            <span class="review_preview_number">826</span>
            <span class="review_preview_title">평점</span>
            <span class="review_preview_number" style="color: #ff4b4b;">4.8/5</span>
          </div>
          <div class="review_preview_right">
            후기 더보기
            <span class="review_preview_right_btn"></span>
          </div>
        </div>
        <div class="review_preview_samples">
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
		<div class="review_text_area" id="sample_review_0">
			평점도 높고 후기도 많아서 기대 많이하고 갔는데 그 기대보다도 그 이상의 재미였어요! <br>
중간에 실제 라면냄새가 나서… 새벽에 라면을 끓여먹어야했지만ㅎㅎ <br>
배우들 연기도 최고였고 시나리오 전체적으로 구성이 탄탄하더라구요! 모든 연령한테 추천하고 싶은 연극이였습니다! 
		</div>
    <div class="review_text_seemore" id="sample_seemore_0" onclick="showFullReviewForSample(0)">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_919427.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_919427.jpeg" onclick="showOriginalRatio(0)" class="sample_img_label 0">
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
		<div class="review_text_area" id="sample_review_1">
			레트로 코미디답게 너무 재메있었어요!<br>
배우분들 연기도 수준급이라 몰입도 잘되었습니당.<br>

		</div>
    <div class="review_text_seemore" id="sample_seemore_1" onclick="showFullReviewForSample(1)" style="display: none;">
			... 더보기
		</div>
	</div>

  <div style="1; margin-top: 10px;">
    <div viewmode="off" style="background-image: url(https://timeticket.co.kr/wys2/user_review/4343/img_915998.jpeg)" name="https://timeticket.co.kr/wys2/user_review/4343/img_915998.jpeg" onclick="showOriginalRatio(1)" class="sample_img_label 1">
    </div>
  </div>
</div>

        </div>
      </div>
    </div>
  </section>
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
    
    <div class="contentstyle1" id="content_1">

        <!-- 클래스 안내 배너 -->
        <div style="display:none;; width:700px; height:95px; margin-bottom:20px;">
          <img src="img/bnr_class_noti.png" style="width:700px; border-radius:10px;" alt="예매전 주의사항 - 클래스">
        </div>

        <div style="margin-top:10px;">
          <div class="viewpage_noti">예매정보</div>
          <div class="viewpage_text radius_box">
            <p>· 진행기간: OPEN RUN</p>
            <p>· 이용등급: 만 11세 이상</p>
            <p>· 이용시간: 약 90분</p>
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
        <div class="info_detail_poster" alt="상세">
          <div class="info_detail_gradient"></div>
          <div class="info_detail_btn" onclick="showMoreDetailImage()">펼쳐보기
            <img src="https://timeticket.co.kr/mobile_img/detail/icon_down.png" style="width:13px; vertical-align:2px;padding-left:10px;">
          </div>
        </div>
        <div id="main_img" class="main_img"><div style="max-width: 100%; width: 700px; height: 0; margin:20px 0; padding-bottom: 56.25%; position: relative;">
			<iframe src="https://www.youtube.com/embed/s8Pbg-GSu6o" allowfullscreen="" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0;"></iframe>
			</div>
			<img src="//aidankims.cdn2.cafe24.com/ticket/4300/4343/4343_photo.jpg?230531">
			<img src="//aidankims.cdn2.cafe24.com/ticket/4300/4343/4343_reviewevent.jpg?230705">
			<img src="//aidankims.cdn2.cafe24.com/ticket/4300/4343/4343_time_7.jpg?220930">
			<img src="//aidankims.cdn2.cafe24.com/ticket/4300/4343/4343_notice.jpg?230331">
			<img src="//aidankims.cdn2.cafe24.com/ticket/4300/4343/4343_00.jpg?230704">
			<img src="//aidankims.cdn2.cafe24.com/ticket/4300/4343/4343_cast_7.jpg">
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
            <p>· 장소: 해피씨어터&nbsp;/&nbsp;총 200석</p>
            <p>· 주소: 서울 종로구 대학로10길 5 , 지하1층</p>
            <p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
          </div>
          <div align="center" style="margin-top:10px;">
            <div style="z-index:-1;" id="daum_map">
              <div id="map" style="height: 350px; border-radius: 0px 0px 10px 10px; position: relative; overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);"><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute;"><div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="https://map1.daumcdn.net/map_2d/2306uwn/L3/2005/897.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -245px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map2.daumcdn.net/map_2d/2306uwn/L3/2005/898.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 11px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map3.daumcdn.net/map_2d/2306uwn/L3/2005/899.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 267px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map0.daumcdn.net/map_2d/2306uwn/L3/2005/900.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 523px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map1.daumcdn.net/map_2d/2306uwn/L3/2006/897.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -245px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map2.daumcdn.net/map_2d/2306uwn/L3/2006/898.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 11px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map3.daumcdn.net/map_2d/2306uwn/L3/2006/899.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 267px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map0.daumcdn.net/map_2d/2306uwn/L3/2006/900.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 523px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map1.daumcdn.net/map_2d/2306uwn/L3/2007/897.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -245px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map2.daumcdn.net/map_2d/2306uwn/L3/2007/898.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 11px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map3.daumcdn.net/map_2d/2306uwn/L3/2007/899.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 267px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map0.daumcdn.net/map_2d/2306uwn/L3/2007/900.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 523px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 700px; height: 350px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; width: 3500px; height: 1750px; left: -1400px; top: -700px;" viewBox="0 0 3500 1750"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);"><div style="position: absolute; margin: -39px 0px 0px -14px; z-index: 0; left: 350px; top: 175px;"><img draggable="false" src="https://t1.daumcdn.net/mapjsapi/images/marker.png" alt="" role="presentation" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 29px, 42px, 0px); top: 0px; left: 0px; width: 29px; height: 42px;"><img src="https://t1.daumcdn.net/mapjsapi/images/transparent.gif" alt="" role="presentation" draggable="false" usemap="#daum.maps.Marker.Area:v" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 29px; height: 42px;"><map id="daum.maps.Marker.Area:v" name="daum.maps.Marker.Area:v"><area href="javascript:void(0)" alt="" role="presentation" shape="poly" coords="14,39,9,27,4,21,1,16,1,10,4,4,11,0,18,0,25,4,28,10,28,16,25,21,20,27" title="" style="-webkit-tap-highlight-color: transparent;"></map></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);"><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;"><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 46px;"></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">50m</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;"><img src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png" alt="Kakao 지도로 이동" style="float: left; width: 32px; height: 10px; border: none;"></a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"><div style="width: 32px; border-radius: 3px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px; position: absolute; left: 665px; top: 3px;"><button draggable="false" title="확대" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: none; border-right: none; border-bottom: 1px solid rgb(226, 226, 226); border-left: none; border-image: initial; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px 0px / 116px 264px no-repeat rgb(255, 255, 255); border-radius: 3px 3px 0px 0px;"></button><div style="float: left; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_zoom_control.png&quot;) repeat; padding: 7px 0px; transition: height 0s ease 0s, margin 0.1s ease 0s;"><div style="cursor: pointer; position: relative; background-size: 116px 264px; transition: height 0.1s ease 0s; margin: 2px 0px; display: block; width: 32px; height: 104px;"><div style="position: absolute; width: 4px; height: 100%; background-color: rgb(51, 150, 255); left: 50%; margin: 0px 0px 0px -2px;"><div style="width: 4px; height: 2px; margin-bottom: -2px; bottom: 0px; position: absolute; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -50px -127px / 116px 264px;"></div><div style="width: 4px; height: 2px; margin-top: -2px; top: 0px; position: absolute; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -100px / 116px 264px;"></div></div><div style="position: absolute; background-color: rgb(204, 204, 204); transition: height 0.1s ease 0s; left: 50%; margin: 0px 0px 0px -2px; width: 4px; height: 16px;"></div><div style="cursor: row-resize; position: absolute; width: 20px; height: 10px; margin: -4px 0px 0px -10px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -80px / 116px 264px; left: 50%; transition: top 0.1s ease 0s; top: 16px;"></div></div></div><button draggable="false" title="축소" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: 1px solid rgb(226, 226, 226); border-right: none; border-bottom: none; border-left: none; border-image: initial; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -32px / 116px 264px no-repeat rgb(255, 255, 255); border-radius: 0px 0px 3px 3px; margin: 0px;"></button><div style="display: none; position: absolute; margin: 41px 0px 0px -30px; background-size: 116px 264px; width: 30px; height: 104px;"><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -80px / 116px 264px; left: 0px; top: 8px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -100px / 116px 264px; left: 0px; top: 32px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -120px / 116px 264px; left: 0px; top: 64px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -140px / 116px 264px; left: 0px; top: 80px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -160px / 116px 264px; left: 0px; top: 96px;"></div></div></div></div></div>
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
  
  <div class="contentstyle1" id="content_2" style=";">
    
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
  
<div style="padding:10px 10px 15px 10px; background:#f5f5f5; margin-top:15px;">

		<div style="padding:10px 10px 0 10px; overflow:hidden;">
			<script>
  function reply_check() {
    obj_frm = document.reply_write_frm;
    if (obj_frm.content.value == " ") {
      alert("내용을 입력해주세요.");
      obj_frm.content.focus();
      return false;
    }
  }
</script>

<form name="reply_write_frm" method="post" action="reply_action.php" onsubmit="return reply_check()" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="as_can" value="">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="0">
  <input type="hidden" name="idx" value="0">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">
  <input type="hidden" name="keyword" value=""> <!-- 상품평 키워드 저장 custom hong -->
  <input type="hidden" name="product_name" value="라면">
  <input type="hidden" name="as_can" value="">

  <div style="float:left;">
    <textarea name="content" style="font-size:15px; color:#000; font-weight:300; width:520px; padding:5px 10px; height:80px; line-height:170%; border:1px solid #e6e6e6;" placeholder="리뷰를 작성해주세요" required=""></textarea>
  </div>
  <div style="float:right;">
    <button style="width:110px; height:92px; border:1px solid #e6e6e6; font-size:18px; font-weight:600; color:#555; background:#fff; margin-top:; text-align:center; cursor:pointer;" onclick="submitForm()">등록
    </button>
  </div>
</form>
<!-- 로그인개선 : NeoHero 2009.07.30 -->
<iframe name="h_blank" id="h_blank" src="" width="0" height="0" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="yes" style="visibility:hidden"></iframe>
</div>
</div>
  
  
  <div class="review_start" style=";">
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
  <div class="contentstyle1" id="content_3">
  <div class="main_tab_title">티켓 관련 문의사항을 남겨주세요.</div>

	<div style="font-size:15px; color:#777; margin-top:15px;">
		※ 환불/취소요청은 <a href="myticket.php?mode=buy"><span style="font-weight:400; text-decoration:underline; color:#000;">마이티켓 &gt; 환불신청</span></a>, 이용 불편 및 요청사항은 <a href="bbs_list.php?tb=board_private"><span style="font-weight:400; text-decoration:underline; color:#000;">1:1문의</span></a>를 이용해주세요.
	</div>

	<div style="padding:10px 10px 15px 10px; background:#f5f5f5; margin-top:15px;">

		<div style="padding:10px 10px 0 10px; overflow:hidden;">
<script>
  function reply_check() {
    obj_frm = document.reply_write_frm;
    if (obj_frm.content.value == " ") {
      alert("내용을 입력해주세요.");
      obj_frm.content.focus();
      return false;
    }
  }
</script>

<form name="reply_write_frm" method="post" action="reply_action.php" onsubmit="return reply_check()" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="as_can" value="">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="0">
  <input type="hidden" name="idx" value="0">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">
  <input type="hidden" name="keyword" value=""> <!-- 상품평 키워드 저장 custom hong -->
  <input type="hidden" name="product_name" value="라면">
  <input type="hidden" name="as_can" value="">

  <div style="float:left;">
    <textarea name="content" style="font-size:15px; color:#000; font-weight:300; width:520px; padding:5px 10px; height:80px; line-height:170%; border:1px solid #e6e6e6;" placeholder="· Q&amp;A를 통한 일정변경/환불 문의는 처리되지 않습니다.
· 날짜/시간 변경은 불가하며 환불 후 다시 예매해야 합니다.
· 티켓 환불은 마이티켓>예매내역에서 신청 가능합니다." required=""></textarea>
  </div>
  <div style="float:right;">
    <button style="width:110px; height:92px; border:1px solid #e6e6e6; font-size:18px; font-weight:600; color:#555; background:#fff; margin-top:; text-align:center; cursor:pointer;" onclick="submitForm()">등록
    </button>
  </div>
</form>

<!-- 로그인개선 : NeoHero 2009.07.30 -->
<iframe name="h_blank" id="h_blank" src="" width="0" height="0" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="yes" style="visibility:hidden"></iframe>


		</div>

	</div>

	<div>
		<span id="replyViewLabel" name="replyView"><script type="text/javascript">
<!--
	//reply_action.php?idx=$Reply[number]&number=$_GET[number]&id=$_GET[id]&action=$_GET[action]&mode=del
	//reply_action.php?idx=$현재번호&number=$DETAIL[number]&id=$_GET[id]&action=$_GET[action]&mode=del
	function reply_del(idx,number,id,action,mode)
	{
		if(confirm("정말 삭제 하시겠습니까?"))
		{
			location.href="reply_action.php?idx="+idx+"&number="+number+"&id="+id+"&action="+action+"&mode="+mode;
		}
	}
//-->
</script>

<div style="width:100%; padding-top:15px;">
	<form name="reply_frm_1" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5696">
  <input type="hidden" name="idx" value="5696">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_kakao.gif" style="padding-right:3px;" align="absmiddle"> kakao_2908656890</span>&nbsp;&nbsp;(2023-07-13 15:22:23)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_2', '', '', '', '', '2', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">8월에도 공연이 있나요?</td>
  </tr>

  <tr id="habuReply_2">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
  <tbody><tr>
    <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
      <img src="https://timeticket.co.kr/img/reply_icon.png">
    </td>

    <td style="font-size:12px; color:#555; padding-top:5px" align="left"><span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(2023-07-13 16:38:25)&nbsp;&nbsp;
    </td>
  </tr>

  <tr>
    <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">연극 '라면'은 8월에도 진행됩니다. 날짜 선택하실 때 달력을 8월로 지정하시면 예매가 가능한 날짜를 확인하실 수 있습니다. :)</td>
  </tr>

</tbody></table>
</td>
  </tr>


  <tr id="writeDiv_2" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_3" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5520">
  <input type="hidden" name="idx" value="5520">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_kakao.gif" style="padding-right:3px;" align="absmiddle"> kakao_1890701747</span>&nbsp;&nbsp;(2023-05-13 10:29:07)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_4', '', '', '', '', '4', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">안녕하세요? 전상희라고 하는데 오늘 공연을 아침 8시경에 예배를 했는데 처음엔 예매확잉이 보였는데 갑자기 예매권이 보이질 않아요~ 결제내역도 있고 잘 예매가 된것같은데.. 확인 부탁드려요</td>
  </tr>

  <tr id="habuReply_4">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
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
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_5" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5498">
  <input type="hidden" name="idx" value="5498">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_naver.gif" style="padding-right:3px;" align="absmiddle"> naver_39316695</span>&nbsp;&nbsp;(2023-05-01 07:04:52)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_6', '', '', '', '', '6', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">만 11세 미만 (초4 13년생)은 보호자동반시 괸람가능할까요?</td>
  </tr>

  <tr id="habuReply_6">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
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
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_5" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5177">
  <input type="hidden" name="idx" value="5177">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">dalcomiss</span>&nbsp;&nbsp;(2022-10-30 21:16:34)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_7', '', '', '', '', '7', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">내 인생 최악의 연극. 연극 티켓 바꿔주는 직원인가? 대놓고 싸움을 걸고, 20분까지 입장이라 20분에 입장했는데 연극 극장안에 들여보내주지않아 4만원 가까이 돈을 날림. 여기 연극 직원들 태도의 문제 덕분에 앞으로 대학로에서 연극 볼 생각이 싹 살아짐~^^ 덕분에 최악의 연극을 거를 수 있는 계기가 되었고, 대학로 연극의 끝을 봄 일주일의 끝을 연극으로 마무리하려던 내 계획이 틀어져서 연극 볼 수 없었음 20분까지 입장이면 왜 20분에 들어가면 안되나요~?? ^^ 20분에 들어간 사람도 있던데~ 차별하는건지요? 법적 법적 하시던데 협박도 하신건가요?</td>
  </tr>

  <tr id="habuReply_7">
    <td></td>
  </tr>


  <tr id="writeDiv_7" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_8" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5175">
  <input type="hidden" name="idx" value="5175">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">dalcomiss</span>&nbsp;&nbsp;(2022-10-30 21:10:26)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_9', '', '', '', '', '9', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">그리고 왜 제 후기가 가려졌나요? 1점짜리 후기는 가리는 건가요?</td>
  </tr>

  <tr id="habuReply_9">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
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
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_8" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5174">
  <input type="hidden" name="idx" value="5174">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">dalcomiss</span>&nbsp;&nbsp;(2022-10-30 21:09:45)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_10', '', '', '', '', '10', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">왜 20분까지 입장이면 20분에 들어갔을때 못들어가게 하셨나요? 직원분 3명이서 계속 기달리라는 말만하고 결국 돈 날렸습니다.</td>
  </tr>

  <tr id="habuReply_10">
    <td></td>
  </tr>


  <tr id="writeDiv_10" style="display:none;">
    <td style="padding:0px 10px 15px 10px;">
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_11" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5064">
  <input type="hidden" name="idx" value="5064">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_naver.gif" style="padding-right:3px;" align="absmiddle"> naver_44505770</span>&nbsp;&nbsp;(2022-08-31 19:37:59)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_12', '', '', '', '', '12', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">소비자가 좌석 지정은 못하나요?</td>
  </tr>

  <tr id="habuReply_12">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
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
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_13" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5033">
  <input type="hidden" name="idx" value="5033">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">ffkee3</span>&nbsp;&nbsp;(2022-08-11 00:09:26)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_14', '', '', '', '', '14', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">안녕하세요 학생인데 학생증을 잃어버려서 그런대 학생증 필수 지참이라는데 티켓도 이미 사서 환불이 안되는데 어떻게 하나요..</td>
  </tr>

  <tr id="habuReply_14">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
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
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_15" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5029">
  <input type="hidden" name="idx" value="5029">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;"><img src="https://timeticket.co.kr/img/sns_icon/icon_conn_naver.gif" style="padding-right:3px;" align="absmiddle"> naver_164704362</span>&nbsp;&nbsp;(2022-08-10 16:24:08)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_16', '', '', '', '', '16', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">10월달에도 공연하나요?<br>
단체 관람 예약하려 합니다</td>
  </tr>

  <tr id="habuReply_16">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
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
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
      </tr>
      </tbody></table>
    </td>
  </tr>

  </tbody></table>
</form>

<form name="reply_frm_17" method="post" action="reply_action.php" target="h_blank" style="margin:0;">
  <input type="hidden" name="number" value="4343">
  <input type="hidden" name="page" value="">
  <input type="hidden" name="userid" value="">
  <input type="hidden" name="parent" value="5024">
  <input type="hidden" name="idx" value="5024">
  <input type="hidden" name="mode" value="">
  <input type="hidden" name="display" value="Y">

  <!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->

  <table cellpadding="0" cellspacing="0" style="width:100%; border:1px solid #e6e6e6; margin-top:15px; padding-top:10px; background:#fff;">

  <tbody><tr>
    <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;"><span style="font-size:15px; color:#555; font-weight:400;">bmwwwww5</span>&nbsp;&nbsp;(2022-08-09 20:18:22)&nbsp;&nbsp;&nbsp;<a href="#reply" onclick="GoWrite( 'writeDiv_18', '', '', '', '', '18', '등록합니다' )"><img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기" align="absmiddle"></a></td>
  </tr>

  <tr>
    <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">비가 많이 와서요<br>
10일공연 정상 진행 하나요????</td>
  </tr>

  <tr id="habuReply_18">
    <td><!-- 상단여백 / 아이디 / 댓글 / 하단여백 간격은 15 : 10 : 15px-->
<table cellspacing="0" style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
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
      <table cellspacing="0" style="width:100%;">
      <tbody><tr>
        <td>
          <table cellspacing="0" style="width:100%;">
          <tbody><tr>
            <td><textarea name="content" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;" required=""></textarea></td>
          </tr>
          </tbody></table>
        </td>
        <td style="width:74px; padding-left:5px;"><input type="image" name="sendit" value="등록" src="mobile_img/btn_detail_answer.jpg" style="-webkit-border-radius:0; -webkit-appearance:none; width:74px; height:44px;"></td>
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

<!-- </div> -->


<!-- ajax paging -->
<script language="javascript">
$('body').on('click', '.goPage', function() {
    var param = $(this).attr('val');
    var b = '/reply_view_ajax.php?' + param;
    $.ajax({
        type: "GET",
        url: b,
        success: function(html) {
            if ($('#replyViewLabel').length) {
                $('#replyViewLabel').empty();
            }
            $(html).fadeIn(html).appendTo('#replyViewLabel');
        },
        error: function() {},
        complete: function() {}
    });
});
</script>
<!-- ajax paging 끝! -->

</div>

<!-- <div id="ajaxcontentarea" class="contentstyle1" style="border-radius:0 0 10px 10px"> -->
<div class="contentstyle1" id="content_4">
	<div class="main_tab_title">장소안내</div>

  <div class="viewpage_text radius_box" style="margin-top:10px; border-radius: 10px 10px 0 0;">
    <p>· 장소: 해피씨어터</p>
    <p>· 주소: 서울 종로구 대학로10길 5 , 지하1층</p>
    <p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
  </div>
  <div align="center" style="margin-top:10px;">
    <div style="z-index:-1;" id="daum_map">
      <div id="map" style="height: 350px; border-radius: 0px 0px 10px 10px; position: relative; overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);"><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute;"><div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="https://map1.daumcdn.net/map_2d/2306uwn/L3/2005/897.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -245px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map2.daumcdn.net/map_2d/2306uwn/L3/2005/898.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 11px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map3.daumcdn.net/map_2d/2306uwn/L3/2005/899.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 267px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map0.daumcdn.net/map_2d/2306uwn/L3/2005/900.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 523px; top: 232px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map1.daumcdn.net/map_2d/2306uwn/L3/2006/897.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -245px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map2.daumcdn.net/map_2d/2306uwn/L3/2006/898.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 11px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map3.daumcdn.net/map_2d/2306uwn/L3/2006/899.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 267px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map0.daumcdn.net/map_2d/2306uwn/L3/2006/900.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 523px; top: -24px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map1.daumcdn.net/map_2d/2306uwn/L3/2007/897.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -245px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map2.daumcdn.net/map_2d/2306uwn/L3/2007/898.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 11px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map3.daumcdn.net/map_2d/2306uwn/L3/2007/899.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 267px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="https://map0.daumcdn.net/map_2d/2306uwn/L3/2007/900.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 523px; top: -280px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="width: 700px; height: 350px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; width: 3500px; height: 1750px; left: -1400px; top: -700px;" viewBox="0 0 3500 1750"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);"><div style="position: absolute; margin: -39px 0px 0px -14px; z-index: 0; left: 350px; top: 175px;"><img draggable="false" src="https://t1.daumcdn.net/mapjsapi/images/marker.png" alt="" role="presentation" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 29px, 42px, 0px); top: 0px; left: 0px; width: 29px; height: 42px;"><img src="https://t1.daumcdn.net/mapjsapi/images/transparent.gif" alt="" role="presentation" draggable="false" usemap="#daum.maps.Marker.Area:c" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 29px; height: 42px;"><map id="daum.maps.Marker.Area:c" name="daum.maps.Marker.Area:c"><area href="javascript:void(0)" alt="" role="presentation" shape="poly" coords="14,39,9,27,4,21,1,16,1,10,4,4,11,0,18,0,25,4,28,10,28,16,25,21,20,27" title="" style="-webkit-tap-highlight-color: transparent;"></map></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);"><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;"><div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 46px;"></div><div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">50m</div></div><div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;"><img src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png" alt="Kakao 지도로 이동" style="float: left; width: 32px; height: 10px; border: none;"></a><div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"><div style="width: 32px; border-radius: 3px; box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px; position: absolute; left: 665px; top: 3px;"><button draggable="false" title="확대" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: none; border-right: none; border-bottom: 1px solid rgb(226, 226, 226); border-left: none; border-image: initial; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px 0px / 116px 264px no-repeat rgb(255, 255, 255); border-radius: 3px 3px 0px 0px;"></button><div style="float: left; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_zoom_control.png&quot;) repeat; padding: 7px 0px; transition: height 0s ease 0s, margin 0.1s ease 0s;"><div style="cursor: pointer; position: relative; background-size: 116px 264px; transition: height 0.1s ease 0s; margin: 2px 0px; display: block; width: 32px; height: 104px;"><div style="position: absolute; width: 4px; height: 100%; background-color: rgb(51, 150, 255); left: 50%; margin: 0px 0px 0px -2px;"><div style="width: 4px; height: 2px; margin-bottom: -2px; bottom: 0px; position: absolute; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -50px -127px / 116px 264px;"></div><div style="width: 4px; height: 2px; margin-top: -2px; top: 0px; position: absolute; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -100px / 116px 264px;"></div></div><div style="position: absolute; background-color: rgb(204, 204, 204); transition: height 0.1s ease 0s; left: 50%; margin: 0px 0px 0px -2px; width: 4px; height: 16px;"></div><div style="cursor: row-resize; position: absolute; width: 20px; height: 10px; margin: -4px 0px 0px -10px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -80px / 116px 264px; left: 50%; transition: top 0.1s ease 0s; top: 16px;"></div></div></div><button draggable="false" title="축소" type="button" style="float: left; cursor: pointer; width: 32px; height: 32px; user-select: none; -webkit-user-drag: none; border-top: 1px solid rgb(226, 226, 226); border-right: none; border-bottom: none; border-left: none; border-image: initial; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) -40px -32px / 116px 264px no-repeat rgb(255, 255, 255); border-radius: 0px 0px 3px 3px; margin: 0px;"></button><div style="display: none; position: absolute; margin: 41px 0px 0px -30px; background-size: 116px 264px; width: 30px; height: 104px;"><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -80px / 116px 264px; left: 0px; top: 8px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -100px / 116px 264px; left: 0px; top: 32px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -120px / 116px 264px; left: 0px; top: 64px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -140px / 116px 264px; left: 0px; top: 80px;"></div><div style="position: absolute; width: 29px; height: 15px; margin: -6px 0px 0px; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/control.png&quot;) 0px -160px / 116px 264px; left: 0px; top: 96px;"></div></div></div></div></div>
    </div>
  </div>
<script>
  let addrCoord = [37.581892989494186, 127.00256994369825];
    if (addrCoord.length > 0) {
      var mapContainer = document.getElementById('map'),
        mapOption = {
          center: new kakao.maps.LatLng(addrCoord[0], addrCoord[1]),
          level: 3
        };
      var map = new kakao.maps.Map(mapContainer, mapOption);
      var position = new kakao.maps.LatLng(addrCoord[0], addrCoord[1]);
      var marker = new kakao.maps.Marker({
        position: position,
        clickable: true
      });
      marker.setMap(map);
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    } else {
      var mapContainer = document.getElementById('map'), mapOption = {
        center: new kakao.maps.LatLng(0, 0),
        level: 3
      };

      var map = new kakao.maps.Map(mapContainer, mapOption);
      var ps = new kakao.maps.services.Places();
      ps.keywordSearch('서울 종로구 대학로10길 5', placesSearchCB);
      function placesSearchCB (data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
          var bounds = new kakao.maps.LatLngBounds();
          // 검색결과를 한개만 노출하기 위해 반복문 삭제하고 배열의 첫번째값만 사용
          displayMarker(data[0]);
          bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
          map.setBounds(bounds);
        }
      }

      function displayMarker(place) {
        var marker = new kakao.maps.Marker({
          map: map,
          position: new kakao.maps.LatLng(place.y, place.x)
        });
        kakao.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
          infowindow.open(map, marker);
        });
      }
    }
</script>
</div>

<div class="contentstyle1" id="content_5">
<style>
	.viewpage_text { line-height:160%; font-size:15px;	}
	.viewpage_text .viewpage_noti { padding:15px 0 0 0; font-weight:700; font-size:16px; }
</style>

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
<!-- </div> -->
</section>
  
<script>

document.getElementById('content_1').style.display = 'block';
document.getElementById('content_2').style.display = 'none';
document.getElementById('content_3').style.display = 'none';
document.getElementById('content_4').style.display = 'none';
document.getElementById('content_5').style.display = 'none';
document.getElementById('main_img').style.display = 'none';
function loadTab(divId, element) {
  var contentDivs = document.getElementsByClassName('contentstyle1')
  var tabListItems = document.getElementsByTagName('li');
  // 모든 <div> 요소를 숨김
  for (var i = 0; i < contentDivs.length; i++) {
    contentDivs[i].style.display = 'none';
  }
  
//모든 탭에 있는 "selected" 클래스를 제거
  for (var i = 0; i < tabListItems.length; i++) {
    tabListItems[i].classList.remove('selected');
  }

  // 선택한 탭에 "selected" 클래스를 추가
  element.parentNode.classList.add('selected');

  
  // 선택한 <div> 요소를 표시
  var selectedContentDiv = document.getElementById(divId);
  selectedContentDiv.style.display = 'block';
}

//더보기 버튼 처리
function showFullReviewForSample(selected) {
  document.getElementById('sample_review_' + selected).classList.add('show');
  document.getElementById('sample_seemore_' + selected).setAttribute("style", "display: none;");
}

const reviewSeeMoreBtn = document.querySelector('.review_preview_right');
const tabLink = document.querySelector('li[class=""] a');
reviewSeeMoreBtn.addEventListener('click', function () {
	  loadTab('content_2', tabLink);
	  const tabElement = document.getElementById('tab_02_review');
	  tabElement.scrollIntoView({ behavior: 'smooth' });
});

// 더보기 버튼 처리
function showFullReview(selected) {
  document.getElementById('text_' + selected).classList.add('show');
  document.getElementById('seemore_' + selected).setAttribute("style", "display: none;");
}

function showMoreDetailImage() {
  document.querySelector('.info_detail_btn').remove();
  document.querySelector('.info_detail_gradient').remove();
  document.querySelector('.info_detail_poster').setAttribute("style", `display:none;`);
  document.getElementById('main_img').style.display = 'block';
  document.querySelector('.main_img').scrollIntoView({ behavior: 'smooth', block: 'start' });
}

function getMeta(url) {
    const img = new Image();
    img.addEventListener("load", function() {
      sessionStorage.setItem('width', this.naturalWidth);
      sessionStorage.setItem('height', this.naturalHeight);
    });
    img.src = url;
}

//이미지 로드
function showOriginalRatio(selected) {
  let selectedImg = document.getElementsByClassName(selected);
  let viewMode = selectedImg[0].getAttribute('viewmode');
  let img_url = selectedImg[0].getAttribute('name');
  
    if (viewMode === 'off') {
      getMeta(img_url);
      setTimeout(() => {
        selectedImg[0].setAttribute('style', 'background-image: url('+ img_url +'); width: ' + sessionStorage.getItem('width') + 'px; height: '+ sessionStorage.getItem('height') + 'px;');
        selectedImg[0].setAttribute('viewMode', 'on');
        sessionStorage.clear();
      }, 50);
    } else if (viewMode === 'on') {
      setTimeout(() => {
        selectedImg[0].setAttribute('style', 'background-image: url('+ img_url +')');
        selectedImg[0].setAttribute('viewMode', 'off');
      }, 50);
    }
  }

//댓글 등록 버튼을 눌렀을 때 호출될 함수
function submitForm() {
  if (reply_check()) {
    // 여기서 댓글 등록 처리를 진행 (Ajax 사용 권장)

    // 예시: 댓글을 등록하고, 새로운 댓글을 다른 div에 추가하는 코드
    var newComment = document.reply_write_frm.content.value; // 새로운 댓글 내용
    var commentDiv = document.createElement('div');
    commentDiv.textContent = newComment;

    // 다른 div에 새로운 댓글 추가
    var otherDiv = document.getElementById('otherDiv'); // 다른 div의 id를 적절히 수정
    otherDiv.appendChild(commentDiv);
  }
}

function fetchDataFromServer() {
	  fetch('http://localhost:8090') // 서버의 URL을 적절히 수정해야 합니다.
	    .then(response => response.json()) // 서버로부터 응답을 JSON 형태로 파싱합니다.
	    .then(data => {
	      // 데이터를 사용하여 UI를 업데이트하거나 처리합니다.
	      console.log(data); // 예시로 콘솔에 데이터 출력
	    })
	    .catch(error => {
	      // 오류 처리
	      console.error('Error:', error);
	    });
}

function sendDataToServer(data) {
	  fetch('http://localhost:8090', {
	    method: 'POST', // 데이터를 전송하는 HTTP 메서드를 지정합니다.
	    headers: {
	      'Content-Type': 'application/json' // 전송하는 데이터의 타입을 지정합니다. JSON 형식 사용 시 application/json 지정
	    },
	    body: JSON.stringify(data) // 전송할 데이터를 JSON 문자열로 변환하여 body에 추가합니다.
	  })
	  .then(response => response.json())
	  .then(data => {
	    // 서버의 응답 데이터를 사용하여 UI를 업데이트하거나 처리합니다.
	    console.log(data);
	  })
	  .catch(error => {
	    // 오류 처리
	    console.error('Error:', error);
	  });
}

</script>
</body>
</html>