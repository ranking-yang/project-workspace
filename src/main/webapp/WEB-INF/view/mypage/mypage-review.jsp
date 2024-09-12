<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<c:url value="/resources/mypage/css/mypage-review.css" var="mypage_review_css" />
<c:url value="/resources/mypage/css/mypage-ticket.css" var="mypage_ticket_css" />
<c:url value="/resources/mypage/js/mypage_review.js" var="mypage_review_js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="../common/commonCss.jsp"%>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="${mypage_css}">
<link rel="stylesheet" href="${mypage_ticket_css}">
<link rel="stylesheet" href="${mypage_review_css}">
<script src="${mypage_review_js}"></script>
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	
	<%@ include file="./mypage-menu.jsp"%> <!-- 메뉴 -->
			
			<!-- 나의 티켓 -->
	
			<div id="mypage_value">
				<div class="mypage_value_title">
					<div>나의 이용후기</div>
					<div id="filter-con">		
						<select id="filter-select" data-val="${val}" onchange="changeSeq()">
							<option value="DESC">최신순</option>
							<option value="ASC">오래된순</option>
						</select>
				</div>
				</div>
					<!-- tickets는 Controller에서 model로 보낸 키 값으로 바꾸세요 -->
					<!-- 가져온 값 출력 -->
					<c:choose>
					<c:when test="${!empty reviews}">
						<c:forEach items="${reviews}" var="review" varStatus="status">
							<div id="mypage-ticket-con">
								<div id="mypage-ticket-top">	
									<div id="performance_name2" onclick="goToperformance('${review.main_category}', '${review.performance_code}')">
										${review.performance_name}
									</div>
									<div></div>
									<div>${review.review_date}</div>
								</div>
								<div id="mypage-ticket-middle">
								<!-- 포스터 -->
								<div class="ticket-poster-btn" onclick="goToperformance('${review.main_category}', '${review.performance_code}')">
							    	<img id="mypage-ticket-poster" src="${review.poster}" alt="공연포스터">
							    </div>
							    <div>
							    	<div id="TXTnBTN">
						                <div class="score_left_star_based">
											<div class="score_left_star_filled" style="width: calc(${review.review_star} * 24px);"></div>
										</div>
						            </div>
						            <div id="content">${review.review_content}</div>
							    </div>
						        <!-- 버튼들 -->
									<div>
										<div><button class="mypage-ticket-btn" onclick="update_content('${review.review_code}')">수정</button></div>
										<div><button class="mypage-ticket-btn" onclick="delete_alrim('${review.review_code}', '${review.performance_code}')">삭제</button></div>
									</div>  
						    	</div>
						    </div> 
					    </c:forEach>
					</c:when>
					<c:otherwise><div class="noValue">작성된 후기가 없습니다.</div></c:otherwise>
					</c:choose>
				</div>
			</div>
	
		</div> <!-- 메뉴 /div -->
	
	</div> <!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>
	
<script>
	$('.mypage_menu_btn').eq(4).addClass('clicked');
	
	var deletePath = '<%= request.getContextPath() %>/mypage/review/delete';
</script>
</body>
</html>