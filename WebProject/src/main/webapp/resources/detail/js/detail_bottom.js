const detailMenuBtns = document.querySelectorAll('.detailMenuBtn');
const menuContents = document.querySelectorAll('.menuContent');

// 초기에 선택된 메뉴를 설정하는 함수
function selectMenu(menuBtn) {
    const selectedTarget = menuBtn.dataset.target;
    
    // 메뉴 컨텐츠를 보여주는 로직 추가
    menuContents.forEach((content) => {
        content.style.display = content.id === `${selectedTarget}Content` ? 'block' : 'none';
    });
}

window.addEventListener('DOMContentLoaded', () => {
    const initialSelectedMenu = document.querySelector('.detailMenuBtn[data-target="info"]');
    initialSelectedMenu.classList.add('selected');
    
    // 초기 선택된 메뉴를 표시
    selectMenu(initialSelectedMenu);
});

detailMenuBtns.forEach((menuBtn) => {
    menuBtn.addEventListener('click', (e) => {
        // 기존에 선택된 버튼이 있다면 클래스 제거
        const prevSelectedBtn = document.querySelector('.detailMenuBtn.selected');
        if (prevSelectedBtn) {
            prevSelectedBtn.classList.remove('selected');
        }

        // 현재 클릭된 버튼에 selected 클래스 추가
        e.target.classList.add('selected');

        // 선택된 메뉴 컨텐츠 표시
        selectMenu(e.target);
    });
});

// 공연 내용 펼쳐보기에 사용되는 함수
function showMoreDetailImage() {
  document.querySelector('.info_detail_btn').remove();
  document.querySelector('.info_detail_gradient').remove();
  document.querySelector('.info_detail_poster').setAttribute("style", `display:none;`);
  document.getElementById('main_img').style.display = 'block';
  document.querySelector('.main_img').scrollIntoView({block: 'start' });
}
// qna
document.addEventListener('DOMContentLoaded', function() {
  const textarea = document.getElementById('qnaTextarea');

  textarea.addEventListener('click', (e) => {
	console.log(e.target.dataset.user);
	if(e.target.dataset.user === ''){
		location.href='../login';
	}
	
  });
});


function getQnQ() {
    const qnaTextarea = document.getElementById('qnaTextarea');
    const qnaValue = qnaTextarea.value; // textarea에 입력된 값 가져오기

	// 요청 보낼 데이터 생성
    var data = { 
		qnaValue: qnaValue,
		qa_writer_code,
    	//작업 진행중입니다 
     };

    // fetch를 사용한 POST 요청
    fetch('서버의_주소_또는_엔드포인트', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(result => {
        // 서버 응답을 처리하는 로직
        console.log('서버 응답:', result);
    })
    .catch(error => {
        // 오류 처리 로직
        console.error('오류:', error);
    });
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
