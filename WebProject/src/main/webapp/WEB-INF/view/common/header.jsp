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
					<button class="user-nav-btn" id="login">로그인</button>
				</li>
				<li>&nbsp;&nbsp;</li>
				<li class="user-nav-item">
					<button class="user-nav-btn" id="join">회원가입</button>
				</li>
				<li>&nbsp;&nbsp;</li>
				<li class="user-nav-item">
					<button class="user-nav-btn" id="as">고객센터</button>
				</li>
			</ul>
		</div>
	</div>
	<!-- 네비바 -->
	<div id="main-nav">
		<div id="main-nav-item">
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="performance">공연</button>
				<div class="dropdown-content"><!-- 추후 드롭다운 메뉴를 구현할 때 사용 예정입니다 -->
					<div class="genrenm" id="drama">연극</div>
					<div class="genrenm" id="musical">뮤지컬</div>
					<div class="genrenm" id="magic">서커스/마술</div>
					<div class="genrenm" id="concert">콘서트</div>
				</div>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="exhibition">전시</button>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="music">음악</button>
				<div class="dropdown-content">
					<div class="genrenm" id="koreanMusic">국악</div>
					<div class="genrenm" id="classic">클래식</div>
					<div class="genrenm" id="complex">복합</div>
				</div>
			</div>
			<div class="main-nav-btn">
				<button class="menu-btn" data-id="kids">키즈</button>
			</div>
		</div>
		<div class="md-choice">MD 추천작</div>
		<div class="search">
			<!-- 나중에 input 태그 form 추가하세요 -->
			<form id="search" action="">
				<input type="text" id="search-box">
				<input type="submit" id="search-submit" value=""/>
			</form>
		</div>
	</div>

</div>