const policy_refundBtn = document.getElementById('policy-refund-btn');
const policy_clauseBtn = document.getElementById('policy-clause-btn');
const paymentBtn = document.querySelector('#payment-btn');
const paymentChk = document.querySelector('#payment-chk');

policy_refundBtn.addEventListener('click', (e) => {
    document.getElementById('policy-refund-txt').classList.toggle('show');
});

policy_clauseBtn.addEventListener('click', (e) => {
    document.getElementById('policy-clause-txt').classList.toggle('show');
});

paymentBtn.addEventListener('click', (e) => {
	if (paymentChk.checked) {
		
  				
  		
	} else {
		alert('환불규정, 주의사항, 약관에 동의하셔야 예매가 가능합니다');
	}
});

