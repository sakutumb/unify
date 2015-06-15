function calculateSearch() {
  $(".search-basic").css('height' , ($(".user-info.no-top-margin.standart-white-block").outerHeight()) * 3.15);
  $(".search-appereance").css('height' , ($(".user-info.no-top-margin.standart-white-block").outerHeight()) * 2.25);
  $(".search-habits").css('height' , ($(".user-info.no-top-margin.standart-white-block").outerHeight()) * 2.06);
  $(".search-horoscope").css('height' , ($(".user-info.no-top-margin.standart-white-block").outerHeight()) * 2.06);
  $(".sidebar-search-list").css('height' , $(".user-info-select.no-top-margin.standart-white-block").height() - 33 );
}

if ($(window).width() > 1024) {
  calculateSearch();
}

$(window).resize(function() {

  $('.wrapper').removeClass('pull_left');

  if ($(window).width() > 1024) {
    calculateSearch();
  }

});