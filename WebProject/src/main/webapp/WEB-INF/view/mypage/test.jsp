<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="background-color: #f6f6f6; padding-top:10px; padding-bottom:50px;">
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
    /* background-image: url('./wys2/file_attach_thumb/2023/07/13/1689207783-33-0_wonbon_N_7_600x600_70_2.jpg'); */
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

<div style="padding-top:20px; width:815px; margin:0 auto;">
  <div class="now_engine">
    🗂️ <a href="https://timeticket.co.kr/list.php?category=2096">공연 &gt; </a><a href="https://timeticket.co.kr/list.php?category=2096r01">연극 &gt; </a><a href="https://timeticket.co.kr/list.php?category=2096r01r01">코믹 &gt; </a>
  </div>
  <div style="float:left; position:relative; width:482px; margin-right:20px; border-radius:10px;">
    <!-- <img src="./wys2/file_attach_thumb/2023/07/13/1689207783-33-0_wonbon_N_7_600x600_70_2.jpg" style="width:482px; height: 482px; border-radius:10px;" onerror="this.style.visibility='hidden'"> -->
    <div class="info_bg_gradient">
    </div>

    <!-- 타임세일/오늘티켓 아이콘 노출-->
    <div style="position: absolute; top: 15px; left: 15px; display: flex;">
      <span class="promo_new">NEW</span>
    </div>


    <!-- 타임세일/오늘할인 배너 -->
    <div style="display:none;">

      <!-- 타임세일 안내 영역 -->
      <div class="promo_box" style="background: #FFE9E9; border:1px solid #fde3e3; display:none;;">
        <div style="font-weight: 700; color: #FF4B4B;">타임세일 진행중 ⏰
          <span style="font-size:14px; color:#555; font-weight:400;">회차당 2~3매 선착순 최저가</span>
        </div>
        <div class="promo_datetime" style="padding:5px 15px; background: #ff4b4b;"></div>
        <div class="promo_btn_circle">
          <a href="section.php?&amp;page=promo&amp;type=timesale">
            
          </a>
        </div>
      </div>

      <!-- 오늘할인 안내 영역 -->
      <div class="promo_box" style="background: #EDFFE5; border:1px solid #d8f5cc; display:none;">
        <div style="font-weight: 700; color: #459E26;">오늘할인 적용중 🎉
          <span style="font-size:14px; color:#555; font-weight:400;">오늘은 마감되었어요. 내일을 기다려주세요!</span>
        </div>
        <div class="promo_datetime" style="padding:5px 0 5px 15px; width:105px; background: #459E26;" id="today_timer">00 : 00 : 00</div>
        <div class="promo_btn_circle">
          <a href="section.php?&amp;page=promo&amp;type=today">
            
          </a>
        </div>
      </div>
    </div>

    <!-- 좌측 포스터 이미지 -->
    <div style="position:absolute; top:180px; left:25px;">
      <!-- <img src="wys2/file_attach_thumb/2023/07/13/1689207783-90-3_wonbon_N_7_255x357_70_2.jpg" style="border-radius:8px; width:140px;" alt="행오버(대구)";"> -->
    	<img src="${post}" style="border-radius:8px; width:140px;"/>
    </div>

    <!-- 포스터 옆 정보영역 -->
    <div style="position:absolute; top:181px; left:183px;">
      <div class="info-warp">
        <div class="icon">
          <span>${place}</span>
          <span>${category}</span>
        </div>
        <p style="padding-top:10px; font-size:14px; font-weight:300; color:#fff; ">반전을 거듭하는 코믹추리스릴러극!</p>

        <p class="title" style="padding-top:5px;">${name}</p>
        <div class="openrun">
          <p class="run_tit">${stdate}~${endate}</p>
          <p class="run_info">
            <span>약 100분</span>
            <span>만 16세 이상</span>
          </p>
          <p class="run_tit">송죽씨어터</p>
        </div>
      </div>
    </div>

    <div style="position:absolute; top:400px; left:20px;">
      <div class="price_warp">
        <div class="sale_info">
          <p class="sale_p">최대 58% 할인</p>
          <p class="sale_txt">평일 선착순할인 기준</p>
        </div>
        <div class="price_info">
          <span class="origin_price">40,000원</span>
          <span class="sale_price">16,900원</span>
        </div>
      </div>
    </div>
  </div>

  <!-------- 우측 옵션선택영역 시작 -------->
  <section style="float: right; width: 307px;">
    <div id="calendar_popup" class="calendar_popup_02" style="; ;">
      <div class="popup_warp">
        <div id="datepicker" style="background:#fff; border-radius:10px; min-height:230px;" class="hasDatepicker">
        <div class="ui-datepicker-inline ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="display: block;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
        <a class="ui-datepicker-prev ui-corner-all" data-handler="prev" data-event="click" title="Prev"><span class="ui-icon ui-icon-circle-triangle-w">Prev</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="Next"><span class="ui-icon ui-icon-circle-triangle-e">Next</span></a>
        <div class="ui-datepicker-title">
        <span class="ui-datepicker-year">2023</span>
        년&nbsp;<span class="ui-datepicker-month">08</span></div></div>
        <table class="ui-datepicker-calendar">
        <thead>
        <tr>
        <th scope="col" class="ui-datepicker-week-end">
        <span title="일">일</span></th>
        <th scope="col"><span title="월">월</span></th>
        <th scope="col"><span title="화">화</span></th>
        <th scope="col"><span title="수">수</span></th>
        <th scope="col"><span title="목">목</span></th>
        <th scope="col"><span title="금">금</span></th>
        <th scope="col" class="ui-datepicker-week-end">
        <span title="토">토</span></th></tr></thead><tbody><tr>
        <td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
        <td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">1</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">2</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">3</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">4</span></td>
        <td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">5</span></td></tr><tr>
        <td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">6</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">7</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">8</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">9</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">10</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">11</span></td>
        <td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">12</span></td></tr><tr>
        <td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">13</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">14</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">15</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">16</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">17</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">18</span></td>
        <td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined">
        <span class="ui-state-default">19</span></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">20</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">21</span></td><td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">22</span></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">23</span></td><td class=" undefined ui-datepicker-current-day" data-handler="selectDay" data-event="click" data-month="7" data-year="2023"><a class="ui-state-default ui-state-active" href="#" aria-current="true" data-date="24">24</a></td>
        <td class=" undefined" data-handler="selectDay" data-event="click" data-month="7" data-year="2023"><a class="ui-state-default" href="#" aria-current="false" data-date="25">25</a></td><td class=" ui-datepicker-week-end undefined" data-handler="selectDay" data-event="click" data-month="7" data-year="2023"><a class="ui-state-default" href="#" aria-current="false" data-date="26">26</a></td></tr>
        <tr>
        <td class=" ui-datepicker-week-end undefined" data-handler="selectDay" data-event="click" data-month="7" data-year="2023"><a class="ui-state-default" href="#" aria-current="false" data-date="27">27</a></td>
        <td class=" ui-datepicker-unselectable ui-state-disabled undefined"><span class="ui-state-default">28</span></td><td class=" undefined" data-handler="selectDay" data-event="click" data-month="7" data-year="2023"><a class="ui-state-default" href="#" aria-current="false" data-date="29">29</a></td>
        <td class=" undefined" data-handler="selectDay" data-event="click" data-month="7" data-year="2023"><a class="ui-state-default" href="#" aria-current="false" data-date="30">30</a></td><td class=" undefined" data-handler="selectDay" data-event="click" data-month="7" data-year="2023"><a class="ui-state-default" href="#" aria-current="false" data-date="31">31</a></td>
        <td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
        <td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div></div>
        <input type="hidden" name="is_calendar" id="is_calendar" value="y">
        <form method="post" id="regiform" name="regiform" action="https://timeticket.co.kr/basket_order.php?number=5190&amp;returnUrl=https%3A%2F%2Ftimeticket.co.kr%2Fbasket_order.php">
          <div class="time_select selectBox">
            <p class="selectbox_title">시간선택</p>
          </div>
          <div class="title1_select selectBox">
            <p class="selectbox_title">옵션선택</p>
          </div>
          <div class="title2_select selectBox">
            <p class="selectbox_title">권종선택</p>
          </div>
          <div class="choice_select">
            <p class="title">수량선택</p>
            <div class="select_list"></div>
          </div>
          <div class="total_warp">
            <p class="title">총 결제금액</p>
            <p class="total_price"></p>
          </div>
          <div class="submit_btn">
            <button href="#" class="disabled">결제하기</button>
          </div>
        </form>
      </div>
    </div>

    <!----- 가격노출영역 // 무료일때 ----->
    <div class="price_section_etc" style="color:#00a5be; display: none;;;">
      ※ 무료 관람이 가능한 티켓입니다.<br>
      (별도의 구매없이 일정 확인 후 방문해주세요)
    </div>

    <!----- 가격노출영역 // 판매대기일때 ----->
    <div class="price_section_etc" style="color:#ff0000; display: none;;">
      ※ 등록 대기중인 티켓입니다.<br>
      (일정 추가와 함께 곧 오픈됩니다)
    </div>

    <!----- 가격노출영역 // 오픈예정일때 ----->
    <div class="price_section_etc" style="color:#ff4b4b; display: none;;">
      <p style="font-size:15px; font-weight:bold; ">
        &lt; 오픈일시 : 2023-07-13 00:00:00 &gt;
      </p>
      <p style="font-size:14px; margin-top:10px; color:#777">
        ※ 상단 오픈일시 이후로 예매 가능합니다.<br>
        ※ 관람정보가 변경될 수 있으니 유의하세요!
      </p>
    </div>
  </section>

  <div style="clear:both;"></div>

  <section style="width:820px; margin:0 auto; padding-top:20px;">
    <div class="review_preview" style="display: none;;">
      <div class="review_preview_container">
        <div class="review_preview_title_section">
          <div class="review_preview_left">
            <span class="review_preview_title">이용후기</span>
            <span class="review_preview_number">0</span>
            <span class="review_preview_title">평점</span>
            <span class="review_preview_number" style="color: #ff4b4b;">-/5</span>
          </div>
          <div class="review_preview_right">
            후기 더보기
            <span class="review_preview_right_btn"></span>
          </div>
        </div>
        <div class="review_preview_samples">
                  </div>
      </div>
    </div>
  </section>


  <section style="width:820px; margin:0 auto; padding-top:20px;">

    <!-- 메뉴영역, js/ajaxtabs.css -->
    <ul id="maintab" class="shadetabs FixedTopMenu" style="border-radius:10px 10px 0 0;">
      <li id="tab_01_notice" class="selected" onclick="loadKakaoMap();"><a class="tabLink" href="#default" rel="ajaxcontentarea">
      <span>안내</span></a></li>
      <li class=""><a onclick="loadTab(1, this)"><span>후기<span style="letter-spacing:-1px;">(0)</span></span></a></li>
      <li class=""><a onclick="loadTab(2, this)"><span>Q&amp;A<span style="letter-spacing:-1px;">(0)</span></span></a></li>
      <li class=""><a onclick="loadTab(3, this)"><span>장소</span></a></li>
      <li class=""><a onclick="loadTab(4, this)"><span>환불규정</span></a></li>
    </ul>

    <!---------------------- 탭 영역 시작 ----------------------->
    <div id="ajaxcontentarea" class="contentstyle1" style="border-radius:0 0 10px 10px">
      <div class="main_tab_wrap">

        <!-- 클래스 안내 배너 -->
        <div style="display:none;; width:700px; height:95px; margin-bottom:20px;">
          <img src="img/bnr_class_noti.png" style="width:700px; border-radius:10px;" alt="예매전 주의사항 - 클래스">
        </div>

        <div style="margin-top:10px;">
          <div class="viewpage_noti">예매정보</div>
          <div class="viewpage_text radius_box">
            <p>· 진행기간: 2023.8.24~2023.10.9</p>
            <p>· 이용등급: 만 16세 이상</p>
            <p>· 이용시간: 약 100분</p>
          </div>
        </div>

        <div style="margin-top:25px; ">
          <div class="viewpage_noti">기획사 공지사항</div>
          <div class="viewpage_text radius_box"><p>※ 예매자는 상세안내 페이지의 모든 내용을 숙지 및 동의한 것으로 간주합니다.</p>
