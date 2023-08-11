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
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div style="width:1100px; margin:auto; margin-bottom:30px; background: #eee;">
        <div style="width:600px; margin:0 auto; padding-top:20px;">
        <c:forEach items="${md_list}" var="mdlist">
        	<div class="event_list_wrap" style="border:2px solid #f1f1f1;">
		    <!-- 본문 등록시 '포스터 이미지 URL'을 입력하면 DB에 저장했다가 가져온다 -->
		    <div class="event_list_left">
		    <c:set var="loop_flag" value="false" />
		      <c:forEach items="${md_poster_li}" var="md_li">
		      	
		      	<c:if test="${not loop_flag}">
			      	<c:if test="${mdlist.md_code == md_li.md_code}">
			      		<img src="${md_li.poster}" style="opacity: 0.5;">
			      		<c:set var="loop_flag" value="true" />
			      	</c:if>
		      	</c:if>
		      </c:forEach>
		    </div>
		
		    <div class="event_list_right">
		      <div style="height:35px;"><span class="event_list_badge" style="background:#3E90FF;">MD 추천</span></div>
		      <div style="height:60px;"><span class="event_list_title" style="color:#777">${mdlist.md_title}</span></div>
		
		      <div style="font-size:14px;">
		      	<div style="height:32px;">
		          <span class="event_list_info_menu" style="background: #ccc;">장르</span>
		          <span class="event_list_info_txt">${mdlist.md_genrenm}</span>
		        </div>
		        <div style="height:32px;">
		          <span class="event_list_info_menu" style="background: #ccc;">시작일</span>
		          <span class="event_list_info_txt">${mdlist.md_period_start}</span>
		        </div>
		        <div style="height:32px;">
		          <span class="event_list_info_menu" style="background: #ccc;">종료일</span>
		          <span class="event_list_info_txt">${mdlist.md_period_end}</span>
		        </div>
		        <div style="height:32px;">
		          <span class="event_list_info_menu" style="background: #ccc;">지역</span>
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