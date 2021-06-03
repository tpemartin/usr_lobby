$slider = $("#slider");
$seminar = $("#seminar");

flag_slider = true
function changePanel(){
 if(flag_slider){
    $slider.hide()
    $seminar.show()
    flag_slider = false
 } else {
     $slider.show()
     $seminar.hide()
     flag_slider = true
 }
}

setInterval(changePanel, 5000);