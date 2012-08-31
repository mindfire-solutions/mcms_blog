/*
    @Name : admin/blog/mcms-blog-submenu.js
    @Purpose : Added javascripts for submenus at admin side
    @Created at : 16-07-2012
    @Updated at : 16-07-2012
    @Company : Mindfiresolutions
*/
$(function(){

    /* parent-menu-link anchors css as font-weight , bold*/
    $('a.parent-menu-link').css('font-weight', 'bold');

    /* Hidding chlid ul lists for each submenu lists */
    $('li.submenu').each(function() {
        $(this).find('ul').hide();
    });


    /*Checking location paths  for auto selecting submenu */

    var pathname = window.location.pathname;
    var section = pathname.split('/');
    var sub_section = section[3];
    

    if( sub_section == 'categories' ) {

        $('#repo-listing li:nth-child(2)').addClass('selected');
        $('li.selected').children('ul').slideToggle('slow');

    } else if( sub_section == 'posts' ) {

        $('#repo-listing li:nth-child(1)').addClass('selected');
        $('li.selected').children('ul').slideToggle('slow');

    } else if( sub_section == 'comments' ) {

        $('#repo-listing li:nth-child(3)').addClass('selected');
        $('li.selected').children('ul').slideToggle('slow');
    }

    /* Removing class selected for each child-menu link */
    $('li.child-menu').each(function() {
        $(this).removeClass('selected');
    });

    /* After each submenu clicking the ul lists should be opened and others should be closed */
    $('li.submenu').click(function(e) {
            if($(this).attr('class') == "submenu selected")
            {
                $('li.selected').removeClass('selected');
                $(this).children('ul').slideToggle('slow');

            }
            else
            {
                $('li.selected').children('ul').slideToggle('slow');
                $('li.selected').removeClass('selected');
                $(this).addClass('selected');
                $(this).children('ul').slideToggle('slow');

            }

    });

  
});