<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="header-container">

	<!-- 상단 로고, 로그인 / 회원가입 / 고객센터 -->
	<div id="main-title">
		<div></div>
		<div id="main-logo">
			<img src="/resources/common/image/logo.png" alt="로고">
		</div>
		<div id="main-user-nav">
			<div></div>
			<ul id="user-nav">
				<li class="user-nav-item">
					<button class="user-nav-btn">로그인</button>
				</li>
				<li>&nbsp;&nbsp;</li>
				<li class="user-nav-item">
					<button class="user-nav-btn">회원가입</button>
				</li>
				<li>&nbsp;&nbsp;</li>
				<li class="user-nav-item">
					<button class="user-nav-btn">고객센터</button>
				</li>
			</ul>
		</div>
	</div>
	<!-- 네비바 -->
	<div id="main-nav">
		<div id="main-nav-item">
			<div><button class="menu-btn">공연</button></div>
			<div><button class="menu-btn">전시</button></div>
			<div><button class="menu-btn">체험</button></div>
			<div><button class="menu-btn">키즈</button></div>
		</div>
		<div class="md-choice">MD 추천작</div>
		<div class="search">
			<!-- 나중에 input 태그 form 추가하세요 -->
			<input type="text" id="search-box">
			<input type="submit" id="search-submit" value=""/>
		</div>
	</div>

</div>