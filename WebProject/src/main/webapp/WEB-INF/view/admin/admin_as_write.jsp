<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="notice-title-box">
	<div>
		<div id="notice-title">
			<input type="text" name="notice-title" style="width:100%; height: 30px; font-size : 20px;" placeholder="제목을 입력해 주세요.">
		</div>
		<div id="important-btn">
		<input type="radio" name="notice-level" value="0" checked><label for="normal-radio">일반</label>
		<input type="radio" name="notice-level" value="1"><label for="fixed-radio">고정</label>
		</div>
		<textarea id="notice-content"></textarea>
		<div id="confirm-btn">
		<button id="notice-confirm-btn">등록</button>
		</div>
	</div>
</div>
