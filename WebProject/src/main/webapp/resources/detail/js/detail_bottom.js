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
  document.querySelector('.main_img').scrollIntoView({block: 'start' });
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

// 댓글이 등록될 때마다 숫자를 업데이트하는 함수
function updateReviewCount1() {
  var reviewCount = document.querySelectorAll(".review_wrap").length;
  var reviewCountSpan = document.getElementById("reviewCount");
  if (reviewCountSpan) {
    reviewCountSpan.innerText = "(" + reviewCount + ")";
  }
}

// 댓글이 등록될 때마다 명수를 업데이트하는 함수
function updateReviewCountpeople() {
  var reviewCount = document.querySelectorAll(".review_wrap").length;
  var reviewCountSpan = document.getElementById("reviewCountpeople");
  if (reviewCountSpan) {
    reviewCountSpan.innerText = "(" + reviewCount + "명)";
  }
}

let reviewIdCounter = 0; // 리뷰 ID 카운터 변수

var reviewCount = 0; // 총 댓글 수
var totalRating = 0; // 댓글들의 별점 합계

function submitForm() {
  var content_comment = document.getElementById("content_comment").value;
  var image_upload = document.getElementById("image_upload").files[0]; // 첨부한 이미지 파일 가져오기
  var star_rating = parseFloat(document.getElementById("star_rating").value);
  // 별점이 1부터 5 사이가 아니라면 입력을 강제로 요구
  if (star_rating < 1 || star_rating > 5) {
    alert("별점은 0.5부터 5까지 입력해주세요.");
    return false;
  }else if(star_rating % 1 !=0){
	  alert("별점은 1단위로 입력할 수 있습니다.")
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
  // 리뷰 내용의 최대 길이를 설정
  var maxReviewLength = 300; // 원하는 최대 길이로 설정
  
  var seeMoreLink = `
    <div class="review_text_seemore" id="seemore_${reviewId}" onclick="showFullReview('${reviewId}')">
      ... 더보기
    </div>
  `;
  
  if (content_comment.length <= maxReviewLength) {
  	  seeMoreLink = ""; // 최대 길이보다 작으면 "더보기" 링크를 숨김
  }
  // 리뷰 타이틀과 리뷰 텍스트를 변수에 묶어서 생성
  var reviewTitle = `
    <div class="review_title">
      <div class="review_title_left">
        <div class="review_title_left_stars">
          <div class="review_title_left_star">
            <div class="review_title_left_star_filled star${star_rating}" style="width: calc(${star_rating} * 19px);"></div>
          </div>
        </div>
        <div class="review_title_left_name" style="padding-left: 10px;">
          ${userId}
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
      ${seeMoreLink}
    </div>
    <br>
    <div style="margin-top: 10px;">
      <div class="img_label ${reviewId}" viewmode="off" style="background-image: url('/resources/common/image/question-mark.png')" name="/resources/common/image/question-mark.png" onclick="showOriginalRatio('${reviewId}')"> <!-- 리뷰 ID 전달 -->
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
  
  // (새 리뷰가 추가되었으므로) 후기 숫자 업데이트
  updateReviewCount1();
  updateReviewCountpeople();
  
  // 새로운 리뷰의 별점을 totalRating에 더함
  totalRating += star_rating;
  // 새로운 리뷰를 등록했으므로 reviewCount를 증가시킴
  reviewCount++;
  
  // 새로운 리뷰를 추가했으므로 progress bar 업데이트
  updateProgressBars();
  // 평균 계산
  var averageRating = totalRating / reviewCount;

  // 평균 별점을 화면에 표시
  var averageElement = document.querySelector(".score_section_left_average");
  averageElement.textContent = averageRating.toFixed(1); // 소수점 한 자리까지 표시
  
  // .score_section_left_star_filled 요소의 width 속성에 averageRating 값을 적용
  var filledStarElement = document.querySelector('.score_section_left_star_filled');
  filledStarElement.style.width = `calc(${averageRating} * 24px)`;
  
  
  
  return true; // 정상적으로 리뷰가 추가되었음을 반환
}

// 리뷰를 추가할 때마다 점수에 해당하는 바의 비율 업데이트
function updateProgressBars() {
  var totalReviews = document.querySelectorAll(".review_wrap").length; // 전체 리뷰 개수
  var progressBars = document.querySelectorAll('.progress_section_value');

  var totalRatingsSum = 0; // 모든 별점 바의 비율 합계

  // 모든 별점 바의 비율 합계를 계산
  for (var i = 1; i <= 5; i++) {
    var ratingRatio = getTotalRatingsForRating(i);
    totalRatingsSum += ratingRatio;
  }

  // 모든 별점 바의 비율을 조정하여 합계가 100%가 되도록 설정
  for (var i = 1; i <= 5; i++) {
	var progressBar = 0;    
	if(i == 1){
		progressBar = progressBars[4];
	}else if(i == 2){
		progressBar = progressBars[3];
	}else if(i == 3){
		progressBar = progressBars[2];
	}else if(i == 4){
		progressBar = progressBars[1];
	}else if(i == 5){
		progressBar = progressBars[0];
	}
    progressBar.style.width = `${(getTotalRatingsForRating(i) / totalRatingsSum) * 100}%`;
  }
}


// 특정 별점에 해당하는 리뷰 개수를 반환하는 함수
function getTotalRatingsForRating(rating) {
  var className = `star${rating}`;
  var ratingBars = document.getElementsByClassName(className);

  var totalRatingsCount = ratingBars.length;
  var totalReviews = document.querySelectorAll(".review_wrap").length;
  
  // 해당 별점에 해당하는 리뷰 개수를 전체 리뷰 개수로 나누어서 비율을 계산
  var ratingRatio = totalRatingsCount / totalReviews;

  return ratingRatio;
}
    // 현재 날짜를 반환하는 함수
    function getCurrentDate() {
      var today = new Date();
      var year = today.getFullYear();
      var month = String(today.getMonth() + 1).padStart(2, "0");
      var date = String(today.getDate()).padStart(2, "0");
      return `${year}-${month}-${date}`;
    }
// 무작위 숫자 생성
function generateRandomNumber() {
  return Math.floor(Math.random() * 10000000000).toString().padStart(10, "0"); // 0 이상 10억 미만의 무작위 정수 생성
}

// 댓글이 등록될 때마다 숫자를 업데이트하는 함수
function updateCommentCount2() {
  var commentCount = document.querySelectorAll(".QnA_text_area").length;
  var commentCountSpan = document.getElementById("commentCount");
  if (commentCountSpan) {
    commentCountSpan.innerText = "(" + commentCount + ")";
  }
}

// Q&A에서 문의사항 작성하는 함수
function submitForm2() {
      var content_comment = document.getElementById("content_comment2").value;
      // 리뷰 내용을 입력하지 않았다면 글이 써지지 않게 함
  	  if (!content_comment.trim()) {
      alert("리뷰 내용을 입력해주세요.");
      return false;
      }
		  var randomNum = generateRandomNumber();
	      var reviewTextContainer = document.getElementById("QnA_text_container");
	      var newReviewDiv = document.createElement("div");
	      newReviewDiv.id = "QnA_text_container_" + randomNum;
	      newReviewDiv.className = "QnA_text_area";
	      newReviewDiv.innerHTML = `
	        <table style="width:100%; border:1px solid #e6e6e6; padding-top:10px; background:#fff;">
	          <tbody>
	            <tr>
	              <td style="font-size:12px; color:#555; padding:15px 15px 10px 15px;">
	                <span style="font-size:15px; color:#555; font-weight:400;">
	                  <img src="https://timeticket.co.kr/img/sns_icon/icon_conn_kakao.gif" style="padding-right:3px;">
	                  ${userId}
	                </span>&nbsp;&nbsp;${getCurrentDate()}&nbsp;&nbsp;&nbsp;
	                <a href="#reply" onclick="toggleReplyForm('habuReply_${randomNum}')"> <!-- 토글 함수 호출 -->
	                  <img src="https://timeticket.co.kr/img/viewpage/btn_write_reply.png" style="vertical-align:0px;" border="0" alt="의견쓰기">
	                </a>
	              </td>
	            </tr>
	            <tr>
	              <td style="font-size:15px; padding:5px 15px 15px 15px; line-height:160%;" align="left">${content_comment}</td>
	            </tr>
	            <tr id="habuReply_${randomNum}" style="display:none;"> <!-- 답글 창 숨김 -->
	              <td>
	                <table style="width:100%; background:#fafafa; border-top:1px solid #e6e6e6;">
	                  <tbody>
	                    <tr>
	                      <td style="padding:20px 10px 10px 10px;" valign="top" width="15" align="right">
	                        <img src="https://timeticket.co.kr/img/reply_icon.png">
	                      </td>
	                      <td style="font-size:12px; color:#555; padding-top:5px" align="left">
	                        <span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(${getCurrentDate()})&nbsp;&nbsp;
	                      </td>
	                    </tr>
	                    <tr>
	                      <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">
	                        <textarea id="reply_content_${randomNum}" style="font-size:15px; color:#000; width:96%; padding:5px 2%; border:1px solid #e6e6e6;"></textarea>
	                        <br>
	                        <button onclick="submitReplyForm(${randomNum})">등록</button> <!-- 답글 등록 버튼 -->
	                      </td>
	                    </tr>
	                  </tbody>
	                </table>
	              </td>
	            </tr>
	          </tbody>
	        </table>
	      `;
	      // 새 리뷰를 컨테이너의 맨 위에 삽입
	    if (reviewTextContainer.firstChild) {
	      reviewTextContainer.insertBefore(newReviewDiv, reviewTextContainer.firstChild);
	    } else {
	      reviewTextContainer.appendChild(newReviewDiv);
	    }
	
	      document.getElementById("content_comment2").value = ""; // 입력창 초기화
	      
	      // 댓글 수 업데이트
  		  updateCommentCount2();
  		  
	      return true;
}

function toggleReplyForm(replyDivId) {
      var replyDiv = document.getElementById(replyDivId);
      if (replyDiv.style.display === "none") {
        replyDiv.style.display = "table-row"; // 답글 창을 보이도록 설정
      } else {
        replyDiv.style.display = "none"; // 답글 창을 숨김으로 설정
      }
    }
function submitReplyForm(replyDivId) {
    var replyContent = document.getElementById("reply_content_" + replyDivId).value;

    // 등록된 답글을 화면에 보여주기
    var reviewTextContainer = document.getElementById("QnA_text_container_" + replyDivId);
    var newReplyTable = document.createElement("table");
    newReplyTable.style = "width:100%; background:#fafafa; border-top:1px solid #e6e6e6;";
    newReplyTable.innerHTML = `
        <tr>
            <td style="padding:10px 10px 10px 10px;" valign="top" width="15" align="right">
                <img src="https://timeticket.co.kr/img/reply_icon.png">
            </td>
            <td style="font-size:12px; color:#555; padding-top:5px" align="left">
                <span style="font-size:15px; font-weight:400; color:darkblue">관리자</span>&nbsp;&nbsp;(${getCurrentDate()})&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="font-size:15px; padding:0px 10px 15px 36px; line-height:160%;">${replyContent}</td>
        </tr>
    `;
    reviewTextContainer.appendChild(newReplyTable);

    // 등록 후 답글 창을 숨김으로 설정
    var replyDiv = document.getElementById("habuReply_" + replyDivId);
    replyDiv.style.display = "none";
}


// 지도 가져오기
var mapContainer1 = document.getElementById('map1'); //지도를 담을 영역의 DOM 레퍼런스
var mapContainer2 = document.getElementById('map2'); //지도를 담을 영역의 DOM 레퍼런스

let la = mapContainer1.dataset.la;
let lo = mapContainer1.dataset.lo;


var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(la, lo), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map1 = new kakao.maps.Map(mapContainer1, options); //지도 생성 및 객체 리턴
var map2 = new kakao.maps.Map(mapContainer2, options); //지도 생성 및 객체 리턴


// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(la, lo); 

// 마커를 생성합니다
var marker1 = new kakao.maps.Marker({
    position: markerPosition
}); 
var marker2 = new kakao.maps.Marker({
    position: markerPosition
}); 

// 마커가 지도 위에 표시되도록 설정합니다
marker1.setMap(map1);
marker2.setMap(map2);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);   