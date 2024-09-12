

// 부모창에서 받아오는 요소들
const email = $('#email', window.opener.document).val();

const checkBtn = $('#btn');
const retryBtn = $('#re-try');

let emailCode = null;

$(document).ready(function() {
	$.ajax({
		type: 'post',
		url: '/mypage/rest/verify-code',
		data: JSON.stringify({email: email}),
		contentType: 'application/json',
		success: function(data){
			emailCode = data;
			
		}
	})
});

checkBtn.click(function() {
	if($('#verify-code').val() == emailCode) {
		$('#verified-email', window.opener.document).val('true');
		$('#email', window.opener.document).attr('readonly', true);
		self.close();
	} else {
		$('#text').text('인증코드가 다릅니다.');
	}
})

retryBtn.click(function() {
	
	$('#text').text('인증코드가 재전송되었습니다.');
	$.ajax({
		type: 'post',
		url: '/mypage/rest/verify-retry',
		data: JSON.stringify({email: email}),
		contentType: 'application/json',
		success: function(data){
			emailCode = data;
		}
		
	});
	
});
