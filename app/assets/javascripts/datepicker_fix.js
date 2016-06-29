//= require bootstrap-datepicker
if (!$.fn.bootstrapDP && $.fn.datepicker && $.fn.datepicker.noConflict) {
   var datepicker = $.fn.datepicker.noConflict();
   $.fn.bootstrapDP = datepicker;
}

$('document').ready(function(){
  $('.datepicker').bootstrapDP({
    format: 'dd/mm/yyyy',
    startDate: '+1d'
  });
});