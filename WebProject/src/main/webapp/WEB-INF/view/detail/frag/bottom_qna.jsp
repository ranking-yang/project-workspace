<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="main_tab_wrap">
	<div class="main_tab_title">티켓 관련 문의사항을 남겨주세요.</div>
	<div class="viewpage_content">
		※ 환불/취소요청은 <a href=""><span class="viewpage_link">마이티켓 &gt;	환불신청</span></a>, 
		이용 불편 및 요청사항은 <a href=""><span class="viewpage_link">1:1문의</span></a>를 이용해주세요.
	</div>
	<div id="qna_form_container">
		<div id="qnd_form">
			<div id="qna_textarea">
				<textarea id="qnaTextarea" data-user="${member_id }" placeholder="· Q&amp;A를 통한 일정변경/환불 문의는 처리되지 않습니다.
· 날짜/시간 변경은 불가하며 환불 후 다시 예매해야 합니다.
· 티켓 환불은 마이티켓>예매내역에서 신청 가능합니다.">
</textarea>
			</div>
		</div>
		<div id="qna_button">
			<button onclick="addQnA('${performance.performance_code}', '${member_id}', '${member_code }')">등록</button>
		</div>
	</div>
	<div id="qna_text_container">
		<c:forEach var="qna" items="${qnalist }">
			<div class="qna">
				<div class="qna_info">
					<span class="qna_id">${qna.qa_writer_id }</span>
					<span class="qna_date">(${qna.qa_date })</span>
				</div>
				<div class="qna_content">${qna.qa_content }</div>
			</div>
		</c:forEach>
	</div>
	</div>