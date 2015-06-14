//
//= require jquery
//= require jquery_ujs
//= require chosen-jquery
//= require scaffold
// require tinymce
//= require tinymce-jquery

//= require jquery-ui
// require jquery-ui/sortable
// require jquery-ui/datepicker
//= require tinymce-jquery
//= require turbolinks

//= require active_scaffold
//   require_tree .


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


/*
tinymce.init({selector:'textarea',
plugins: ["link","preview","searchreplace", "charmap", "table", "fullscreen"],
tools: "inserttable",
language: 'fr_FR',});
*/

tinymce.init({
  //selector:'textarea',
  mode : "specific_textareas",
  // editor_selector : /(mceEditor|mceRichText)/
  editor_selector : "mceEditor",

  plugins: ["link","preview","searchreplace", "charmap", "table", "fullscreen"],
  tools: "inserttable",
  language: 'fr_FR',
});



$(".chosen").chosen();
