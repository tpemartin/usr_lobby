document.addEventListener('DOMContentLoaded', function() {
    var el_tabs = document.querySelector(".tabs");
    var instance_tabs = M.Tabs.init(el_tabs);
    /*slider*/
    const slides = document.querySelector(".slider-inner-container").children;
    const prev = document.getElementsByClassName("prev");
    const next = document.getElementsByClassName("next");
    let index = 0;
    
    function autoplay(){
      nextslide();
    }
    
    function nextslide(){
      if (index == slides.length - 1){
        index = 0;
      }
      else{
        index++;
      }
      changeslide();
    }
    
    function changeslide(){
      for (let i=0; i < slides.length; i++){
        slides[i].classList.remove("active");
      }
      slides[index].classList.add("active");
    }
    
    let timer = setInterval(autoplay, 5000);
    
    
    
    function prevslide(){
      if (index == 0){
        index = slides.length - 1;
      }
      else{
        index--;
      }
      changeslide();
    }
    
    prev.addEventListener("click", function(){
      prevslide();
      resetTimer();
    })
    
    next.addEventListener("click", function(){
      nextslide();
      resetTimer();
    })
    
    function resetTimer(){
      clearIntervaal(timer);
      timer = setInterval(autoplay, 5000);
    }
});

    