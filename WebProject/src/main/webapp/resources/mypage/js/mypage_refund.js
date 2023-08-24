$(document).ready(function() {
			
	$('.mypage_menu_btn').eq(3).addClass('clicked');		
			
});
		
function goToDetail(payment_code) {	
	
	let detailForm = $('<form></form>').attr({
	  'id': 'Detailform',
	  'action': '/mypage/refund/detail',
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
    }
	});
}