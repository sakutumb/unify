$(document).ready(function() {

	$(".menu-button").click(function() {
		$('.wrapper').toggleClass('pull_left');

	});
	$(".main-menu").css( "margin-left" , ($(".container").width() - $(".main-menu").width())/2  );



});

$(window).resize(function() {

	$('.wrapper').removeClass('pull_left');
	$(".main-menu").css( "margin-left" , ($(".container").width() - $(".main-menu").width())/2  );
});

