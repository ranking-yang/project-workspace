function toggleLike(event, buttonId, member_code) {
    event.stopPropagation();

    let $button = $('#'+buttonId);
    $button.toggleClass('liked');
    
    let $icon = $button.find('i.fa-heart');
    
    if ($button.hasClass('liked')) {
      $icon.removeClass('fa-regular').addClass('fa-solid').css('color','#e41b1b');

      $.ajax({
			url: "../addwishlist",
			type:"POST",
			data: {
				member_code: member_code,
				performance_code : buttonId 
				},
			success: function (response) {
            // 서버로부터의 성공 응답 처리 (필요한 경우)
            }
		});
	} else {
      $icon.removeClass('fa-solid').addClass('fa-regular').css('color','#000000');
      $.ajax({
		  url : "../delewishlist",
		  type: "POST",
		  data: {
			 	member_code: member_code,
				performance_code : buttonId 
				},
		  success: function (response) {
            // 서버로부터의 성공 응답 처리 (필요한 경우)
           
           }
	  });
    }
  };
 $(document).ready(function(){
	$('.wish_product').on('click', function(){
		
		
		if ($(this).data('category') !== "art") {
	    		location.href = '../product-detail?performance_code=' + $(this).data('pk');				
			} else {
				location.href = '../product-detail-ex?performance_code=' + $(this).data('pk');				
			}
		
	})
});
 $('.wish_price').each(function(){ // 가격 표시 , 세자리마다 콤마 찍기
	var price = $(this).text();
	let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	$(this).html(result);
});