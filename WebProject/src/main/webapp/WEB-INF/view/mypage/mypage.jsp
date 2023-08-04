<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/mypage/css/mypage_main.css" var="main_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<link rel="stylesheet" href="${main_css}">
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	<div style="background-color: #f4f4f4;">
		<div id="mypage_con">
		
			<!-- 마이페이지 상단 메뉴 -->
			<div id="mypage_top">
				<div>
					<img src="/resources/mypage/img/img_mypage.png" alt="마이페이지 안내 문구" />
				</div>
				<div class="mypage_top_contents" id="my_info">
					<div>안녕하세요🙌</div>
					<div>OOO님</div>
				</div>
				<div class="mypage_top_contents" id="my_coupon">
					<div><button class="mypage_menu_btn">나의 쿠폰 ></button></div>
					<div style="color: rgb(120,86,184);">0</div>
				</div>
				<div class="mypage_top_contents" id="my_wishList">
					<div><button class="mypage_menu_btn">나의 찜목록 ></button></div>
					<div style="color: rgb(120,86,184);">0</div>
				</div>
				<div class="mypage_top_contents">
					<!-- 여분 -->
				</div>
			</div>
			
			<!-- 마이페이지 왼쪽 메뉴 -->
			<div id="mypage_menu">
				<div id="mypage_menu_txt">마이티켓</div>
				<div id="mypage_menu_user">					
					<div><button class="mypage_menu_btn">예매내역</button></div>
					<div><button class="mypage_menu_btn">취소/환불내역</button></div>
					<div><button class="mypage_menu_btn">나의 이용후기</button></div>
					<div><button class="mypage_menu_btn">나의 Q&A</button></div>
					<div><button class="mypage_menu_btn">회원정보수정</button></div>
				</div>
				<div id="mypage_menu_as">
					<div class="mypage_submenu"><button class="mypage_menu_btn">공지사항</button></div>
					<div class="mypage_submenu"><button class="mypage_menu_btn">자주묻는 질문</button></div>
					<div class="mypage_submenu"><button class="mypage_menu_btn">1:1 문의</button></div>
				</div>
			</div>
			
			<!-- 마이페이지 value -->
	
			<div id="mypage_value">3</div>
	
		</div>
	
	</div>

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

</body>
</html>