

function toggleLike(event, buttonId) {
    event.stopPropagation();
    var button = document.getElementById(buttonId);
    button.classList.toggle('liked');

    var icon = button.querySelector('i.fa-heart');
    if (button.classList.contains('liked')) {
      icon.classList.add('fa-solid');
      icon.classList.remove('fa-regular');
      icon.style.color = '#e41b1b';
      const likes = [];
      likes.push(button.dataset.like);
      console.log(likes);
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
	    	location.href = '/product/product-detail?performance_code=' + product.dataset.pk;
	 });
 });
 