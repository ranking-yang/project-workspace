<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main coupon-main">
	<div id="coupon-sub-bar">
		<h1 id="coupon-title">쿠폰</h1>
		<button id="coupon-add-btn">쿠폰생성</button>
	</div>
	<div id="coupon-container"></div>
	<div id="coupon-ask"></div>
</div>
<script type="text/javascript">
	/* 처음에 쿠폰목록 불러오는 로직 */
	$(function() {
		$.ajax({
			type: 'GET',
			url: '/admin/coupon/get-all-list',
			success: function(data) {
				$('#coupon-container')
					.append('<div class="coupon-headers">쿠폰코드</div>'
							+ '<div class="coupon-headers">쿠폰이름</div>'
							+ '<div class="coupon-headers">할인율/할인금액</div>'
							+ '<div class="coupon-headers">쿠폰수량</div>'
							+ '<div class="coupon-headers">삭제</div>'
							+ '<div class="coupon-headers">수정</div>');
				for (let i = 0; i < data.length; ++i) {
					let noLimit = data[i]['coupon_qty'] == null ? '제한없음' : data[i]['coupon_qty'];
					
					if (data[i]['discount_money'] != null) {
						$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + data[i]['discount_money'] + '원</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
					} else {
						let rate = data[i]['discount_rate'] * 100;
						
						$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + Math.floor(rate) + '%</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
					}
				}
			}
		});
	});
	/* 쿠폰 생성창 */
	$('#coupon-add-btn').click(function() {
		$('#coupon-ask').empty();
		$('#coupon-container').css('display', 'none');
		$('#coupon-ask').css({'display':'grid', 'grid-template-columns':'3fr 2fr 2fr 1fr'});
		$('#coupon-ask')
			.append('<div class="coupon-headers">쿠폰이름</div>'
					+ '<div class="coupon-headers">할인율/할인금액</div>'
					+ '<div class="coupon-headers">쿠폰수량</div>'
					+ '<div class="coupon-headers">추가</div>'
					+ '<div class="input-elements"><input type="text" id="name" name="coupon_name" form="form"/></div>'
					+ '<div class="input-elements"><input type="text" id="discount" name="discount" form="form" placeholder="%을 붙이면 할인율로 적용/그냥 숫자는 할인금액"/></div>'
					+ '<div class="input-elements"><input type="text" id="qty" name="coupon_qty" form="form" placeholder="수량제한이 없으면 -제한없음- 적으면 됌"/></div>'
					+ '<div class="input-elements"><input type="button" id="coupon-submit" onclick="addCoupon(event);" value="추가" form="form"/></div>'
					+ '<form method="GET" id="form"></form>');
		
	});
	/* 쿠폰 추가 로직 */
	function addCoupon(e) {
		if ($('#name').val() == '' || $('#discount').val() == '' || $('#qty').val() == '') {
			e.preventDefault();
			alert('값을 채워주세요');
		} else {
		
			var formData = $("#form").serialize();
		
	        $.ajax({
	            url : "/admin/coupon/add",
	            type : 'GET', 
	            data : formData, 
	            success: function(data) {
	            	$('#coupon-container').empty();
	            	$('#coupon-ask').css('display', 'none');
	        		$('#coupon-container').css({'display':'grid', 'grid-template-columns':'1fr 3fr 2fr 1fr 1fr 1fr'});
	        		
	        		
	        		$('#coupon-container')
					.append('<div class="coupon-headers">쿠폰코드</div>'
							+ '<div class="coupon-headers">쿠폰이름</div>'
							+ '<div class="coupon-headers">할인율/할인금액</div>'
							+ '<div class="coupon-headers">쿠폰수량</div>'
							+ '<div class="coupon-headers">삭제</div>'
							+ '<div class="coupon-headers">수정</div>');
					for (let i = 0; i < data.length; ++i) {
						let noLimit = data[i]['coupon_qty'] == null ? '제한없음' : data[i]['coupon_qty'];
						
						if (data[i]['discount_money'] != null) {
							$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + data[i]['discount_money'] + '원</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
						} else {
							let rate = data[i]['discount_rate'] * 100;
							
							$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + Math.floor(rate) + '%</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
						}
					}
				
				}
	        });
		}
	}
	/*삭제 로직*/
	$(document).on('click', '.delete-btn', function(e) {
		let code = $(e.target).data('code');
		let couponCode = $('.' + code + '.code').text();
		
		if(confirm('정말로 삭제하시겠습니까?') == true)  {
		
			$.ajax ({
				type: 'GET',
				url: '/admin/coupon/delete',
				data: {coupon_code: couponCode},
				success: function(data) {
					$('#coupon-container').empty();
	            	$('#coupon-ask').css('display', 'none');
	        		$('#coupon-container').css({'display':'grid', 'grid-template-columns':'1fr 3fr 2fr 1fr 1fr 1fr'});
	        		
	        		
	        		$('#coupon-container')
					.append('<div class="coupon-headers">쿠폰코드</div>'
							+ '<div class="coupon-headers">쿠폰이름</div>'
							+ '<div class="coupon-headers">할인율/할인금액</div>'
							+ '<div class="coupon-headers">쿠폰수량</div>'
							+ '<div class="coupon-headers">삭제</div>'
							+ '<div class="coupon-headers">수정</div>');
					for (let i = 0; i < data.length; ++i) {
						let noLimit = data[i]['coupon_qty'] == null ? '제한없음' : data[i]['coupon_qty'];
						
						if (data[i]['discount_money'] != null) {
							$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + data[i]['discount_money'] + '원</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
						} else {
							let rate = data[i]['discount_rate'] * 100;
							
							$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + Math.floor(rate) + '%</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
						}
					}
				}
			});
		}

	});
	/*수정 로직*/
	$(document).on('click', '.update-btn', function(e) {
		let code = $(e.target).data('code');
		let couponCode = $('.' + code + '.code').text();
		let couponName = $('.' + code + '.name').text();
		let couponDiscount = $('.' + code + '.discount').text();
		let couponQty = $('.' + code + '.qty').text();
		
		$('#coupon-ask').empty();
		$('#coupon-container').css('display', 'none');
		$('#coupon-ask').css({'display':'grid', 'grid-template-columns':'3fr 2fr 2fr 1fr'});
		$('#coupon-ask')
			.append('<div class="coupon-headers">쿠폰이름</div>'
					+ '<div class="coupon-headers">할인율/할인금액</div>'
					+ '<div class="coupon-headers">쿠폰수량</div>'
					+ '<div class="coupon-headers">수정</div>'
					+ '<div class="input-elements"><input type="text" name="coupon_name" value="' + couponName + '" form="form"/></div>'
					+ '<div class="input-elements"><input type="text" name="discount" value="' + couponDiscount + '" form="form" placeholder="%을 붙이면 할인율로 적용/그냥 숫자는 할인금액"/></div>'
					+ '<div class="input-elements"><input type="text" name="coupon_qty" value="' + couponQty + '" form="form" placeholder="수량제한이 없으면 -제한없음- 적으면 됌"/></div>'
					+ '<div class="input-elements"><input type="button" id="coupon-submit" onclick="updateCoupon(event);" value="수정" form="form"/></div>'
					+ '<input type="hidden" name="coupon_code" value="' + couponCode + '" form="form"/>'
					+ '<form method="GET" id="form"></form>');
		
	});
	
	/* 쿠폰 수정 로직*/
	function updateCoupon(e) {
		if ($('#name').val() == '' || $('#discount').val() == '' || $('#qty').val() == '') {
			e.preventDefault();
			alert('값을 채워주세요');
		} else {
		
			var formData = $("#form").serialize();
	
	        $.ajax({
	            url : "/admin/coupon/update",
	            type : 'GET', 
	            data : formData, 
	            success: function(data) {
	            	$('#coupon-container').empty();
	            	$('#coupon-ask').css('display', 'none');
	        		$('#coupon-container').css({'display':'grid', 'grid-template-columns':'1fr 3fr 2fr 1fr 1fr 1fr'});
	        		
	        		
	        		$('#coupon-container')
					.append('<div class="coupon-headers">쿠폰코드</div>'
							+ '<div class="coupon-headers">쿠폰이름</div>'
							+ '<div class="coupon-headers">할인율/할인금액</div>'
							+ '<div class="coupon-headers">쿠폰수량</div>'
							+ '<div class="coupon-headers">삭제</div>'
							+ '<div class="coupon-headers">수정</div>');
					for (let i = 0; i < data.length; ++i) {
						let noLimit = data[i]['coupon_qty'] == null ? '제한없음' : data[i]['coupon_qty'];
						
						if (data[i]['discount_money'] != null) {
							$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + data[i]['discount_money'] + '원</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
						} else {
							let rate = data[i]['discount_rate'] * 100;
							
							$('#coupon-container')
							.append('<div class="coupon-elements code ' + i + '">' + data[i]['coupon_code'] + '</div>'
									+ '<div class="coupon-elements name ' + i + '">' + data[i]['coupon_name'] + '</div>'
									+ '<div class="coupon-elements discount ' + i + '">' + Math.floor(rate) + '%</div>'
									+ '<div class="coupon-elements qty ' + i + '">' + noLimit + '</div>'
									+ '<button class="coupon-btn delete-btn ' + i + '" data-code="' + i + '">삭제</button>'
									+ '<button class="coupon-btn update-btn ' + i + '" data-code="' + i + '">수정</button>');
						}
					}
				
				}
	        });
		}
	}
</script>