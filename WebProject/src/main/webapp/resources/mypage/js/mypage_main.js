$(document).ready(function() {
	
  /* 버튼 클릭 시, 색 변경 */
  $(".mypage_menu_btn").click(function(event) {
    let clicked = $(event.target); 
   	
   	let className = $(this).data("classname"); 	
   
    
    if (clicked.hasClass("clicked")) {
      clicked.removeClass("clicked");
    } else {
      $(".mypage_menu_btn").removeClass("clicked");
      clicked.addClass("clicked");
    }
    
    location.href = '../mypage?className=' + className;   

    
  });
});