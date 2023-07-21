<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 상세페이지</title>
<link rel="stylesheet" href="/resources/search-list/css/search-list.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/ad03eb7935.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="search-list-container">
		<c:choose>
			<%-- 검색된 값이 없을때 나오는 화면 --%>
			<c:when test="${empty searchList}">
				<div id="noSearchList">
					<div>🔎 검색어와 일치하는 티켓이 없습니다.</div>
					<div>지역/작품명 등 다른 검색어를 이용해서 검색해보세요</div>
				</div>
			</c:when>
			<c:otherwise>
				<div id="search-product-container">
					<div id="product">
		            	<div class="product-module">
			                <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/04/13/1681360709-74-0_wonbon_N_7_255x357_70_2.jpg" alt="">
			                <div class="product-module-top">
			                <div class="place">
			                    <span>서울/종로구</span>
			                </div>
			                <button class="likeBtn" id="btn1" onclick="toggleLike(event, 'btn1')">
			                    <i class="fa-regular fa-heart" style="color: #000000;"></i>
			                </button>
			            	</div>
			                <div class="product-module-title">제목</div>
			                <div class="product-module-bottom">
			                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
			                    <div>가격</div>
			                </div>
		            	</div>
		            	<div class="product-module">
			                <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/05/15/1684131247-17-0_wonbon_N_7_255x357_70_2.jpg" alt="">
			                <div class="product-module-top">
			                    <div class="place">
			                        <span>서울/종로구</span>
			                    </div>
			                    <button class="likeBtn" id="btn2" onclick="toggleLike(event, 'btn2')">
			                        <i class="fa-regular fa-heart" style="color: #000000;"></i>
			                    </button>
			                </div>
			                <div class="product-module-title">제목</div>
			                <div class="product-module-bottom">
			                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
			                    <div>가격</div>
		                	</div>
		            	</div>
			            <div class="product-module">
			                <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/04/27/1682579612-91-0_wonbon_N_7_255x357_70_2.jpg" alt="">
			                <div class="product-module-top">
			                    <div class="place">
			                        <span>서울/종로구</span>
			                    </div>
			                    <button class="likeBtn" id="btn3" onclick="toggleLike(event, 'btn3')">
			                        <i class="fa-regular fa-heart" style="color: #000000;"></i>
			                    </button>
			                </div>
			                <div class="product-module-title">제목</div>
			                <div class="product-module-bottom">
			                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
			                    <div>가격</div>
			                </div>
			        	</div>
			            <div class="product-module">
			                <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/06/07/1686100520-43-0_wonbon_N_7_255x357_70_2.jpg" alt="">
			                <div class="product-module-top">
			                    <div class="place">
			                        <span>서울/종로구</span>
			                    </div>
			                    <button class="likeBtn" id="btn4" onclick="toggleLike(event, 'btn4')">
			                        <i class="fa-regular fa-heart" style="color: #000000;"></i>
			                    </button>
			                </div>
			                <div class="product-module-title">제목</div>
			                <div class="product-module-bottom">
			                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
			                    <div>가격</div>
			                </div>
		        		</div>
			            <div class="product-module">
			                <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/07/11/1689041453-58-3_wonbon_N_7_255x357_70_2.jpg" alt="">
			                <div class="product-module-top">
			                    <div class="place">
			                        <span>서울/종로구</span>
			                    </div>
			                    <button class="likeBtn" id="btn5" onclick="toggleLike(event, 'btn5')">
			                        <i class="fa-regular fa-heart" style="color: #000000;"></i>
			                    </button>
			                </div>
			                <div class="product-module-title">제목</div>
			                <div class="product-module-bottom">
			                    <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
			                    <div>가격</div>
			                </div>
			        	</div>
				        <div class="product-module">
				            <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2022/05/24/1653389714-45-0_wonbon_N_7_255x357_70_2.jpg" alt="">
				            <div class="product-module-top">
				                <div class="place">
				                    <span>서울/종로구</span>
				                </div>
				                <button class="likeBtn" id="btn6" onclick="toggleLike(event, 'btn6')">
				                    <i class="fa-regular fa-heart" style="color: #000000;"></i>
				                </button>
				            </div>
				            <div class="product-module-title">제목</div>
				            <div class="product-module-bottom">
				                <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
				                <div>가격</div>
				            </div>
				       	</div>
				        <div class="product-module">
				            <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/04/21/1682039329-64-0_wonbon_N_7_255x357_70_2.jpg" alt="">
				            <div class="product-module-top">
				                <div class="place">
				                    <span>서울/종로구</span>
				                </div>
				                <button class="likeBtn" id="btn7" onclick="toggleLike(event, 'btn7')">
				                    <i class="fa-regular fa-heart" style="color: #000000;"></i>
				                </button>
				            </div>
				            <div class="product-module-title">제목</div>
				            <div class="product-module-bottom">
				                <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
				                <div>가격</div>
				            </div>
				       </div>
				        <div class="product-module">
				            <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/06/09/1686276494-55-0_wonbon_N_7_255x357_70_2.jpg" alt="">
				            <div class="product-module-top">
				                <div class="place">
				                    <span>서울/종로구</span>
				                </div>
				                <button class="likeBtn" id="btn8" onclick="toggleLike(event, 'btn8')">
				                    <i class="fa-regular fa-heart" style="color: #000000;"></i>
				                </button>
				            </div>
				            <div class="product-module-title">제목</div>
				            <div class="product-module-bottom">
				                <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
				                <div>가격</div>
				            </div>
				       </div>
				        <div class="product-module">
				            <img class="product-module-poster" src="https://timeticket.co.kr/wys2/file_attach_thumb/2023/06/07/1686103010-3-0_wonbon_N_7_255x357_70_2.jpg" alt="">
				            <div class="product-module-top">
				                <div class="place">
				                    <span>서울/종로구</span>
				                </div>
				                <button class="likeBtn" id="btn9" onclick="toggleLike(event, 'btn9')">
				                    <i class="fa-regular fa-heart" style="color: #000000;"></i>
				                </button>
				            </div>
				            <div class="product-module-title">제목</div>
				            <div class="product-module-bottom">
				                <div class="star"><i class="fa-solid fa-star" style="color: #ffcb0f;"></i>4.8(828)</div>
				                <div>가격</div>
				            </div>
				       </div>
		    		</div>
            		<div class="scroll-up"><img src="https://timeticket.co.kr/mobile_img/btn_scrollup.png" alt=""> </div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<script src="/resources/search-list/js/search-list.js"></script>
</body>
</html>