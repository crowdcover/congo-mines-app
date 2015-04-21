(function(){
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

})();
