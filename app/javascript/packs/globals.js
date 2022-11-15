
// enable dropdown menu for mobile devices
$(() => {
    $(".mobile-menu").on('click', () => {
        console.log('clicked');
        $('.right-side').toggleClass('active');
        $(".arrow").toggleClass('active');
        $(".mobile-menu").toggleClass('active');
    })
})

