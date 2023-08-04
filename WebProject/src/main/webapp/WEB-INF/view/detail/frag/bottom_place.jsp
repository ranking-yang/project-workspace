<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <div class="contentstyle1" id="content_4">
<div class="main_tab_wrap">
	<div class="main_tab_title">장소안내</div>

  <div class="viewpage_text radius_box" style="margin-top:10px; border-radius: 10px 10px 0 0;">
    <p>· 장소: ${performance.place}</p>
    <p>· 주소: ${performance.address}</p>
    <p>· 주차: 주차불가(인근 유료주차장 이용 권장)</p>
  </div>
  <!-- 지도가 위치할 곳 -->
          <div align="center" style="margin-top:10px;">
				<div id="map2"></div>
          </div>
</div>
</div>