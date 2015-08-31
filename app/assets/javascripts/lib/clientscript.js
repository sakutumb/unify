$(window).resize(function() {
  execClientJQuery();
});

function execClientJQuery () {
  if ($(window).width() > 768) {
    $('.adwrapper').css('height', $('.col-sm-8 .add-clients-wrapper , .height').height());
    $('.user-count').css('height', $('.user-info-clients').height() + 2);
  } else {
    $('.adwrapper').css('height', '250');
    $('.user-count').css('height',"auto");
  }
}