<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/admin/js/admin_qna.js" var="admin_qna_js" />

<!-- 본문 -->
<div class="main" id="qnatab">
	<div id="qna_filter_con">
		<select id="qna-filter" name="qna-filter">
			<option value="allQnas">전체</option>
			<option value="qnaProcessing">답변대기</option>
			<option value="qnaComplete">답변완료</option>
		</select>
	</div>
	<div class="table-box">
		<table id="qna_table" style="padding: 20px 30px;">
			<thead>
				<tr>
					<th>상태</th>
					<th>qa_code</th>
					<th>performance_code</th>
					<th>ID</th>
					<th>date</th>
					<th>답변하기</th>
				<tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>
<script src="${admin_qna_js}"></script>