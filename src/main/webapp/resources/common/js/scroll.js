/* 화면 상단으로 이동하는 버튼 */
const scrollUp = document.querySelector('.scroll-up');

document.addEventListener('scroll', () =>{
    if(window.scrollY > 300){
        scrollUp.classList.add('visible');
    }else{
        scrollUp.classList.remove('visible');
    }
});

scrollUp.addEventListener('click', () => {
    document.querySelector('html').scrollIntoView({behavior: "smooth", block:"start"});

});

