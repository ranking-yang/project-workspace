function toggleLike(event, buttonId, member_code) {
    event.stopPropagation();

    let $button = $('#'+buttonId);
    $button.toggleClass('liked');
    
    let $icon = $button.find('i.fa-heart');
    
    if ($button.hasClass('liked')) {
      $icon.removeClass('fa-regular').addClass('fa-solid').css('color','#e41b1b');
      console.log("button",$button.attr('id'));

      $.ajax({
			url: "../addwishlist",
			type:"POST",
			data: {
				member_code: member_code,
				performance_code : buttonId 
				},
			success: function (response) {
            // 서버로부터의 성공 응답 처리 (필요한 경우)
            console.log("찜 추가 성공:", response);
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
           console.log("찜 삭제 성공:", response);
           }
	  });
    }
  };

$(document).ready(function(){
    let urlParams = new URLSearchParams(window.location.search);
    let areaCode = urlParams.get('area_code');
    let mainCategory = urlParams.get('main_category');
    let sortCode = urlParams.get('sort_code');

    function redirectToDetailPage(performanceCode, category) {
        let detailPageUrl = `../product-detail${category === "art" ? "-ex" : ""}`;
        location.href = `${detailPageUrl}?performance_code=${performanceCode}`;
    }

    $('.product-module').on('click', function(){
        let performanceCode = $(this).data('pk');
        let category = $(this).data('category');

        redirectToDetailPage(performanceCode, category);
        
    });

    if (areaCode) {
        $('.areaBtn[data-area="' + areaCode + '"]').addClass('selected');
    }
    

    $('.areaBtn').on('click', function(){
        let area = $(this).data('area');
        if(sortCode){
        	location.href = `../product/area?area_code=${area}&sort_code=${sortCode}&main_category=${mainCategory}`;	
		}else{
        	location.href = `../product/area?area_code=${area}&main_category=${mainCategory}`;
		}
    });
    
    if(sortCode) {
		$('.filter[data-sort="' + sortCode+ '"]').addClass('selected');
	}
	
	$('.filter').on('click', function(){
		let sort = $(this).data('sort');
		if(areaCode){
			location.href = `../product/sort?sort_code=${sort}&area_code=${areaCode}&main_category=${mainCategory}`;
		}else{
			location.href = `../product/sort?sort_code=${sort}&main_category=${mainCategory}`;
		}
	});
});



$('.price').each(function(){ // 가격 표시 , 세자리마다 콤마 찍기
		  var price = $(this).text();
		  let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		  $(this).html(result);
	});