<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="gnb_wrap" style="height: 30px;">
	<div style="position: absolute; right: 0;">
		<ul id="top_gnb" style="margin-top: 60px;">
			<li><a href="링크 기재" >로그인</a></li>
			<li><a href="링크 기재" >회원가입</a></li>
			<li><a href="링크 기재" >고객센터</a>
				<ul>
					<li><a href="링크 기재">공지사항</a></li>
					<li><a href="링크 기재">FAQ</a></li>
					<li><a href="링크 기재">1:1문의</a></li>
				</ul></li>
		</ul>
	</div>
</div>

<!-- 상단 네비게이션 바 -->
<div class="gnb_wrap" style="height: 80px; right: -450px;">
	<a href="https://timeticket.co.kr/"> <img
		src="/resources/fragments/image/logo.png"
		style="cursor: pointer; image-rendering: optimizeQuality; width: 200px; height: 100px;"
		alt="로고">
	</a>
	<div style="position: absolute; top: 2px; left: 335px;">
		<style type="text/css">
input:focus {
	outline: none;
}

.search_box {
	font-size: 15px;
	height: 38px;
	line-height: 38px;
	padding: 0 20px;
	vertical-align: top;
	border: 1px solid #e0e0e0;
	width: 240px;
	border-radius: 20px;
	color: #999;
	background: #f9f9f9;
}
</style>

	</div>
</div>

<div class="gnb_wrap" style="margin-top: 10px; margin-bottom: -20px;">
	<ul class="gnb_nav">
		<li class=""><a href="링크기재" style="margin-right: 20px;">공연</a></li>
		<li class=""><a href="링크기재" style="margin-right: 20px;">전시</a></li>
		<li class=""><a href="링크기재" style="margin-right: 20px;">체험</a></li>
		<li class=""><a href="링크기재" style="margin-right: 20px;">키즈</a></li>
		<li class="nav_divide" style="padding-right: 50px;">|</li>
		<li style="padding-right: 30px;"><a href="링크기재"
			style="color: #ff4b4b"> MD추천 </a></li>

		<li style="padding-right: 50px;"><a href="링크기재"
			style="color: #ff4b4b"> 랭킹 </a></li>

		<li class="nav_divide" style="padding-right: 50px;">|</li>

		<style>
/* 검색칸 스타일 */
.search_box {
	position: absolute;
	width: 250px;
	/* 너비를 원하는 크기로 조정 */
	vertical-align: top;
}
</style>

		<li>
			<form name="frm" method="get" action="검색결과링크" onsubmit="return">
				<div
					style="vertical-align: top; position: relative; margin-bottom: 20px;">
					<input type="text" name="search_word" id="search_word" value=""
						class="search_box">

					<div style="position: absolute; top: 2px; left: 250px;">
						<input name="image" type="image"
							src="/resources/fragments/image/search_btn.png" alt="검색하기"
							onfocus="this.blur();" style="padding: 8px;">
					</div>
				</div>
			</form>
		</li>
	</ul>
</div>
