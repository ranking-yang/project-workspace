/* 헤더 */
/*
const loginBtn = document.querySelector('#login');
loginBtn.addEventListener('click', ()=> {
	location.href='../login'
});

const joinBtn = document.querySelector('#join');
joinBtn.addEventListener('click', () =>{
	location.href='../join'
});
*/


const asBtn = document.querySelector('#as');
asBtn.addEventListener('click', () => {
	location.href='/as/notice'
});

const logoBtn = document.querySelector('#main-logo');
logoBtn.addEventListener('click', () => {
	location.href='/main'
});

const menuBtns = document.querySelectorAll('.menu-btn');
	menuBtns.forEach(menuBtn => {
		menuBtn.addEventListener('click', (e) => {

			
			switch(e.target.textContent){
		    	case '공연':
					location.href = '/product/performance?main_category=show';
		    		break;
		    	case '전시':
					location.href = '/product/performance?main_category=art';
		    		break;
		    	case '음악':
					location.href = '/product/performance?main_category=music';
		    		break;
		    	case '키즈':
					location.href = '/product/performance?main_category=kid';
		    		break;
		    	case '지역별':
					location.href = '/product/performance?main_category=area';
		    		break;
		    	
			}

	    	
	 });
 });
 
// 검색 기능
const search = document.querySelector('#search');
search.addEventListener('submit', (e) => {
	const keyword = document.querySelector('#search-box');
	console.log(keyword.value);
	e.preventDefault();
	location.href='/search?keyword='+keyword.value;
});
