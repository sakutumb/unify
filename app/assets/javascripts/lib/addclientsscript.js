$(window).resize(function() {
  execAddClientsJQuery();
});

$(window).bind("mousewheel", function() {
    $("html, body").stop();
});

function execOnceAddClientsJquery() {
  $('.add-clients-items-list li a').click(function() {
    href = $(this).attr('href');
    ahchorY = href.slice(href.indexOf('#'), href.lenght);
    $('html,body').animate({scrollTop: $(ahchorY).offset().top}, 600);
  });
  
  $('.open-bulk').click(function() {
    $('.bulk-text').toggleClass('dsplBlock');  
  });

  $('.file_upload input').click(function() {
    $('.bulk-text').removeClass('dsplBlock');  
  });

  $('.scrollup').click(function() {
    $("html, body").animate({
      scrollTop: 0
    }, 900);
    return false;
  });

}

function execAddClientsJQuery () {
  if ($(window).width() > 768) {
    $('.adwrapper').css('height', $('.col-sm-8 .add-clients-wrapper , .height').height());
  } else {
    $('.adwrapper').css('height', '250');
  }
}