const footerAsBtns = document.querySelectorAll('.footer-as-btn');
	footerAsBtns.forEach(footerAsBtn => {
		footerAsBtn.addEventListener('click', (e) => {
	    	location.href = '/as/' + e.target.id;
	 });
 });
 
 function goToPersonal(){
	 location.href = "/main/personal_info";
 }