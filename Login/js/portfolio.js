$(document).ready(function() {

    /* ================ PORTFOLIO ISOTOPE FILTER ================ */

    (function() {
        //ISOTOPE
        // cache container
        var $portfolioitems = $('#portfolioitems');
        // initialize isotope
        $portfolioitems.isotope({
            filter: '*',
            masonry: {
                columnWidth: 1,
                isResizable: true
            }
        });

        // filter items when filter link is clicked
        $('#filters a').click(function() {
            $('#filters li').removeClass('active');
            var selector = $(this).closest('li').addClass('active').end().attr('data-filter');
            $portfolioitems.isotope({
                filter: selector
            });
            return false;
        });
    })();
});
