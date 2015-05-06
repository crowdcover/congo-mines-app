$(function(){
  $(document).foundation();

  var app = {
    initCommon: function(){
      mainbottom = $('.content').offset().top

      $("#hideshow").click(function(){
        $("#advanced").slideToggle(500);
      });
    }

  };

  window.app = app;

  app.initCommon();

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
