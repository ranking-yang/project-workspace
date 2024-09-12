<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/main/css/mdrecommend.css" var="css" />
<%-- <c:url value="/resources/main/js/main.js" var="js" /> --%>
<%@ include file="../common/commonCss.jsp" %> <!-- 공통 css -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="${css}">
<script src="${js}" defer></script>
<script src="https://kit.fontawesome.com/cdd406875c.js"
	crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	 <script>
	 	$(document).on("click", ".event_list_wrap", function(){
	 		var mdCode = $(this).data("md-code"); // 클릭한 요소의 data-md-code 값을 가져옵니다.
	 	    location.href = "/product/mdrecom?main_category="+mdCode;
		});
	 	
	 	$(document).ready(function() {
	        var today = new Date();
	        today.setHours(0, 0, 0, 0); // 오늘 날짜의 시간을 00:00:00으로 설정
	        $(".event_list_wrap").each(function() {
	            var mdPeriodEndStr = $(this).find("#enddate").text();
	            var mdPeriodEnd = new Date(mdPeriodEndStr + "T23:59:59"); // 'T23:59:59'를 추가하여 날짜와 시간을 표현
	            if (mdPeriodEnd < today) {
	                $(this).find("img").css("opacity", "0.5");
	                $(this).hide();
	            }
	        });
	    });
	 </script>
	
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div style="width:1100px; margin:auto; margin-bottom:30px; background: #eee;">
        <div style="width:1000px; margin:0 auto; padding :20px 20px 20px 20px;">
        <c:forEach items="${md_list}" var="mdlist">
        	
        	<div class="event_list_wrap" style="border:2px solid #f1f1f1;" data-md-code="${mdlist.md_code}">
		    <!-- 본문 등록시 '포스터 이미지 URL'을 입력하면 DB에 저장했다가 가져온다 -->
		    <div class="event_list_left">
		    <c:set var="loop_flag" value="false" />
		      <c:forEach items="${md_poster_li}" var="md_li">	
		      	<c:if test="${not loop_flag}">
			      	<c:if test="${mdlist.md_code == md_li.md_code}">
			      		<img src="${md_li.poster}"> 
			      		<c:set var="loop_flag" value="true" />
			      	</c:if>
		      	</c:if>
		      </c:forEach>
		    </div>
			
		    <div class="event_list_right">
		      <div style="height:35px;">
		      <span class="event_list_badge" style="background:#3E90FF;">MD 추천</span>
		      <span class="event_list_badge" style="color:gray; float: right;">${mdlist.md_period_start} ~ ${mdlist.md_period_end}</span>
		      </div>
		      <div style="height:60px;"><span class="event_list_title" style="color:black;">${mdlist.md_title}</span></div>
		
		      <div style="font-size:16px;">
		      	<div style="height:32px;">
		          <span class="event_list_info_menu" style="background: #3E90FF;">장르</span>
		          <span class="event_list_info_txt">${mdlist.md_genrenm}</span>
		        </div>
		        <div style="height:32px; display: none;">
		          <span class="event_list_info_menu" style="background: #ccc;">시작일</span>
		          <span class="event_list_info_txt">${mdlist.md_period_start}</span>
		        </div>
		        <div style="height:32px; display: none;">
		          <span class="event_list_info_menu" style="background: #ccc;">종료일</span>
		          <span class="event_list_info_txt" id="enddate">${mdlist.md_period_end}</span>
		        </div>
		        <div style="height:32px;">
		          <span class="event_list_info_menu" style="background: #3E90FF;">지역</span>
		          <span class="event_list_info_txt">${mdlist.md_area}</span>
		        </div>
		      </div>
			</div>
		  </div>
        </c:forEach>
		<!-- <a href=""> -->
		  
		</div>
		</div>
	<%@ include file="../common/footer.jsp" %>
	<%@ include file="../common/commonJs.jsp" %>
</body>
</html>