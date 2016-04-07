var backToTopScrollAmount = 300;

$().ready( function( ) {
    $(window).scroll( function( ) {
        if( $(window).scrollTop( ) > backToTopScrollAmount ) {
            $(".back-to-top").fadeIn( 'slow' );
        } else {
            $(".back-to-top").fadeOut( 'slow' );
        }
    });

    $('.back-to-top').click( function( ) {
        $('body').animate( {
            scrollTop: 0
        }, 650);
        return false;
    });
});
