

const form = document.getElementById('form');
const updatePassword = document.getElementById('modify-pwd');
const checkPassword = document.getElementById('modify-check');
const updateEmail = document.getElementById('email');
const updatePhone = document.getElementById('phone');

const originEmail = document.getElementById('origin-email');

const pwdFeedback = document.getElementById('password-feedback');
const chkFeedback = document.getElementById('check-feedback');
const chkIcon = document.getElementById('chk-icon');
const emailFeedback = document.getElementById('email-feedback');
const phoneFeedback = document.getElementById('phone-feedback');

const emailVerifyBtn = document.getElementById('email-verify');

const verifiedEmail = document.getElementById('verified-email'); 

emailVerifyBtn.addEventListener('click', () => {
	let options = 'top=300, left=660, height=150, width=300, location=no';
	window.open('/mypage/verify-email', '이메일인증', options);
})

updateEmail.addEventListener('input', () => {
	if (updateEmail.value === '') {
		emailFeedback.textContent = '';
	} else if (!isEmailValidation(updateEmail.value)) {
		emailFeedback.textContent = '사용가능한 이메일 형식이 아닙니다.';
		emailFeedback.style.color = 'palevioletred';
	} else {
		emailFeedback.textContent = '사용가능한 이메일 형식입니다.';
		emailFeedback.style.color = '#46c8b4';
	}
})
if (updatePassword != null) {
	updatePassword.addEventListener('input', () => {
		if (updatePassword.value === '') {
			pwdFeedback.textContent = '';
		} else if (!isPasswordValidation(updatePassword.value)) {
			pwdFeedback.textContent = '사용불가능한 비밀번호입니다.';
			pwdFeedback.style.color = 'palevioletred';
		} else {
			pwdFeedback.textContent = '사용가능한 비밀번호입니다.';
			pwdFeedback.style.color = '#46c8b4';
		}
	})
}
if (updatePhone != null) {
	updatePhone.addEventListener('input', () => {
		if (updatePhone.value === '') {
			phoneFeedback.textContent = '';
		} else if (!isPhoneNumberValidation(updatePhone.value)) {
			phoneFeedback.textContent = '틀린 전화번호입니다.';
			phoneFeedback.style.color = 'palevioletred';
		} else {
			phoneFeedback.textContent = '사용가능한 전화번호 형식입니다.';
			phoneFeedback.style.color = '#46c8b4';
		}
	})
}
if (checkPassword != null) {
	checkPassword.addEventListener('input', () => {
		if (checkPassword.value === '') {
			chkFeedback.textContent = '';
			chkIcon.textContent = 'lock';
		} else if (updatePassword.value != checkPassword.value) {
			chkFeedback.textContent = '입력하신 비밀번호가 다릅니다.';
			chkFeedback.style.color = 'palevioletred';
			chkIcon.textContent = 'lock';
		} else {
			chkFeedback.textContent = '비밀번호가 확인되었습니다.';
			chkFeedback.style.color = '#46c8b4';
			chkIcon.textContent = 'done';
		}
	})
}

let passwordBlank = null;
let validPassword = null;
let samePassword = null;

let aboutPassword = null;

let validEmail = null;
let emailCheck = null;

let aboutEmail = null;

let validPhone = null;

form.addEventListener('submit', function(e) {
	if (updatePassword != null) {
		if (updatePassword.value.trim() == "" || checkPassword.value.trim() == "") {
			e.preventDefault();
			alert('변경할 비밀번호를 입력해주세요.');
			passwordBlank = false;
		} else {
			passwordBlank = true;
		}

		if (!isPasswordValidation(updatePassword.value)) {
			e.preventDefault();
			alert('사용할 수 없는 비밀번호입니다.');
			validPassword = false;
		} else {
			validPassword = true;
		}

		if (updatePassword.value != checkPassword.value) {
			e.preventDefault();
			alert('입력한 비밀번호가 다릅니다');
			samePassword = false;
		} else {
			samePassword = true;
		}
		
		aboutPassword = passwordBlank && validPassword && samePassword;
	} else {
		aboutPassword = true;
	}
	if (!isEmailValidation(updateEmail.value)) {
		e.preventDefault();
		alert('올바르지 않은 이메일 형식입니다.');
		validEmail = false;
	} else {
		validEmail = true;
	}
	
	if (originEmail.value != updateEmail.value && verifiedEmail.value != 'true') {
		e.preventDefault();
		alert('이메일 인증이 필요합니다.')
		emailCheck = false;
	} else {
		emailCheck = true;
	}
	
	aboutEmail = validEmail && emailCheck;
	
	if (updatePhone != null) {
		if (!isPhoneNumberValidation(updatePhone.value)) {
			e.preventDefault();
			alert('올바르지 않은 전화번호 형식입니다');
			validPhone = false;
		} else {
			validPhone = true;
		}
	} else {
		validPhone = true;
	}
	
	if (aboutPassword && aboutEmail && validPhone) {
		alert('회원정보가 수정되었습니다.');
	}
})

function isPasswordValidation(password) {
	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*[\W_]).{8,}$/;
	return passwordRegex.test(password);
}

function isEmailValidation(email) {
	const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	return emailRegex.test(email);
}

function isPhoneNumberValidation(phoneNumber) {
	const phoneNumberRegex = /^(01[016789])-([0-9]{3,4})-([0-9]{4})$/;
	return phoneNumberRegex.test(phoneNumber);
}