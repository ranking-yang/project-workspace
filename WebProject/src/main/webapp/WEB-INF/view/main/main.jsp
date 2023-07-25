<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/main/css/main.css" var="css" />
<c:url value="/resources/main/js/main.js" var="js" />
<%@ include file="/resources/common/commonCss.jsp" %> <!-- 공통 css -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="${css}">
<script src="${js}" defer></script>
<script src="https://kit.fontawesome.com/cdd406875c.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="../fragments/header/header.jsp" %>
	<section id="ranking-container">
		<div class="filters">
			<div class="main-filters">
				<ul id="main-filter-list">
					<li class="main-filter-item">
						<button class="main-filter-btn">공연</button>
					</li>
					<li class="main-filter-item">
						<button class="main-filter-btn">전시</button>
					</li>
					<li class="main-filter-item">
						<button class="main-filter-btn">음악</button>
					</li>
					<li class="main-filter-item">
						<button class="main-filter-btn last-btn">키즈</button>
					</li>
				</ul>
			</div>
			<div class="sub-filter">
				<ul id="sub-filter-list">
					<li class="sub-filter-item">
						<button class="sub-filter-btn">예매순</button>
					</li>
					<li class="sub-filter-item">
						<button class="sub-filter-btn">별점순</button>
					</li>
					<li class="sub-filter-item">
						<button class="sub-filter-btn last-btn">후기순</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="wrapper">
			<i id="left" class="fa-solid fa-angle-left"></i>
			<div class="performance-list">
				<div class="poster">
					<span class="ranking">1</span>
					<!-- <span class="title">제목</span> -->
					<span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF222318_230718_152555.gif"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">2</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF222203_230717_135603.gif"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">3</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF222164_230717_122606.gif"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">4</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF222143_230714_160301.png"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">5</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF222105_230714_133231.jpg"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">6</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF222058_230713_173933.jpg"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">7</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF221944_230712_121249.gif"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">8</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF221913_230711_173316.gif"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">9</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF221775_230710_144810.gif"
							alt="">
					</div>
				</div>
				<div class="poster">
					<span class="ranking">10</span> <span class="star">별점</span>
					<div class="img-wrap">
						<img
							src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF221975_230712_140757.jpg"
							alt="">
					</div>
				</div>
			</div>
			<i id="right" class="fa-solid fa-angle-right"></i>
		</div>
	</section>
	<%@ include file="../fragments/footer/footer.jsp" %>
</body>
</html>