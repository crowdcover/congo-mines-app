$(function(){
  $(document).foundation();

  var app = {
    initCommon: function(){
      mainbottom = $('.menu').offset().top;

      $(window).on('scroll', this.showStickyHeader);

      $("#hideshow").click(function(){
        $("#advanced").slideToggle(500);
      });
    },

    showStickyHeader: function(){
      stop = Math.round($(window).scrollTop());
      if (stop > mainbottom) {
          $('.menu').addClass('past-main');
      } else {
          $('.menu').removeClass('past-main');
      }
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
