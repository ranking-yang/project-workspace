/* 처음에 안내탭만 보이고 다른 탭은 안보이게 하기*/
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('content_1').style.display = 'block';
    document.getElementById('content_2').style.display = 'none';
    document.getElementById('content_3').style.display = 'none';
    document.getElementById('content_4').style.display = 'none';
    document.getElementById('content_5').style.display = 'none';
    /* 안내탭 펼쳐보기 후 사진 숨기기*/
    document.getElementById('main_img').style.display = 'none';
});

/* 최상단 안내 후기같은 탭버튼들 상호작용*/
function loadTab(divId, element) {
  var contentDivs = document.getElementsByClassName('contentstyle1')
  var tabListItems = document.getElementsByTagName('li');
  // 모든 <div> 요소를 숨김
  for (var i = 0; i < contentDivs.length; i++) {
    contentDivs[i].style.display = 'none';
  }
  
//모든 탭에 있는 "selected" 클래스를 제거
  for (var i = 0; i < tabListItems.length; i++) {
    tabListItems[i].classList.remove('selected');
  }

  // 선택한 탭에 "selected" 클래스를 추가
  element.parentNode.classList.add('selected');

  
  // 선택한 <div> 요소를 표시
  var selectedContentDiv = document.getElementById(divId);
  selectedContentDiv.style.display = 'block';
}

// 더보기 버튼 처리
function showFullReview(selected) {
  document.getElementById('text_' + selected).classList.add('show');
  document.getElementById('seemore_' + selected).setAttribute("style", "display: none;");
}

// 안내탭 펼쳐보기 버튼 누르면 펼쳐지는 함수
function showMoreDetailImage() {
  document.querySelector('.info_detail_btn').remove();
  document.querySelector('.info_detail_gradient').remove();
  document.querySelector('.info_detail_poster').setAttribute("style", `display:none;`);
  document.getElementById('main_img').style.display = 'block';
  document.querySelector('.main_img').scrollIntoView({ behavior: 'smooth', block: 'start' });
}

// 이미지 로드에 사용되는 함수
function getMeta(url) {
    const img = new Image();
    img.addEventListener("load", function() {
      sessionStorage.setItem('width', this.naturalWidth);
      sessionStorage.setItem('height', this.naturalHeight);
    });
    img.src = url;
}

//이미지 클릭시 이미지 크기가 커지고 작아지는 함수
function showOriginalRatio(selected) {
  let selectedImg = document.getElementsByClassName(selected);
  let viewMode = selectedImg[0].getAttribute('viewmode');
  let img_url = selectedImg[0].getAttribute('name');
  
    if (viewMode === 'off') {
      getMeta(img_url);
      setTimeout(() => {
        selectedImg[0].setAttribute('style', 'background-image: url('+ img_url +'); width: ' + sessionStorage.getItem('width') + 'px; height: '+ sessionStorage.getItem('height') + 'px;');
        selectedImg[0].setAttribute('viewMode', 'on');
        sessionStorage.clear();
      }, 50);
    } else if (viewMode === 'on') {
      setTimeout(() => {
        selectedImg[0].setAttribute('style', 'background-image: url('+ img_url +')');
        selectedImg[0].setAttribute('viewMode', 'off');
      }, 50);
    }
  }

// 후기탭에서 후기 작성하는 프로토 타입 함수
function submitForm() {
    var content_comment = document.getElementById("content_comment").value;

    // 새로운 리뷰를 추가하는 경우
    var reviewTextContainer = document.getElementById("review_text_container");
    var newReviewDiv = document.createElement("div");
    newReviewDiv.className = "review_text_area";
    newReviewDiv.innerText = content_comment;
    reviewTextContainer.appendChild(newReviewDiv);

    // 기존에 입력한 글 초기화
    document.getElementById("content_comment").value = "";
  }