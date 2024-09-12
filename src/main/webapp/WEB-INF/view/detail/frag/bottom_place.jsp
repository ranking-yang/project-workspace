<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="main_tab_wrap">
	<div class="main_tab_title">장소안내</div>
	<div class="viewpage_text radius_box">
		<div>· 장소: ${performance.place}</div>
		<div>· 주소: ${performance.address}</div>
		<div>· 주차: 주차불가(인근 유료주차장 이용 권장)</div>
	</div>
	<!-- 지도가 위치할 곳 -->
	<div align="center">
		<div id="map2"></div>
	</div>
</div>
