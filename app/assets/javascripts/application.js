// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$().ready(function() {
  setTimeout(clearNotice, 1000);

  function clearNotice( ) {
    $('.notice').animate({opacity: '0'}, 1500);
    $('.alert').animate({opacity: '0'}, 1500);
  }

  // New issue
  $('.issueType').change(function( ) {
    switch( this.value ) {
      case 'Task':
      $('.bugdesc').hide( );
      $('.taskdesc').show( );
      break;
      case 'Bug':
      $('.bugdesc').show( );
      $('.taskdesc').hide( );
      break;
    }
  });

  // Issue divs for resources
  $("#youtubes").click(function(){
    var cloned = $('.youtubediv:first').clone( );
    cloned[0].childNodes[3].remove( );
    cloned.appendTo('.youtubes');
  });

  $("#imgurs").click(function() {
    var cloned = $('.imgurdiv:first').clone( );
    cloned[0].childNodes[3].remove( );
    cloned.appendTo('.imgurs');
  })
});
