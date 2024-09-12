<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/admin/js/admin_as.js" var="admin_as_js" />
<!-- 본문 -->
<div class="main">
	<div id="dashboard-notice">
		<h3 id="notice-title" style="text-align: left;">공지사항 관리</h3>
		<hr>
		<div id="btnwrap">
			<button id="notice-list-btn">목록</button>
			<button id="notice-write-btn">글쓰기</button>
			<button id="notice-delete-btn">삭제</button>
		</div>
		
		<!-- 인클루드 jsp -->
		<div id="notice-list" show><%@ include file="admin_as_list.jsp" %></div>
		<div id="notice-write" hidden><%@ include file="admin_as_write.jsp" %></div>
	</div>
</div>
<script src="${admin_as_js}"></script>
