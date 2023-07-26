$(document).ready(function(){
	$('.likeBtn').on('click', function(){
		$.ajax({
			url: "wishlist",
			type:"POST",
			data: {"member_code" : 50, "performance_code" : buttonId }
			
		})
	})
});
