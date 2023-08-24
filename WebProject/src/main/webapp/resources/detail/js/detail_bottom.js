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
	document.querySelector('.main_img').scrollIntoView({ block: 'start' });
}
// qna
function gethiddenId(){
	var qnaIdElements = document.querySelectorAll(".qna_id");
	for (var i = 0; i < qnaIdElements.length; i++) {
	    var qnaId = qnaIdElements[i].textContent;
	    if (qnaId.length >= 2) {
	        var hiddenId = qnaId.substring(0, 2) + "*".repeat(qnaId.length - 2);
	        qnaIdElements[i].textContent = hiddenId;
	    }
	}
}


document.addEventListener('DOMContentLoaded', function() {
	const textarea = document.getElementById('qnaTextarea');
	gethiddenId();
	textarea.addEventListener('click', (e) => {
		
		if (e.target.dataset.user === '') {
			location.href = '../login';
		}

	});
});


function addQnA(performance_code, member_id, member_code) {
	const qnaTextarea = document.getElementById('qnaTextarea');
	const qa_content = qnaTextarea.value; // textarea에 입력된 값 가져오기

	var data = {
		performance_code: performance_code,
		qa_writer_id: member_id,
		qa_writer_code: member_code,
		qa_content: qa_content
	};
	var performance_code = {
		performance_code: performance_code
	}

	fetch('../addQnA', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(response => response.json())
		.then(result => {
			// 서버 응답을 처리하는 로직
			document.getElementById("qnaTextarea").value='';
			
			
			fetch('../getQnAlist', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(performance_code)
			})
				.then(response => response.json())
				.then(getQnAlist => {
					const qnacount = getQnAlist.count;
					const qnalist = getQnAlist.qnalist;
					updateQnA(qnalist);
					updateQnACount(qnacount);
				})
				.catch(error => {
					console.error('SELECT 오류:', error);
				});
		})
		.catch(error => {
			// 오류 처리 로직
			console.error('오류:', error);
		});
}


function updateQnACount(count){
	const qnaCount = document.getElementById('qnaCount');
	qnaCount.innerHTML = '';
	qnaCount.textContent = 'Q&A(' + count + ')';
}



function updateQnA(getQnAlist) {
    const newQnalist = document.getElementById('qna_text_container');

    // 기존 내용 지우기
    newQnalist.innerHTML = '';

    // 받아온 새로운 데이터를 사용하여 업데이트
   getQnAlist.forEach(qnaData => {
        const qnaElement = document.createElement('div');
        qnaElement.classList.add('qna'); // qna 클래스 추가

        const qnaInfo = document.createElement('div');
        qnaInfo.classList.add('qna_info'); // qna_info 클래스 추가

        const qnaIdSpan = document.createElement('span');
        qnaIdSpan.classList.add('qna_id'); // qna_id 클래스 추가
        qnaIdSpan.textContent = qnaData.qa_writer_id;
        qnaInfo.appendChild(qnaIdSpan);

        const qnaDateSpan = document.createElement('span');
        qnaDateSpan.classList.add('qna_date'); // qna_date 클래스 추가
        qnaDateSpan.textContent = `(${qnaData.qa_date})`;
        qnaInfo.appendChild(qnaDateSpan);

        const qnaContentDiv = document.createElement('div');
        qnaContentDiv.classList.add('qna_content'); // qna_content 클래스 추가
        qnaContentDiv.textContent = qnaData.qa_content;

        qnaElement.appendChild(qnaInfo);
        qnaElement.appendChild(qnaContentDiv);

        newQnalist.appendChild(qnaElement);
    });
    gethiddenId();
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
var markerPosition = new kakao.maps.LatLng(la, lo);

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
