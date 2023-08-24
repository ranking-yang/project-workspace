<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <!-- 시큐리티 -->
	
	<div style="background-color: #f4f4f4;">
		<div id="mypage_con">
		
			<!-- 마이페이지 상단 메뉴 -->
			<div id="mypage_top">
				<div>
					<img src="/resources/mypage/img/img_mypage.png" alt="마이페이지 안내 문구" />
				</div>
				<div class="mypage_top_contents" id="my_info">
					<div>안녕하세요🙌</div>
					<!-- 시큐리티에서 이름 가져옴 -->
					<div><sec:authentication property="principal.member_name"/>님</div>
				</div>
				<div class="mypage_top_contents" id="my_coupon">
					<div><button class="mypage_menu_btn" onclick="location.href='/mypage/coupon'">나의 쿠폰 ></button></div>
					<div><span style="color: rgb(120,86,184);">${couponCount}</span> 개</div>
				</div>
				<div class="mypage_top_contents" id="my_wishList">
					<div><button class="mypage_menu_btn" onclick="location.href='/mypage/wishlist'">나의 찜목록 ></button></div>
					<div><span style="color: rgb(120,86,184);">${countWish }</span> 개</div>
				</div>
				<div class="mypage_top_contents">
					<!-- 여분 -->
				</div>
			</div>
			
			<!-- 마이페이지 왼쪽 메뉴 -->
			<div id="mypage_menu">
				<div id="mypage_menu_txt">마이티켓</div>
				<div id="mypage_menu_user">					
					<div><button class="mypage_menu_btn" onclick="location.href='/mypage'">예매내역</button></div>
					<div><button class="mypage_menu_btn" onclick="location.href='/mypage/refund'">취소/환불내역</button></div>
					<div><button class="mypage_menu_btn" onclick="location.href='/mypage/review'">나의 이용후기</button></div>
					<div><button class="mypage_menu_btn" onclick="location.href='/mypage/qna'">나의 Q&A</button></div>
					<div><button class="mypage_menu_btn" onclick="location.href='/mypage/check-before-change'">회원정보수정</button></div>
				</div>
				<div id="mypage_menu_as">
					<div class="mypage_submenu"><button class="mypage_menu_btn" onclick="location.href='/as/notice'">공지사항</button></div>
					<div class="mypage_submenu"><button class="mypage_menu_btn" onclick="location.href='/as/freq'">자주묻는 질문</button></div>
					<div class="mypage_submenu"><button class="mypage_menu_btn" onclick="location.href='/as/one-on-one'">1:1 문의</button></div>
				</div>
			</div>