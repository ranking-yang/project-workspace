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
        proceedPay();
        
      } else {
        alert('환불규정, 주의사항, 약관에 동의하셔야 예매가 가능합니다');
      }
    });
 });
 
 // ajax로 주문 번호 가져오기
function proceedPay(){
	$.ajax({
	  url: '/payment/proceed',
	  method: 'POST',
	  dataType: 'text',
	  success: function(data) {
		if (confirm("구매 하시겠습니까?")) {
	  	  requestPay(data); // data - 결제 고유 번호			
		}
	  },
	  error: function(xhr, status, error) {
	    // 요청이 실패했을 때 호출되는 콜백 함수
	    console.error('Error:', error);
	  }
	});
}

// 결제 진행 - 회원인지 체크하는 것 필요
function requestPay(order_id) {
	var IMP = window.IMP; 
    IMP.init(market); // 가맹점 식별코드
    
    // 주문번호 임의로 만들기
    var today = new Date();   
    var hours = today.getHours(); // 시
    var minutes = today.getMinutes();  // 분
    var seconds = today.getSeconds();  // 초
    var milliseconds = today.getMilliseconds();
    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
    
    IMP.request_pay({
      pg: "kcp",
      pay_method: "card",
      merchant_uid: "IMP"+makeMerchantUid, // 주문번호
      name: $('#payment-ticketname').text(), // 상품명
      amount: parseInt($('#payment-total-Price').text()), // 숫자 타입
      // 구매자정보
      buyer_email: "",
      buyer_name: "김도도", // 유저이름
      buyer_tel: "010-4595-3498",
      buyer_addr: "",
    }, function (rsp) {
	   // callback
      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
      
      if (rsp.success) {
        console.log(rsp);
      } else {
        console.log(rsp);
      }
                
    });	
}