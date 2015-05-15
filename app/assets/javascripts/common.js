$(function(){
  $(document).foundation();

  var app = {
    initCommon: function(){
      mainbottom = $('.content').offset().top
      console.log('init')
      $("#hideshow").on('click', function(e){
        e.preventDefault();
        e.stopPropagation();

        $("#browse-search").slideToggle(500);
      });

      $("#drc_company").add("#shareholder_company").select2({
        allowClear: true
      });
    },

  };

  window.app = app;

});


/*

jQuery(document).on("focus", "input.date_picker", function(){
    var date_picker = jQuery(this);
    if (typeof(date_picker.datepicker) == 'function') {
      if (!date_picker.hasClass('hasDatepicker')) {
        date_picker.datepicker();
        date_picker.trigger('focus');
      }
    }
    return true;
});
*/
