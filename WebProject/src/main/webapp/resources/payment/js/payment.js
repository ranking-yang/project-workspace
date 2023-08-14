const date = new Date();
const year = date.getFullYear();
const month = ('0' + (date.getMonth() + 1)).slice(-2);
const day = ('0' + date.getDate()).slice(-2);
const dateStr = `${year}-${month}-${day}`;
 
 $(document).ready(function() {
    $('#policy-refund-btn').click(function() {
      $('#policy-refund-txt').toggleClass('show');
    });

    $('#policy-clause-btn').click(function() {
      $('#policy-clause-txt').toggleClass('show');
    });
	
	// 결제하기 버튼 클릭 시 이벤트
    $('#payment-btn').click(function() {
      if ($('#payment-chk').prop('checked')) {
		  
		if ($('#payment-total-Price').text() == 0) {
			if (confirm("구매 하시겠습니까?")) {
				// 무료로 구매일 때 input 처리해야됨
			}
		} else {
      	  requestPay();			
		}
		
        
      } else {
        alert('환불규정, 주의사항, 약관에 동의하셔야 예매가 가능합니다');
      }
    });
 });

// 결제 진행 - ★ 회원인지 체크하는 것 필요
function requestPay() {	
    
    if (confirm("구매 하시겠습니까?")) {
	    IMP.request_pay({
	      pg: "kcp",
	      pay_method: "card",
	      merchant_uid: createOrderNum(), // 주문번호
	      name: $('#payment-ticketname').text(), // 상품명
	      amount: parseInt($('#payment-total-Price').text()), // 숫자 타입
	      // 구매자정보
	      buyer_email: "",
	      buyer_name: $('#user_name').text(),
	      buyer_tel: $('#user_ph').text(),
	      buyer_addr: "",
	    }, function (rsp) {
			console.log(rsp);
			
			if (rsp.success) {			

                $.ajax({
                    url: "/payment/verify_iamport/" + rsp.imp_uid,
                    method: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({
                        imp_uid: rsp.imp_uid,            // 결제 고유번호
                        merchant_uid: rsp.merchant_uid,   // 주문번호
                        amount: rsp.paid_amount
                    }),
                }).done(function (data) {
					
					if (parseInt($('#payment-total-Price').text()) == data.response.amount) {				
						// 서브밋으로 DB에 값 저장 후 결제 완료 페이지로 리턴 (주문 DB, 결제 DB, performance 좌석 수 마이너스)		     	     
				    	makePaymentDTO(rsp); // 결제 DTO 생성
				  		$("#payment_success_form").submit(); // 서브밋							
					} else {
                    	alert('결제 실패');
                    	// 결제 취소하는 곳으로 다시 보내야지
               		}					

                });
		     
		    } else {
		      alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
		    }	               
	   });
    }
}

function makePaymentDTO(rsp) {
	// 결제 완료 후, 결제 DTO 생성
	let payment_code = $('<input>', {
        type: 'hidden',
        name: 'payment_code',
        value: rsp.imp_uid
    });
    
    let payment_code_fk = $('<input>', {
        type: 'hidden',
        name: 'payment_code_fk',
        value: rsp.imp_uid
    });
    
    let related_coupon = $('<input>', {
        type: 'hidden',
        name: 'related_coupon',
        value: $('#member-coupon-code').val() // 쿠폰 번호
    });
    
     let payment_way = $('<input>', {
        type: 'hidden',
        name: 'payment_way',
        value: rsp.pay_method
    });
    
    let payment_date = $('<input>', {
        type: 'hidden',
        name: 'payment_date',
        value: dateStr
    });
    
    let total_price = $('<input>', {
        type: 'hidden',
        name: 'total_price',
        value: rsp.paid_amount
    });

    // 생성한 input 요소 폼 추가
    $("#payment_success_form").append(payment_code);
    $("#payment_success_form").append(payment_code_fk);
    $("#payment_success_form").append(related_coupon);
    $("#payment_success_form").append(payment_way);
    $("#payment_success_form").append(payment_date);
    $("#payment_success_form").append(total_price);
}

const couponBtn = document.getElementsByClassName('payment-chkcoupon-btn')[0];

couponBtn.addEventListener('click', () => {
	let options = 'top=300, left=660, height=900, width=600, location=no';
	window.open('/coupon/popup', '보유쿠폰', options);
})

function createOrderNum() {
	// 주문번호 임의로 만들기
    let today = new Date();   
    let hours = today.getHours(); // 시
    let minutes = today.getMinutes();  // 분
    let seconds = today.getSeconds();  // 초
    let milliseconds = today.getMilliseconds();
    let makeMerchantUid = hours +  minutes + seconds + milliseconds;
    
    return "IMP"+makeMerchantUid;
}



