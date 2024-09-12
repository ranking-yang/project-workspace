
const pwdField = document.getElementById('pwd-field');
const checkBtn = document.getElementById('check-btn');

checkBtn.addEventListener('click', () => {
	if (pwdField.value === "") {
		alert('비밀번호를 입력하세요');
		window.history.back();
	}
})
