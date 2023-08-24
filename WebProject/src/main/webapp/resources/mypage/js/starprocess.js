// 별점기능
const stars = document.querySelectorAll(".star");
let lastClickedIndex = -1;

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

// 팝업창
var closePopup = false;
function showPopup() {
	var review_content = document.getElementById("writeNote").value.trim();
	var review_star = document.getElementById("review_star").value.trim();

	if(review_content === ''){
		alert("리뷰를 올바르게 작성해주세요");
	}else if(review_star ===''){
		alert("별점을 입력하세요");
	}else{
		alert("작성이 완료되었습니다!");
		document.getElementById("form").submit();
		closePopup = true;

	}	
}

function closedPopup(){
	if(closePopup){
		window.close();
	} else{
		
	}
}

function popup(){
	showPopup();
	//self.close(); // 이거 안됨
}