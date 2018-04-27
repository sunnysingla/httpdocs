(jQuery)(function($) {

    /* ================ MAIN NAVIGATION ================ */

    (function() {
        $(" #nav ul ").css({
            display: "none"
        }); // Opera Fix
        $(" #nav li").hover(function() {
            $(this).find('ul:first').css({
                visibility: "visible",
                display: "none"
            }).slideDown(250);
        }, function() {
            $(this).find('ul:first').css({
                visibility: "hidden"
            });
        });
    })();

    /* ================ RESPONSIVE NAVIGATION ================ */
    $(function() {
        $('#dl-menu').dlmenu({
            animationClasses: {
                classin: 'dl-animate-in-2', 
                classout: 'dl-animate-out-2'
            }
        });
    });
   
});