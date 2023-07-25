
// 고객센터 좌측 메뉴의 경로 안내
const notice = document.querySelector('#notice');
notice.addEventListener('click', () => {
	location.href = '/as/notice'
});

const freqQ = document.querySelector('#freq-questions');
freqQ.addEventListener('click', () => {
	location.href = '/as/freq'

});

const oneOnOne = document.querySelector('#one-on-one');
oneOnOne.addEventListener('click', () => {
	location.href = '/as/one-on-one'
});

/*글쓰기 버튼
const writeBtn = document.getElementById('write-btn');
writeBtn.addEventListener('click', () => {
	//location.href='';
});*/


// 페이지 버튼의 상태변경
const noticePageBtns = document.querySelectorAll('.notice-page-buttons');
noticePageBtns.forEach(pageBtn => {
	pageBtn.addEventListener('click', addSelected);
	pageBtn.addEventListener('click', (e) => {
		location.href = `/as/notice/list?pageNum=${e.target.value}`;
	});
});
const freqPageBtns = document.querySelectorAll('.freq-page-buttons');
freqPageBtns.forEach(pageBtn => {
	pageBtn.addEventListener('click', addSelected);
	pageBtn.addEventListener('click', (e) => {
		location.href = `/as/freq/list?pageNum=${e.target.value}`;
	});
});

function addSelected(e) {
	e.target.classList.add('selected');
	const className = e.target.classList[0];
	const elements = document.querySelectorAll('.' + className);
	elements.forEach(element => {
		if (element !== e.target) {
			element.classList.remove('selected');
		}
	});
}

// 공지사항 페이지 이동버튼
const noticePrevBtn = document.getElementById('notice-prev-btn');
if (noticePrevBtn) {
	noticePrevBtn.addEventListener('click', () => {
		let pageNum = document.getElementById('page-num').value;
		console.log(pageNum);
		if (pageNum - 1 == 0) {
			location.href = `/as/notice/list?pageNum=${pageNum}`;
		} else {
			location.href = `/as/notice/list?pageNum=${--pageNum}`;
		}
	});
}
const noticeNextBtn = document.getElementById('notice-next-btn');
if (noticeNextBtn) {
	noticeNextBtn.addEventListener('click', () => {
		let pageNum = document.getElementById('page-num').value;
		let maxNum = document.getElementById('max-num').value;
		if (pageNum + 1 > maxNum) {
			location.href = `/as/notice/list?pageNum=${pageNum}`;
		} else {
			location.href = `/as/notice/list?pageNum=${++pageNum}`;
		}
	});
}

// 자주 묻는 질문 이동버튼
const freqPrevBtn = document.getElementById('freq-prev-btn');
if (freqPrevBtn) {
	freqPrevBtn.addEventListener('click', () => {
		let pageNum = document.getElementById('page-num').value;
		if (pageNum - 1 == 0) {
			location.href = `/as/freq/list?pageNum=${pageNum}`;
		} else {
			location.href = `/as/freq/list?pageNum=${--pageNum}`;
		}
	});
}
const freqNextBtn = document.getElementById('freq-next-btn');
if (freqNextBtn) {
	freqNextBtn.addEventListener('click', () => {
		let pageNum = document.getElementById('page-num').value;
		let maxNum = document.getElementById('max-num').value;
		if (pageNum + 1 > maxNum) {
			location.href = `/as/freq/list?pageNum=${pageNum}`;
		} else {
			location.href = `/as/freq/list?pageNum=${++pageNum}`;
		}
	});
}
// 여기는 관리자에서 기능을 관리해야 할 듯
const askStatus = document.querySelector('.board-status');




