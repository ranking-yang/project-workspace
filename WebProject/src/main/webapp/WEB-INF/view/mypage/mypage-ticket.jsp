<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
<c:url value="/resources/mypage/css/mypage-ticket.css" var="mypage_ticket_css" />
<c:url value="/resources/mypage/js/mypage_ticket.js" var="mypage_detail_js" />
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
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">
		
		<div>예매내역</div>
		
		<div id="filter-con">		
			<select id="filter-select" data-val="${val}" onchange="filteringTicket()">
				<option value="all">전체</option>
				<option value="available">사용가능</option>
				<option value="done">사용완료</option>
				<option value="newest">최신순</option>
				<option value="old">오래된순</option>
			</select>
		</div>
		
		</div>
		
		<%
			java.util.Date currentDate = new java.util.Date();
			java.text.SimpleDateFormat dateTimeFormat1 = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
			java.text.SimpleDateFormat dateTimeFormat2 = new java.text.SimpleDateFormat("yyyy-MM-dd");
			String currentDateTimeFormatted = dateTimeFormat1.format(currentDate);
			String currentDateFormatted = dateTimeFormat2.format(currentDate);
			pageContext.setAttribute("currentDateTimeFormatted", currentDateTimeFormatted);
			pageContext.setAttribute("currentDateFormatted", currentDateFormatted);
		%>

			<c:choose>
				<c:when test="${!empty tickets}">
					<c:forEach items="${tickets}" var="ticket">
					
								<div id="mypage-ticket-con">									
								
								<c:set var="targetDateTime" value="${ticket.booking_date} ${ticket.booking_time }" />
								
								<c:choose>

									<c:when test="${ticket.booking_date >= currentDateFormatted && empty ticket.booking_time}">					
											
										<div id="mypage-ticket-top">
											<div style="color: #7856b8">사용가능</div>
													<div></div>
											<div>${ticket.payment_date }</div>
										</div>
											
										<div id="mypage-ticket-middle">								
											<!-- 포스터 -->
											<div class="ticket-poster-btn" onclick="goToperformance('${ticket.main_category}', '${ticket.performance_code}')">
							                    <img id="mypage-ticket-poster" src="${ticket.poster }" alt="공연포스터">
							                </div>
							                <!-- 공연 내역 -->
											<div>
												<div class="ticket-performance-name-txt" onclick="goToperformance('${ticket.main_category}', '${ticket.performance_code}')">${ticket.performance_name }</div>
												<div> 
													유효기간 : ~ ${ticket.booking_date }
												</div>
												<div>총 ${ticket.booking_total_qty }매 / ${ticket.total_price }원</div>
												<div class="notice">
													※ 유효기간 당일 및 이후에는 환불이 불가합니다
												</div>
											</div>
											<!-- 버튼들 -->
											<div>
												<div><button class="mypage-ticket-btn" onclick="goToDetail('${ticket.payment_code}')">상세내역</button></div>
												<div><button class="mypage-ticket-btn" onclick="refundTicket('${ticket.payment_code}', '${ticket.booking_date}')">환불신청</button></div>
											</div>
										</div>			
									</div>		
											
								</c:when>
								
								<c:when test="${targetDateTime > currentDateTimeFormatted && !empty ticket.booking_time}">	
													
										<div id="mypage-ticket-top">
											<div style="color: #7856b8">사용가능</div>
													<div></div>
											<div>${ticket.payment_date }</div>
										</div>
											
										<div id="mypage-ticket-middle">								
											<!-- 포스터 -->
											<div class="ticket-poster-btn" onclick="goToperformance('${ticket.main_category}', '${ticket.performance_code}')">
							                    <img id="mypage-ticket-poster" src="${ticket.poster }" alt="공연포스터">
							                </div>
							                <!-- 공연 내역 -->
											<div>
												<div class="ticket-performance-name-txt" onclick="goToperformance('${ticket.main_category}', '${ticket.performance_code}')">${ticket.performance_name }</div>
												<div> 
													${ticket.booking_date } / ${ticket.booking_time }
												</div>
												<div>총 ${ticket.booking_total_qty }매 / ${ticket.total_price }원</div>
												<div class="notice">
													※ 관람 당일에는 환불이 불가합니다 <br>
												</div>
											</div>
											<!-- 버튼들 -->
											<div>
												<div><button class="mypage-ticket-btn" onclick="goToDetail('${ticket.payment_code}')">상세내역</button></div>
												<div><button class="mypage-ticket-btn" onclick="refundTicket('${ticket.payment_code}', '${ticket.booking_date}')">환불신청</button></div>
											</div>
										</div>			
									</div>
									
								</c:when>
								
								<c:otherwise>
											
										<div id="mypage-ticket-top">
											<div style="color: gray">사용완료</div>
													<div></div>
											<div>${ticket.payment_date }</div>
										</div>
										
										<div id="mypage-ticket-middle">										
										<!-- 포스터 -->
										<div class="ticket-poster-btn" onclick="goToperformance('${ticket.main_category}', '${ticket.performance_code}')">
						                    <img id="mypage-ticket-poster" src="${ticket.poster }" alt="공연포스터">
						                </div>
						                <!-- 공연 내역 -->
										<div>
											<div class="ticket-performance-name-txt" onclick="goToperformance('${ticket.main_category}', '${ticket.performance_code}')">${ticket.performance_name }</div>
											<div><c:choose>
													<c:when test="${!empty ticket.booking_time }">${ticket.booking_date } / ${ticket.booking_time }</c:when>
													<c:otherwise>유효기간 : ~ ${ticket.booking_date }</c:otherwise>
												 </c:choose>
											</div>
											<div>총 ${ticket.booking_total_qty }매 / ${ticket.total_price }원</div>
											<div class="done">
												※ 사용이 완료된 티켓입니다.
											</div>
										</div>
										<!-- 버튼들 -->
										<div>
											<div><button class="mypage-ticket-btn" onclick="goToDetail('${ticket.payment_code}')">상세내역</button></div>
											<c:choose>
												<c:when test="${empty ticket.review_code}">
													<div><button class="mypage-ticket-btn review" onclick="goToReviewWriting('${ticket.performance_code}', '${ticket.payment_code}')">후기작성</button></div>	
												</c:when>
												<c:otherwise>
													<div></div>	
												</c:otherwise>
											</c:choose>
										</div>
									</div>			
								</div>	
											
								</c:otherwise>						
														
							</c:choose>
						
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="noValue">예매 내역이 없습니다.</div>
				</c:otherwise>
			</c:choose>

	</div>	<!-- 메뉴 /div -->

	</div>	<!-- 메뉴 /div -->

	<%@ include file="../common/footer.jsp"%>

	<%@ include file="../common/commonJs.jsp"%>

	<script>
		$('.mypage_menu_btn').eq(2).addClass('clicked');
		
		function goToReviewWriting(performance_code, payment_code){
			window.open('/mypage/reviewWriting?performance_code=' + performance_code + '&payment_code=' + payment_code,
					'reviewWriting', 'width=625px,height=425px,left=655px,top=250px');
		}
	</script>
	
	<script src="${mypage_detail_js}"></script>
</body>
</html>