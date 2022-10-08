
// enable dropdown menu for mobile devices
$(() => {
    console.log('ADDED');
    $(".mobile-menu").on('click', () => {
        $('.right-side').toggleClass('active');
    })
})

