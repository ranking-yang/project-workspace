$(document).ready(function() {
	// 화면이 로드될 때 가져온 val 값으로 select box 선택되어 있음
	let valName = $("#filter-select").data('val');	
	$("#filter-select").val(valName).prop("selected", true);
});

function filteringTicket() {	
	location.href = "../mypage/" + $("#filter-select").val();
}

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

function isSameDate (date1) {
  let date = new Date(date1);
  return date.getFullYear() === new Date().getFullYear()
     && date.getMonth() === new Date().getMonth()
     && date.getDate() === new Date().getDate();
}

function refundTicket(payment_code, end_date) {
	
	if (isSameDate(end_date)) {
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

function goToperformance(category, performance_code) {
		
	if (category !== "art") {
		location.href = '../product-detail?performance_code=' + performance_code;				
	} else {
		location.href = '../product-detail-ex?performance_code=' + performance_code;				
	}	

}