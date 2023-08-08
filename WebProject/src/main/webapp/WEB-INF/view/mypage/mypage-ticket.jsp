<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/mypage/css/mypage.css" var="mypage_css" />
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
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<%@ include file="./mypage-menu.jsp"%>
	<!-- 메뉴 -->

	<!-- 나의 티켓 -->

	<div id="mypage_value">
		<div class="mypage_value_title">예매내역</div>
			<c:choose>
				<c:when test="${!empty tickets}">
					<c:forEach items="${tickets}" var="ticket">
					
						<div id="mypage-ticket-con">
							
						<jsp:useBean id="now" class="java.util.Date"/>	
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						
						<c:choose>
												
							<c:when test="${ticket.booking_date > today}">
									
								<div id="mypage-ticket-top">
									<div style="color: #7856b8">결제완료</div>
											<div></div>
									<div>${ticket.payment_date }</div>
								</div>
									
								<div id="mypage-ticket-middle">										
									<!-- 포스터 -->
									<div>
					                    <img id="mypage-ticket-poster" src="${ticket.poster }" alt="공연포스터">
					                </div>
					                <!-- 공연 내역 -->
									<div>
										<div>${ticket.performance_name }</div>
										<div>${ticket.booking_date } / 
											<c:if test="${!empty ticket.booking_time }">${ticket.booking_time }</c:if>
										</div>
										<div>총 ${ticket.booking_total_qty }매 / ${ticket.total_price }원</div>
										<div>
											※ 공연 - 관람 당일에는 환불이 불가합니다 <br>
											※ 전시, 음악 - 유효기간 이후에는 환불이 불가합니다
										</div>
									</div>
									<!-- 버튼들 -->
									<div>
										<div><button class="mypage-ticket-btn" onclick=goToDetail("${ticket.payment_code_fk}")>상세내역</button></div>
										<div><button class="mypage-ticket-btn">취소/환불</button></div>
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
								<div>
				                    <img id="mypage-ticket-poster" src="${ticket.poster }" alt="공연포스터">
				                </div>
				                <!-- 공연 내역 -->
								<div>
									<div>${ticket.performance_name }</div>
									<div>${ticket.booking_date } / 
										<c:if test="${!empty ticket.booking_time }">${ticket.booking_time }</c:if>
									</div>
									<div>총 ${ticket.booking_total_qty }매 / ${ticket.total_price }원</div>
									<div>
										※ 사용이 완료된 티켓입니다.
									</div>
								</div>
								<!-- 버튼들 -->
								<div>
									<div><button class="mypage-ticket-btn" onclick=goToDetail("${ticket.payment_code_fk}")>상세내역</button></div>
									<c:choose>
										<c:when test="${empty review_check}">
											<div><button class="mypage-ticket-btn">후기작성</button></div>	
										</c:when>
										<c:otherwise>
											<div><button class="mypage-ticket-btn">후기확인</button></div>	
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
	</script>
	
	<script src="${mypage_detail_js}"></script>

</body>
</html>