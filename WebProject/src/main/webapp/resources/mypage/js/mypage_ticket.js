function goToDetail(payment_code) {	
	let detailForm = $('<form></form>').attr({
	  'id': 'Detailform',
	  'action': '/mypage/ticket/detail',
	  'method': 'post'
	});
	
	let payment_code_input = $('<input></input>').attr({
	  'type': 'hidden',
	  'name': 'payment_code',
	  'value' : payment_code
	});
	
	detailForm.append(payment_code_input);
	$(document.body).append(detailForm);
	
	detailForm.submit();
}

function refundTicket(payment_code, end_date) {
	const today = new Date();
	const endDate = new Date(end_date);
	
	if (endDate == today) {
		alert('관람 당일은 환불이 불가합니다.');
	} else {
		// 서브밋으로 다음 페이지로 보내기
		let refundForm = $('<form></form>').attr({
		 'id': 'Detailform',
		  'action': '/mypage/ticket/refund',
		  'method': 'post'
		});
		
		let payment_code_input = $('<input></input>').attr({
		  'type': 'hidden',
		  'name': 'payment_code',
		  'value' : payment_code
		});
	
		refundForm.append(payment_code_input);
		$(document.body).append(refundForm);
		
		refundForm.submit();		
	}

}