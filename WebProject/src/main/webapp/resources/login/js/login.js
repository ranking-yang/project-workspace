
const naverBtn = document.getElementById('naver-login-btn');
const kakaoBtn = document.getElementById('kakao-login-btn');

naverBtn.addEventListener('click', () => {
	location.href = '/auth/naver/login';
})

kakaoBtn.addEventListener('click', () => {
	location.href = '/auth/kakao/login';
})
