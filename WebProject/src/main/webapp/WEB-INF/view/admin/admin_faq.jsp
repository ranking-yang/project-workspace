<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/admin/js/admin_faq.js" var="admin_faq_js" />
<!-- 본문 -->
<div class="main">
	<div id="dashboard-faq">
		<h3 id="faq-title" style="text-align: left;">자주묻는질문 관리</h3>
		<hr>
		<div id="btnwrap_faq">
			<button id="faq-list-btn">목록</button>
			<button id="faq-write-btn">글쓰기</button>
			<button id="faq-delete-btn">삭제</button>
		</div>
		
		<!-- 인클루드 jsp -->
		<div id="faq-list" show><%@ include file="admin_faq_list.jsp" %></div>
		<div id="faq-write" hidden><%@ include file="admin_faq_write.jsp" %></div>
	</div>
</div>
<script src="${admin_faq_js}"></script>
