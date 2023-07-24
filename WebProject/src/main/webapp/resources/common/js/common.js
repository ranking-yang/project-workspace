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
function toggleLike(event, buttonId) {
    event.stopPropagation();
    var button = document.getElementById(buttonId);
    button.classList.toggle('liked');

    var icon = button.querySelector('i.fa-heart');
    if (button.classList.contains('liked')) {
      icon.classList.add('fa-solid');
      icon.classList.remove('fa-regular');
      icon.style.color = '#e41b1b';
    } else {
      icon.classList.remove('fa-solid');
      icon.classList.add('fa-regular');
      icon.style.color = '#000000';
    }
  }
  