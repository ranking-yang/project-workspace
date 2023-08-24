const idinput = document.getElementById('user-id');
const idspan = document.getElementById('findpw-id-span');
const nameinput = document.getElementById('user-name');
const namespan = document.getElementById('findpw-name-span');
const birthinput = document.getElementById('user-birth-date');
const birthspan = document.getElementById('findpw-birth-span');
const phoneinput = document.getElementById('user-hphone');
const phonespan = document.getElementById('findpw-phone-span');


idinput.addEventListener("input",() =>{
	if (idinput.value === '') {
		idspan.textContent = '';
	} else if (!isIdValidation(idinput.value)) {
		idspan.textContent = '아이디는 4~20자의 영문, 숫자, 특수기호(_)(-)만 사용가능합니다.';
		idspan.style.color = 'palevioletred';
	} else {
		idspan.textContent = '사용가능한 아이디 형식입니다.';
		idspan.style.color = '#46c8b4';
	}
});
nameinput.addEventListener("input",() =>{
	if (nameinput.value === '') {
		namespan.textContent = '';
	} else if (!isNameValidation(nameinput.value)) {
		namespan.textContent = '이름은 한글만 가능합니다.';
		namespan.style.color = 'palevioletred';
	} else {
		namespan.textContent = '사용가능한 이름 형식입니다.';
		namespan.style.color = '#46c8b4';
	}
});

birthinput.addEventListener("input",() =>{
	if (birthinput.value === '') {
		birthspan.textContent = '';
	} else if (!isBirthValidation(birthinput.value)) {
		birthspan.textContent = '생년월일은 년월일 6자리만 입력해주세요.';
		birthspan.style.color = 'palevioletred';
	} else {
		birthspan.textContent = '맞는 생년월일 형식입니다.';
		birthspan.style.color = '#46c8b4';
	}
});

if (phoneinput != null) {
	phoneinput.addEventListener('input', () => {
		if (phoneinput.value === '') {
			phonespan.textContent = '';
		} else if (!isPhoneNumberValidation(phoneinput.value)) {
			phonespan.textContent = "휴대폰 번호는 '-' 빼고 13자리를 입력해주세요.";
			phonespan.style.color = 'palevioletred';
		} else {
			phonespan.textContent = '사용가능한 전화번호 형식입니다.';
			phonespan.style.color = '#46c8b4';
		}
	})
}



function isPhoneNumberValidation(phoneNumber) {
	const phoneNumberRegex = /^(01[016789])([0-9]{3,4})([0-9]{4})$/;
	return phoneNumberRegex.test(phoneNumber);
}

function isIdValidation(id){
	const idRegex = /^[a-zA-Z]{1}[a-zA-Z0-9_-]{4,20}$/;
	return idRegex.test(id);
}
function isNameValidation(name){
	const nameRegex = /^[가-힣]{2,20}$/;
	return nameRegex.test(name);
}
function isBirthValidation(birth){
	const birthRegex = /^\d{2}\d{2}\d{2}$/;
	return birthRegex.test(birth);
}