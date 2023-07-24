
// 고객센터 좌측 메뉴의 경로 안내
const notice = document.querySelector('#notice');
notice.addEventListener('click', () => {
	location.href='notice'
});

const freqQ = document.querySelector('#freq-questions');
freqQ.addEventListener('click', () => {
	location.href='freq'
	
});

const oneOnOne = document.querySelector('#one-on-one');
oneOnOne.addEventListener('click', () => {
	location.href='one-on-one'
});


// 페이지 버튼의 상태변경
const pageBtns = document.querySelectorAll('.page-buttons');
pageBtns.forEach(pageBtn => {
	pageBtn.addEventListener('click', addSelected)
});


function addSelected(e){
    e.target.classList.add('selected');
    const className = e.target.classList[0];
    const elements = document.querySelectorAll('.'+className);
    elements.forEach(element => {
        if(element !== e.target){
            element.classList.remove('selected');
        }
    }); 
}

// 여기는 관리자에서 기능을 관리해야 할 듯
const askStatus = document.querySelector('.board-status');




