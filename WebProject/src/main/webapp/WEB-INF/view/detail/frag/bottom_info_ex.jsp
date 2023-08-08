<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contentstyle1" id="content_1">
	<div class="main_tab_wrap">
		<div>
			<div class="viewpage_noti">예매정보</div>
			<div class="viewpage_text radius_box">
				<p>· 진행기간: ${performance.start_date} ~ ${performance.end_date}</p>
				<p>· 이용등급: 전체관람가</p>
				<p>· 이용시간: -</p>
			</div>
		</div>
		<br>
		<!-- 진행사 홈페이지 -->
		<iframe src="http://www.snart.or.kr/web/cms/?MENUMST_ID=21483"
		width="700px" height="750px">
			
		</iframe>

		<!--------- 장소안내 --------->
		<div style="margin-top: 25px;">
			<div class="viewpage_noti">장소안내</div>
			<div class="viewpage_text radius_box"
				style="border-radius: 10px 10px 0 0;">
				<p>· 장소: ${performance.place}</p>
				<p>· 주소: ${performance.address}</p>
			</div>

			<!-- 지도가 위치할 곳 -->
			<div align="center" style="margin-top: 10px;">
				<div id="map1" data-la="${performance.latitude }" data-lo="${performance.longitude }"></div>
			</div>
		</div>

	</div>
</div>