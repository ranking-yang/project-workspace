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

function goToperformance(category, performance_code) {
	// 끝나는 날짜 체크해서 종료된거면 alert
	$.ajax({
    url: "/mypage/checkDate",      
    type: "POST",         
    data: {              
        performance_code: performance_code
    },
    success: function(date) {
		const today = new Date();
		const endDate = new Date(date);
		
        if (endDate >= today) {
			if (category !== "art") {
				location.href = '../product-detail?performance_code=' + performance_code;				
			} else {
				location.href = '../product-detail-ex?performance_code=' + performance_code;				
			}
		} else {
			alert('판매 기간이 종료된 상품입니다.');
		}
    },
    error: function(xhr, status, error) {
        // 요청이 실패했을 때 실행되는 콜백 함수
        console.error("Error:", error);
    }
});
	

}

/*function goToReviewWriting(){
	console.log("실행되니?");
	window.open('../../WEB-INF/view/mypage/reviewWriting.jsp', 'reviewWriting', 'width=600,height=700,resizable=yes,scrollbars=yes');
}*/
