$(document).ready(function () {

  
/* var urlmenu = document.getElementById( 'menu1' );
 urlmenu.onchange = function() {
        window.open(location,'_self'); 
	
 };*/

if(navigator.userAgent.match(/Trident.*rv:11\./)) {
    $('body').addClass('ie11');
}

    /* ---------------------------------------------------------------------- */

    /*	tabs-list block

    /* ---------------------------------------------------------------------- */

    var explore = $("#tabs-list > div ");
    explore.easytabs({
        animate: true,
        updateHash: true,
        transitionIn: 'slideDown',
        transitionOut: 'slideUp',
        animationSpeed: speed,
        tabActiveClass: 'active'
    })
        .end()
        .on('easytabs:after', function (e) {
            var $ref = $map.data('gMap.reference');
            google.maps.event.trigger($ref, 'resize');
            $ref.setCenter(gLocation);
        });
    var profile = $("#profile");
    var profilescrollcontainer = profile.find(".scroll-container");
    var profileexternalscrolly = profile.find(".external-scroll_y");

    var cv = $("#cv");
    var cvscrollcontainer = cv.find(".scroll-container");
    var cvexternalscrolly = cv.find(".external-scroll_y");

    cvscrollcontainer.scrollbar({
        autoScrollSize: true,
        scrolly: countryexternalscrolly
    });

    var contacts = $("#contacts");
    var contactsscrollcontainer = contacts.find(".scroll-container");
    var contactsexternalscrolly = contacts.find(".external-scroll_y");



    /**************************************************/
    /* Hde menu and simple search*/
    /**************************************************/
    $('.menu-hider').click(function () {
        if ($('.menu-hider').hasClass('closed')) {
            $('.menu-hider').removeClass('closed');
            $('#navigation').slideDown(400);
			$('.reponsive-nav').slideDown(400);
	        $('#search').slideDown(400);
            $('#header').height(140); /*.css('borderBottom','none');*/
        } else {
            $('.menu-hider').addClass('closed');
            $('#navigation').slideUp(400);
			$('.reponsive-nav').slideUp(400);
		    $('#search').slideUp(400);
            $('#header').height(60); /*.css('borderBottom','2px solid #E5E5E5');*/
        }
    });

    if ($(window).width() < 485) {
        if ($('.menu-hider').hasClass('closed'))
            return;
        else {
            $('.menu-hider').addClass('closed');
            $('#navigation').slideUp(400);
			$('.reponsive-nav').slideUp(400);
            $('#search').slideUp(400);
            $('#header').height(60);
            /*$('#header.hider').css('borderBottom','2px solid #E5E5E5');*/
        };
    };

    
    /* ---------------------------------------------------------------------- */
    /*	Global
    /* ---------------------------------------------------------------------- */
    var speed = 500;

   

   

    /* ---------------------------------------------------------------------- */
    /*	Menu Major
    /* ---------------------------------------------------------------------- */

    /*	Submenu show/hide */
    var container = $('#navigation li.expanded');

    container.find('ul.submenu').hide();

    container.hover(function () {
            $(this).find('ul').slideDown(speed);
        },
        function () {
            $(this).find('ul').hide();
        });

    /*	Submenu show menu down arrow */
    var acontainer = $('#navigation li.expanded > a');

    acontainer.each(function () {
        $(this).html($(this).html() + '<span class="dropdown"></span>');
    });
    /* ---------------------------------------------------------------------- */
    /*	Content Height
    /* ---------------------------------------------------------------------- */
    var contentwithout = 0;

    if ($('#bar').height()) {
        contentwithout = contentwithout + $('#bar').height() + 2
    }
    if ($('#header').height()) {
        contentwithout = contentwithout + $('#header').height() + 2;
    }
    if ($('#search').height()) {
        contentwithout = contentwithout + $('#search').height() + 2;
    }
    if ($('#footer').height()) {
        contentwithout = contentwithout + $('#footer').height() + 2;
    }
    if ($('#copyright').height()) {
        contentwithout = contentwithout + $('#copyright').height() + 2;
    }
    contentwithout = contentwithout + 20; /* I don't know for what it, but it is very important fix. ;) */

    $('div#content').css('min-height', $(window).height() - contentwithout);
    /* ---------------------------------------------------------------------- */
    /*	Search Form
    /* ---------------------------------------------------------------------- */
    $('div#options').css('display', 'none');

    $('div#more-options').click(function () {
        $(this).hide();
        $('div#options').slideDown(speed);
    });
    /* ---------------------------------------------------------------------- */
    /*	Login Form
    /* ---------------------------------------------------------------------- */
    /*	Show/Hide Form */
    var login1form = $('#login-panel div.left div.first');
    var login2form = $('#login-panel div.right div.first');
    var login1buttom = $('#find-job-buttom');
    var login2buttom = $('#post-job-buttom');

    login1buttom.click(function () {
        login1form.find('.counter').fadeOut(speed / 5);
        login2form.slideDown(speed);
        login1form.slideUp(speed);
        login2form.find('.badge').fadeIn(speed * 2.5);
    });

    login2buttom.click(function () {
        login2form.find('.badge').fadeOut(speed / 5);
        login1form.slideDown(speed);
        login2form.slideUp(speed);
        login1form.find('.counter').fadeIn(speed * 2.5);
    });

    /* ---------------------------------------------------------------------- */
    /*	Input Customize
    /* ---------------------------------------------------------------------- */
    $(".select").combosex({
        classCombo: 'select',
        classOptions: 'select-options'
    });

    $(".textfield").each(function () {
        var placeholder = $(this).attr('placeholder');
        $(this).combosex({
            classCombo: 'textfield',
            placeholder: placeholder
        })
    });

    $(".textfield-with-callback").each(function () {
        var placeholder = $(this).attr('placeholder');
        $(this).combosex({
            classCombo: 'textfield',
            classOptions: 'textfield-options',
            delay: 222,
            placeholder: placeholder,
            suggest: function (hash, ex) {
                this.xhr = $.getJSON("http://suggest.yandex.ru/suggest-ya.cgi?callback=?", {
                    lr: 213,
                    v: 3,
                    part: ex.str
                }, function (data) {
                    var res = [];
                    for (var i in data[1]) {
                        if (data[1][i][0] != "nav") {
                            res.push({
                                val: data[1][i],
                                text: data[1][i]
                            });
                        }
                    }
                    ex.results(res);
                });
            }
        });
    });
    
    /* ---------------------------------------------------------------------- */
    /*	Explore block
    /* ---------------------------------------------------------------------- */
    var explore = $("#explore > div ");

    explore.easytabs({
        animate: true,
        updateHash: false,
        transitionIn: 'slideDown',
        transitionOut: 'slideUp',
        animationSpeed: speed,
        tabActiveClass: 'active'
    });

    var industry = $("#industry");
    var industryscrollcontainer = industry.find(".scroll-container");
    var industryexternalscrolly = industry.find(".external-scroll_y");

    industryscrollcontainer.scrollbar({
        autoScrollSize: true,
        scrolly: industryexternalscrolly
    });

    var country = $("#country");
    var countryscrollcontainer = country.find(".scroll-container");
    var countryexternalscrolly = country.find(".external-scroll_y");

    countryscrollcontainer.scrollbar({
        autoScrollSize: true,
        scrolly: countryexternalscrolly
    });

    var type = $("#type");
    var typescrollcontainer = type.find(".scroll-container");
    var typeexternalscrolly = type.find(".external-scroll_y");

    typescrollcontainer.scrollbar({
        autoScrollSize: true,
        scrolly: typeexternalscrolly
    });
    
    

   

    /* ---------------------------------------------------------------------- */
    /*	Job Page Fields
    /* ---------------------------------------------------------------------- */
    var jobcontentfields = $("#job-content-fields");

    jobcontentfields.find(".nav-buttons .show-hide").addClass('hide');
    /*jobcontentfields.each(function () {
        progressbaranimation();
    })*/

    jobcontentfields.each(function () {
        $(this).find(".body-field").find(".full-body").css('display', 'none');
        $(this).find(".block-fields").css('display', 'none');
        $(this).find(".buttons-field").css('display', 'none');
    });

    jobcontentfields.find(".field-container").addClass('hide');

    $(".roll-with-description.hide").each(function () {
        $(this).each(function () {
            $(this).find(".description").css('display', 'none')
        })
    });

    $(".roll-with-description.show").each(function () {
        $(this).each(function () {
            $(this).find(".description").css('display', 'block')
        })
    });

    var textcontainer = jobcontentfields.find(".body-field");

    textcontainer.each(function () {
        $(this).find(".read-more").click(function () {
            $(this).parent("p").parent(".teaser").parent(".body-field").find(".full-body").slideDown(speed);
            $(this).fadeOut(speed);
        });
    });



    var viewfullbutton = jobcontentfields.find(".show-hide");

    viewfullbutton.each(function () {
        $(this).click(function () {
            if ($(this).hasClass('hide')) {
                $(this).removeClass('hide').addClass('show');
                var parentelement = $(this).parent("ul").parent(".nav-buttons").parent(".field-container");
                parentelement.removeClass('hide').addClass('show');
                parentelement.find(".block-fields").slideDown(speed);
                parentelement.find(".buttons-field").slideDown(speed);
                parentelement.find(".full-body").slideDown(speed);
                parentelement.find(".social_media_icons.job").slideDown(speed);
                parentelement.find("span.read-more").slideUp(speed);
                progressbaranimation();
            } else if ($(this).hasClass('show')) {
                $(this).removeClass('show').addClass('hide');
                var parentelement = $(this).parent("ul").parent(".nav-buttons").parent(".field-container");
                parentelement.removeClass('show').addClass('hide');
                parentelement.find(".block-fields").slideUp(speed);
                parentelement.find(".buttons-field").slideUp(speed);
                parentelement.find(".full-body").slideUp(speed);
                parentelement.find(".social_media_icons.job").slideUp(speed);
                parentelement.find("span.read-more").slideDown(speed);
            }
        });
    });



    $(".roll-with-description").each(function () {
        $(this).click(function () {
            if ($(this).hasClass("show")) {
                $(this).removeClass("show").addClass("hide");
                $(this).find(".description").slideUp(speed);
            } else if ($(this).hasClass("hide")) {
                $(this).removeClass("hide").addClass("show");
                $(this).find(".description").slideDown(speed);
            }
        });
    });

     $(".field-container").removeClass('hide').addClass('show');
});
