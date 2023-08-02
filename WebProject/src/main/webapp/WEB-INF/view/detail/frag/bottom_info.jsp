<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contentstyle1" id="content_1">
	<div class="main_tab_wrap">
		<div>
			<div class="viewpage_noti">예매정보</div>
			<div class="viewpage_text radius_box">
				<p>· 진행기간: ${performance.start_date} ~ ${performance.end_date}</p>
				<p>· 이용등급: ${age}</p>
				<p>· 이용시간: ${runtime}</p>
			</div>
		</div>

		<div style="margin-top: 25px;">
			<div class="viewpage_noti">기획사 공지사항</div>
			<div class="viewpage_text radius_box">
				<p>· 공연사 전화문의는 마지막 회차 공연 시작 전까지 가능합니다.</p>
			</div>
		</div>

		<div style="margin-top: 25px;">
			<div class="viewpage_noti">이용정보</div>
			<div class="viewpage_text radius_box">
				<p>· 예매가능시간: 공연 시작 10분 전까지</p>
				<p>· 티켓배부: 공연 시작 40분 전부터 공연장 매표소에서 배부</p>
				<p>· 티켓수령: 예매내역 제시 후 현장 수령(신분증/증빙자료 지참)</p>
				<p>· 입장시간: 공연 시작 15분 전부터 입장 가능</p>
				<p>· 좌석배정: 비지정석(타예매처 지정석 제외 후 매표소 선착순 배정)</p>
				<p class="txt_red">※ 각각 예매하더라도 함께 발권하면 연석 배정 가능합니다.</p>
			</div>
		</div>


		<!-- 상세이미지 -->
		<div class="info_detail_poster"
			style="background-image: url('${poster}');">
			<%-- <img alt="상세이미지" src="${poster}"> --%>
			<div class="info_detail_gradient"></div>
			<div class="info_detail_btn" onclick="showMoreDetailImage()">
				펼쳐보기 <img
					src="https://timeticket.co.kr/mobile_img/detail/icon_down.png"
					style="width: 25px; vertical-align: 2px; padding-left: 10px;">
			</div>
		</div>
		<div id="main_img" class="main_img">
			<!-- API에서 이미지 가져옴 -->
			<c:forEach items="${image}" var="item">
				<c:forEach items="${item.styurl}" var="test">
					<img src="${test}">
				</c:forEach>
			</c:forEach>
		</div>

		<div style="margin-top: 25px;">
			<div class="viewpage_noti">유의사항</div>
			<div class="viewpage_text radius_box">
				<p>· 공연 시작 후 발권 또는 입장 불가(지연입장 불가)</p>
				<p>· 지각으로 인해 관람하지 못할 시 환불/변경 불가</p>
				<p>· 지역착오, 연령 미숙지로 관람하지 못할 시 환불/변경 불가</p>
				<p>· 음식물 반입 금지. 공연 중 사진/동영상 촬영 금지</p>
				<p class="txt_red">· 관람 당일은 결제 후 환불/변경 불가하니 신중히 예매하세요.</p>
			</div>
		</div>

		<!--------- 장소안내 --------->
		<div style="margin-top: 25px;">
			<div class="viewpage_noti">장소안내</div>
			<div class="viewpage_text radius_box"
				style="border-radius: 10px 10px 0 0;">
				<p>· 장소: ${performance.place}</p>
				<p>· 주소: ${performance.address}</p>
				<p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
			</div>

			<!-- 지도가 위치할 곳 -->
			<div align="center" style="margin-top: 10px;">
				<div id="map1" data-la="${la }" data-lo="${lo }"></div>
			</div>
		</div>

	</div>
</div>