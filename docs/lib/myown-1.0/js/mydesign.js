document.addEventListener('DOMContentLoaded', function() {
    var el_tabs = document.querySelector(".tabs");
    var instance_tabs = M.Tabs.init(el_tabs);
    var elems_carousel = document.querySelectorAll('.carousel');
    var instances_carousel = M.Carousel.init(elems_carousel,{
      dist: 0,
      numVisible:3,
      shift:100,
      indicators: true
    }); 
    /*, {
      // specify options here
    });*/
    var elems_fltbtn = document.querySelectorAll('.fixed-action-btn');
    var instances_fltbtn = M.FloatingActionButton.init(elems_fltbtn);
 
});