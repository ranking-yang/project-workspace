<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="faq-title-box">
	<div>
		<div id="faq-title">
			<input type="text" name="faq-title" style="width:100%; height: 30px; font-size : 20px;" placeholder="제목을 입력해 주세요.">
		</div>
		<div>
			<select id="category-select">
				<option value="member">회원</option>
				<option value="login">로그인</option>
				<option value="payment">결제</option>
				<option value="refund">취소/환불</option>
				<option value="ticket">티켓</option>
				<option value="etc">기타</option>
			</select>
		</div>
		<textarea id="faq-content"></textarea>
		<div>
			<button id="faq-confirm-btn">등록</button>
		</div>
	</div>
</div>