<p>※ 관람 연령 / 티켓수령 / 공연 관람 안내 미숙지로 인한 책임은 관람자 본인에게 있습니다.</p>
<p>· 이로 인한 예매 티켓의 취소, 환불, 변경은 불가하오니 각별히 유의하시기 바랍니다.</p>
<br>
<p>본 공연은 16세 이상관람이 가능합니다. (중학교 3학년부터관람가능)</p>
<p>▶ 관람등급 확인을 위한 학생증 필수 지참</p>
<p>▶ 관람등급 미만일 경우, 부모의 동행하에도 관람이 불가합니다.</p>
<p>▶ 이로 인하여 취소 및 환불은 불가합니다.</p>
<p>관람 당일 취소 , 환불 , 변경은 불가능합니다.</p></div>
        </div>

        <div style="margin-top:25px;">
          <div class="viewpage_noti">이용정보</div>
          <div class="viewpage_text radius_box"><p>· 예매가능시간: 공연 시작 30분 전까지</p>
<p>· 티켓배부: 공연 시작 1시간 전부터 공연장 매표소에서 배부</p>
<p>· 티켓수령: 예매내역 제시 후 현장 수령(신분증/증빙자료 지참)</p>
<p>· 입장시간: 공연 시작 10~20분 전부터 입장 가능</p>
<p>· 좌석배정: 비지정석(예매 순서대로 기획사에서 좌석 배정)</p></div>
        </div>


        <!-- 상세이미지 -->
        <div class="info_detail_poster" alt="상세" style="display:none;">
          
          
          <script>
            function showMoreDetailImage() {
              document.querySelector('.info_detail_btn').remove();
              document.querySelector('.info_detail_gradient').remove();
              document.querySelector('.info_detail_poster').setAttribute("style", `display:none;`);
              let xhr = new XMLHttpRequest();
              xhr.open('GET', `./index.php?number=5190&mode=extend_detail_info`, true);
              xhr.send();
              xhr.onload = () => {
                  if (xhr.status === 200) {
                    document.querySelector('.main_img').innerHTML = xhr.response;
                    document.querySelector('.main_img').scrollIntoView({ behavior: 'smooth', block: 'start' });
                  }
                }
              }
          </script>
        </div>
        <div class="main_img">
        <img src="${guidepost}">
        <!--
		<img src="//aidankims.cdn2.cafe24.com/ticket/5100/5190/5190_noti_2.jpg">
		<img src="//aidankims.cdn2.cafe24.com/ticket/5100/5190/5190_00.jpg"> -->
		</div>


        <div style="margin-top:25px;">
          <div class="viewpage_noti">유의사항</div>
          <div class="viewpage_text radius_box">
          	<p>· 공연 시작 후 발권 또는 입장 불가(지연입장 불가)</p>
			<p>· 지각으로 인해 관람하지 못할 시 환불/변경 불가</p>
			<p>· 지역착오, 연령 미숙지로 관람하지 못할 시 환불/변경 불가</p>
			<p>· 음식물 반입 금지. 공연 중 사진/동영상 촬영 금지</p>
			<p class="txt_red">· 관람 당일은 결제 후 환불/변경 불가하니 신중히 예매하세요.</p></div>
        </div>

        <!--------- 장소안내 --------->
        <div style="margin-top:25px;">
          <div class="viewpage_noti">장소안내</div>
          <div class="viewpage_text radius_box" style="border-radius: 10px 10px 0 0;">
            <p>· 장소: 송죽씨어터&nbsp;/&nbsp;총 250석</p>
            <p>· 주소: 대구광역시 중구 교동길 15 , 송죽빌딩 2층</p>
            <p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
          </div>
          <div align="center" style="margin-top:10px;">
            <div style="z-index:-1;" id="daum_map">
              <div id="map" style="height: 350px; border-radius: 0px 0px 10px 10px; position: relative; overflow: hidden; background: url(&quot;https://t1.daumcdn.net/mapjsapi/images/bg_tile.png&quot;);">
              <div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico&quot;), default;">
              <div style="position: absolute; left: 0px; top: 0px;">
              <div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;">
              <img src="https://map1.daumcdn.net/map_2d/2306uwn/L2/2539/2921.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -51px; top: 290px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map2.daumcdn.net/map_2d/2306uwn/L2/2539/2922.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 205px; top: 290px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map3.daumcdn.net/map_2d/2306uwn/L2/2539/2923.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 461px; top: 290px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map0.daumcdn.net/map_2d/2306uwn/L2/2539/2924.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 717px; top: 290px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map1.daumcdn.net/map_2d/2306uwn/L2/2540/2921.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -51px; top: 34px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map2.daumcdn.net/map_2d/2306uwn/L2/2540/2922.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 205px; top: 34px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map3.daumcdn.net/map_2d/2306uwn/L2/2540/2923.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 461px; top: 34px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map0.daumcdn.net/map_2d/2306uwn/L2/2540/2924.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 717px; top: 34px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map1.daumcdn.net/map_2d/2306uwn/L2/2541/2921.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -51px; top: -222px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map2.daumcdn.net/map_2d/2306uwn/L2/2541/2922.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 205px; top: -222px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map3.daumcdn.net/map_2d/2306uwn/L2/2541/2923.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 461px; top: -222px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              <img src="https://map0.daumcdn.net/map_2d/2306uwn/L2/2541/2924.png" alt="" role="presentation" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 717px; top: -222px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;">
              </div>
              <div style="position: absolute; z-index: 1;"></div>
              <div style="width: 700px; height: 350px; position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1;">
              <svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -1400px; top: -700px; width: 3500px; height: 1750px;" viewBox="0 0 3500 1750">
              <defs></defs></svg></div>
              <div style="position: absolute; z-index: 1; width: 100%; height: 0px; transform: translateZ(0px);">
              <div style="position: absolute; margin: -39px 0px 0px -14px; z-index: 0; left: 350px; top: 175px; display: block;">
              <img draggable="false" src="https://t1.daumcdn.net/mapjsapi/images/marker.png" alt="" role="presentation" title="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(0px, 29px, 42px, 0px); top: 0px; left: 0px; width: 29px; height: 42px;">
              <img src="https://t1.daumcdn.net/mapjsapi/images/transparent.gif" alt="" role="presentation" draggable="false" usemap="#daum.maps.Marker.Area:1" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 29px; height: 42px;">
              <map id="daum.maps.Marker.Area:1" name="daum.maps.Marker.Area:1"><area href="javascript:void(0)" alt="" role="presentation" shape="poly" coords="14,39,9,27,4,21,1,16,1,10,4,4,11,0,18,0,25,4,28,10,28,16,25,21,20,27" title="" style="-webkit-tap-highlight-color: transparent;"></map></div></div></div></div>
              <div style="position: absolute; cursor: default; z-index: 1; margin: 0px 6px; height: 19px; line-height: 14px; left: 0px; bottom: 0px; color: rgb(0, 0, 0);">
              <div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; float: left;">
              <div style="float: left; margin: 2px 3px 0px 4px; height: 6px; transition: width 0.1s ease 0s; border-top: none rgb(0, 0, 0); border-right: 2px solid rgb(0, 0, 0); border-bottom: 2px solid rgb(0, 0, 0); border-left: 2px solid rgb(0, 0, 0); border-image: initial; width: 56px;"></div>
              <div style="float: left; margin: 0px 4px 0px 0px; font-family: AppleSDGothicNeo-Regular, 돋움, dotum, sans-serif; font-weight: bold; color: rgb(0, 0, 0);">30m</div></div>
              <div style="margin: 0px 4px; float: left;"><a target="_blank" href="http://map.kakao.com/" title="Kakao 지도로 보시려면 클릭하세요." style="float: left; width: 32px; height: 10px;">
              <img src="https://t1.daumcdn.net/mapjsapi/images/m_bi_b.png" alt="Kakao 지도로 이동" style="float: left; width: 32px; height: 10px; border: none;"></a>
              <div style="font: 11px / 11px Arial, Tahoma, Dotum, sans-serif; float: left;"></div></div></div>
              <div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div>
            </div>
          </div>
        </div>

        <!--------- 판매정보 --------->
        <div style="margin-top:25px; margin-bottom:25px;">
          <div class="viewpage_noti">판매정보</div>

          <div class="viewpage_text border_box">
            <div class="viewpage_flex">
              <div>주최/주관</div>
              <div>비컨크리에이티브 주식회사</div>
            </div>
            <div class="viewpage_flex">
              <div>문의전화</div>
              <div>📞 <a href="TEL:053-252-5733">053-252-5733</a></div>
            </div>
            <div class="viewpage_flex" style="display:none;">
              <div>문의링크</div>
              <div>🔗 <a href="" target="_blank" style="text-decoration:underline;"></a></div>
            </div>
            <div class="viewpage_flex">
              <div>환불규정</div>
              <div><a href="#tab_view" onclick="loadTab(4, this)"><span>환불규정 바로가기</span></a></div>
            </div>
            <div class="viewpage_flex">
              <div>환불방법</div>
              <div>마이티켓 &gt; 예매내역에서 직접 취소</div>
            </div>

          </div>
        </div>

      </div>
    </div>
  </section>

</div>

  </div>

</body>
</html>