$(document).ready(function(){
  $("#input").Rut();
});

$(document).ready(function() {
  var max_chars = 9;

  $('#input').keydown( function(e){
      if ($(this).val().length >= max_chars) {
          $(this).val($(this).val().substr(0, max_chars));
      }
  });

  $('#input').keyup( function(e){
      if ($(this).val().length >= max_chars) {
          $(this).val($(this).val().substr(0, max_chars));
      }
  });
});

$(document).ready(function(){
  $("#ticket_provider_id").select2({
    theme: "bootstrap",
    language: "es"
  });

  $("#ticket_bank_id").select2({
    theme: "bootstrap",
    language: "es"
  });

  $("#ticket_state_id").select2({
    theme: "bootstrap",
    language: "es"
  });

  $("#ticket_document_id").select2({
    theme: "bootstrap",
    language: "es"
  });
});

$(document).ready(function($) {
  "use strict"; // Start of use strict

  // Toggle the side navigation
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Close any open menu accordions when window is resized below 768px
  $(window).resize(function() {
    if ($(window).width() < 768) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Prevent the content wrapper from scrolling when the fixed side navigation hovered over
  $('body.fixed-nav .sidebar').on('mousewheel DOMMouseScroll wheel', function(e) {
    if ($(window).width() > 768) {
      var e0 = e.originalEvent,
        delta = e0.wheelDelta || -e0.detail;
      this.scrollTop += (delta < 0 ? 1 : -1) * 30;
      e.preventDefault();
    }
  });

  // Scroll to top button appear
  $(document).on('scroll', function() {
    var scrollDistance = $(this).scrollTop();
    if (scrollDistance > 100) {
      $('.scroll-to-top').fadeIn();
    } else {
      $('.scroll-to-top').fadeOut();
    }
  });

  // Smooth scrolling using jQuery easing
  $(document).on('click', 'a.scroll-to-top', function(e) {
    var $anchor = $(this);
    $('html, body').stop().animate({
      scrollTop: ($($anchor.attr('href')).offset().top)
    }, 1000, 'easeInOutExpo');
    e.preventDefault();
  });

})(jQuery); // End of use strict
