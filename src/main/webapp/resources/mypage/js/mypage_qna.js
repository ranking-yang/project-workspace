$(document).ready(function(){
	$('.qnaPerformanceName').on('click', function(){
		
		if ($(this).data('category') !== "art") {
	    		location.href = '../product-detail?performance_code=' + $(this).data('pk');				
			} else {
				location.href = '../product-detail-ex?performance_code=' + $(this).data('pk');				
			}
		
	})
});