const nameinput = document.getElementById('user-name');
const namespan = document.getElementById('findid-name-span');
const birthinput = document.getElementById('user-birth-date');
const birthspan = document.getElementById('findid-birth-span');
const phoneinput = document.getElementById('user-hphone');
const phonespan = document.getElementById('findid-phone-span');

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

function isNameValidation(name){
	const nameRegex = /^[가-힣]{2,20}$/;
	return nameRegex.test(name);
}
function isBirthValidation(birth){
	const birthRegex = /^\d{2}\d{2}\d{2}$/;
	return birthRegex.test(birth);
}