 const ordersData = $('#myDiv').data('orders');
 
 $(document).ready(function() {
    $('#policy-refund-btn').click(function() {
      $('#policy-refund-txt').toggleClass('show');
    });

    $('#policy-clause-btn').click(function() {
      $('#policy-clause-txt').toggleClass('show');
    });
	
	// 결제하기 버튼
    $('#payment-btn').click(function() {
      if ($('#payment-chk').prop('checked')) {
        // 체크되었을 때의 동작
        requestPay();
        
      } else {
        alert('환불규정, 주의사항, 약관에 동의하셔야 예매가 가능합니다');
      }
    });
 });

// 결제 진행 - ★ 회원인지 체크하는 것 필요
function requestPay() {
	var IMP = window.IMP; 
    IMP.init(market); // 가맹점 식별코드
    
    // 주문번호 임의로 만들기
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    
    if (confirm("구매 하시겠습니까?")) {
	    IMP.request_pay({
	      pg: "kcp",
	      pay_method: "card",
	      merchant_uid: "IMP"+makeMerchantUid, // 주문번호
	      name: $('#payment-ticketname').text(), // 상품명
	      amount: parseInt($('#payment-total-Price').text()), // 숫자 타입
	      notice_url : '/payment/processed',
	      // 구매자정보
	      buyer_email: "",
	      buyer_name: "김도도",
	      buyer_tel: "010-4595-3498",
	      buyer_addr: "",
	    }, function (rsp) {			
		//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		
			if (rsp.success) {   
		     // 웹훅 연동은 일단 추후에 ... 
		     console.log(rsp);
		     
		     // Ajax로 DB에 값 저장 후 (주문 DB, 결제 DB, performance 좌석 수 마이너스)
		     
		     // 결제 완료 페이지로 리턴
		     
		     
		    } else {
		      alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
		    }	               
	   });
    }
}