/**
 * 
 */

function toggleLike(event, buttonId) {
    event.stopPropagation();
    var button = document.getElementById(buttonId);
    button.classList.toggle('liked');

    var icon = button.querySelector('i.fa-heart');
    if (button.classList.contains('liked')) {
      icon.classList.add('fa-solid');
      icon.classList.remove('fa-regular');
      icon.style.color = '#e41b1b';
      console.log("button",button.id);
      // 추후에 버튼아이디로 찜목록 테이블에 저장
    } else {
      icon.classList.remove('fa-solid');
      icon.classList.add('fa-regular');
      icon.style.color = '#000000';
    }
  }
  
const products = document.querySelectorAll('.product-module');
	products.forEach(product => {
		product.addEventListener('click', (e) => {
	    	console.log(product.dataset.pk);
	    	location.href = '../product/product-detail?performance_code=' + product.dataset.pk;
	 });
 });
 