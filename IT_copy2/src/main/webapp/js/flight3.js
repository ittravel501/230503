
function popOpen() {

    var modalPop = $('.fmodal-wrap');
    var modalBg = $('.fmodal-bg'); 

    $(modalPop).show();
    $(modalBg).show();

}

 function popClose() {
   var modalPop = $('.fmodal-wrap');
   var modalBg = $('.fmodal-bg');

   $(modalPop).hide();
   $(modalBg).hide();

}
   
  
  
  function submitFlightForm() {
    document.getElementById('flightForm').submit();
  }