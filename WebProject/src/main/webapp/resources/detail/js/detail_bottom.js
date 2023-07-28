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
        selectedImg[0].setAttribute('viewmode', 'on');
        sessionStorage.clear();
      }, 50);
    } else if (viewMode === 'on') {
      setTimeout(() => {
        selectedImg[0].setAttribute('style', 'background-image: url('+ img_url +')');
        selectedImg[0].setAttribute('viewmode', 'off');
      }, 50);
    }
  }

let reviewIdCounter = 0; // 리뷰 ID 카운터 변수

function submitForm() {
  var content_comment = document.getElementById("content_comment").value;
  var star_rating = parseFloat(document.getElementById("star_rating").value);
  var image_upload = document.getElementById("image_upload").files[0]; // 첨부한 이미지 파일 가져오기
	
  // 별점이 0.5부터 5 사이가 아니라면 입력을 강제로 요구
  if (star_rating < 0.5 || star_rating > 5) {
    alert("별점은 0.5부터 5까지 입력해주세요.");
    return false;
  }
  
  // 리뷰 내용을 입력하지 않았다면 글이 써지지 않게 함
  if (!content_comment.trim()) {
    alert("리뷰 내용을 입력해주세요.");
    return false;
  }
	
  // 새로운 리뷰를 추가하는 경우
  var reviewTextContainer = document.getElementById("review_text_container");
  var newReviewDiv = document.createElement("div");
  reviewIdCounter++; // 리뷰 ID 카운터 증가
  var reviewId = String(reviewIdCounter).padStart(6, '0'); // 리뷰 ID 생성 (6자리 숫자)

  newReviewDiv.className = "review_wrap user_review_" + reviewId; // 리뷰 래핑 요소 클래스에 리뷰 ID 추가

  // 리뷰 타이틀과 리뷰 텍스트를 변수에 묶어서 생성
  var reviewTitle = `
    <div class="review_title">
      <div class="review_title_left">
        <div class="review_title_left_stars">
          <div class="review_title_left_star">
            <div class="review_title_left_star_filled" style="width: calc(${star_rating} * 19px);"></div>
          </div>
        </div>
        <div class="review_title_left_name" style="padding-left: 10px;">
          박정준
        </div>
      </div>
      <div class="review_title_right" style="padding-right:8px;">
        ${getCurrentDate()} <!-- 현재 날짜 함수를 호출하여 리뷰 작성일 표시 -->
      </div>
    </div>`;

  var reviewText = `
    <div class="review_text_area" id="text_${reviewId}">
      ${content_comment} <!-- 작성한 리뷰 내용 -->
      <br>
      <div class="review_text_seemore" id="seemore_${reviewId}" onclick="showFullReview('${reviewId}')"> <!-- 리뷰 ID 전달 -->
        ... 더보기
      </div>
    </div>
    <br>
    <div style="margin-top: 10px;">
      <div class="img_label ${reviewId}" viewmode="off" style="background-image: url('/resources/common/image/question-mark.png')" name="" onclick="showOriginalRatio('${reviewId}')"> <!-- 리뷰 ID 전달 -->
      </div>
    </div>`;

  // 리뷰 래핑 요소에 리뷰 타이틀과 리뷰 텍스트 추가
  newReviewDiv.innerHTML = `
    ${reviewTitle}
    <div class="review_text">
      ${reviewText}
    </div>
  `;

  // 이미지 첨부된 경우 이미지 요소 추가
  if (image_upload) {
    var imageURL = URL.createObjectURL(image_upload);
    newReviewDiv.querySelector(".img_label").setAttribute("style", `background-image: url(${imageURL})`);
    newReviewDiv.querySelector(".img_label").setAttribute("name", imageURL);
  }

  // 생성된 리뷰 래핑 요소를 리뷰 텍스트 컨테이너에 추가
  reviewTextContainer.appendChild(newReviewDiv);
	
  // 새로운 리뷰를 리뷰 텍스트 컨테이너의 맨 위에 추가
  var firstReview = reviewTextContainer.firstChild;
  reviewTextContainer.insertBefore(newReviewDiv, firstReview);	
	
  // 기존에 입력한 내용 초기화
  document.getElementById("content_comment").value = "";
  document.getElementById("star_rating").value = "0";
  document.getElementById("image_upload").value = "";
  
  return true; // 정상적으로 리뷰가 추가되었음을 반환
}

    // 현재 날짜를 반환하는 함수
    function getCurrentDate() {
      var today = new Date();
      var year = today.getFullYear();
      var month = String(today.getMonth() + 1).padStart(2, "0");
      var date = String(today.getDate()).padStart(2, "0");
      return `${year}-${month}-${date}`;
    }

// Q&A에서 문의사항 작성하는 프로토 타입 함수
function submitForm2() {
    var content_comment = document.getElementById("content_comment2").value;

    // 새로운 리뷰를 추가하는 경우
    var reviewTextContainer = document.getElementById("Q&A_text_container");
    var newReviewDiv = document.createElement("div");
    newReviewDiv.className = "Q&A_text_area";
    newReviewDiv.innerText = content_comment;
    reviewTextContainer.appendChild(newReviewDiv);

    // 기존에 입력한 글 초기화
    document.getElementById("content_comment").value = "";
  }