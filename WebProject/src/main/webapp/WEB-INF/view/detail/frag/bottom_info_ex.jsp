<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="main_tab_wrap">
		<div>
			<div class="viewpage_noti">예매정보</div>
			<div class="viewpage_text radius_box">
				<div>· 진행기간: ${performance.start_date} ~ ${performance.end_date}</div>
				<div>· 이용등급: 전체관람가</div>
				<div>· 이용시간: 해당 전시관 사이트를 참고 부탁 드립니다.</div>
				<div>· 홈페이지: <a href="${ex_info.placeUrl}">${ex_info.placeUrl}</a></div>
			</div>
		</div>
		<br>
		<!-- 진행사 홈페이지 -->
		<iframe src="${ex_info.placeUrl}"
		width="700px" height="750px">
			
		</iframe>

		<!--------- 장소안내 --------->
		<div>
			<div class="viewpage_noti">장소안내</div>
			<div class="viewpage_text radius_box">
				<div>· 장소: ${performance.place}</div>
				<div>· 주소: ${performance.address}</div>
				<div>· 주차: 주차불가 (인근 유료주차장 이용 권장)</div>
			</div>
			<!-- 지도가 위치할 곳 -->
			<div id="map1" data-la="${performance.latitude}" data-lo="${performance.longitude }"></div>
		</div>
	</div>
