// 별점기능
const stars = document.querySelectorAll(".star");
let lastClickedIndex = -1;

/*stars.forEach((star, index) => {
  star.addEventListener("click", () => {
    const clickedIndex = index;
    
    if (clickedIndex === lastClickedIndex) {
      stars.forEach(s => {
        s.setAttribute("src", "../../../resources/mypage/img/gray_star.png");
        s.classList.add("gray");
        s.classList.remove("yellow");
      });
      lastClickedIndex = -1;
    } else {
      stars.forEach((s, i) => {
        if (i <= clickedIndex) {
          s.setAttribute("src", "../../../resources/mypage/img/yellow_star.png");
          s.classList.add("yellow");
          s.classList.remove("gray");
        } else {
          s.setAttribute("src", "../../../resources/mypage/img/gray_star.png");
          s.classList.add("gray");
          s.classList.remove("yellow");
        }
      });
      lastClickedIndex = clickedIndex;
    }
  });
});
*/
function setRating(rating) {
    const hiddenInput = document.querySelector("input[name='review_star']");
    hiddenInput.value = rating;

    const stars = document.querySelectorAll(".star");
    stars.forEach((star, index) => {
      if (index < rating) {
        star.setAttribute("src", "../../../resources/mypage/img/yellow_star.png");
        star.classList.add("yellow");
        star.classList.remove("gray");
      } else {
        star.setAttribute("src", "../../../resources/mypage/img/gray_star.png");
        star.classList.add("gray");
        star.classList.remove("yellow");
      }
    });
  }

// 이미지 첨부기능
function previewImage() {
  var imageInput = document.getElementById('imageInput');
  var imagePreview = document.getElementById('imagePreview');

  if (imageInput.files && imageInput.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
          var img = document.createElement('img');
          img.src = e.target.result;
          img.style.maxWidth = '200px';
          img.style.maxHeight = '200px';
          imagePreview.innerHTML = '';
          imagePreview.appendChild(img);
      };

      reader.readAsDataURL(imageInput.files[0]);
  }
}
// 팝업창
var closePopup = false;
function showPopup() {
	var review_content = document.getElementById("writeNote").value.trim();
	var review_star = document.getElementById("review_star").value.trim();
	console.log("되니?");
	console.log(review_content);
	if(review_content === ''){
		alert("리뷰를 올바르게 작성해주세요");
	}else if(review_star ===''){
		alert("별점을 입력하세요");
	}else{
		alert("작성이 완료되었습니다!");
		document.getElementById("form").submit();
		closePopup = true;
		console.log(closePopup);
	}
	
}

function closedPopup(){
	if(closePopup){
		window.close();
	}else{
		
	}
}

function popup(){
	showPopup();
		
}