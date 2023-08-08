function goToDetail(payment_code) {	
	let Detailform = $('<form></form>').attr({
	  'id': 'Detailform',
	  'action': '/mypage/ticket/detail',
	  'method': 'post'
	});
	
	let payment_code_input = $('<input></input>').attr({
	  'type': 'hidden',
	  'name': 'payment_code',
	  'value' : payment_code
	});
	
	Detailform.append(payment_code_input);
	$(document.body).append(Detailform);
	
	Detailform.submit();
}