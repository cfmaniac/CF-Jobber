(function (e) {
    function t(e, t, n) {
        if (n) {
            var r = new Date;
            r.setTime(r.getTime() + n * 24 * 60 * 60 * 1e3);
            var i = "; expires=" + r.toGMTString()
        } else var i = "";
        document.cookie = e + "=" + t + i + "; path=/"
    }

    function n(e) {
        var t = e + "=";
        var n = document.cookie.split(";");
        for (var r = 0; r < n.length; r++) {
            var i = n[r];
            while (i.charAt(0) == " ") i = i.substring(1, i.length);
            if (i.indexOf(t) == 0) return i.substring(t.length, i.length)
        }
        return null
    }

    function r(e) {
        t(e, "", -1)
    }
    e.fn.styleSwitcher = function (r) {
        var i = {
            slidein: true,
            preview: false,
            container: this.selector,
            directory: "css/",
            useCookie: true,
            cookieExpires: 30,
            manageCookieLoad: true
        };
        var s = e.extend(i, r);
        if (s.useCookie && s.manageCookieLoad) {
            var o = n("style_selected");
            if (o) {
                var u = s.directory + o + ".css";
                e("link[id=color_css]").attr("href", u);
                a = u
            } else {}
        }
        if (s.slidein) {
            e(s.container).slideDown("slow")
        } else {
            e(s.container).show()
        }
        var a = e("link[id=color_css]").attr("href");
        if (s.preview) {
            e(s.container + " a").hover(function () {
                var t = s.directory + this.id + ".css";
                e("link[id=color_css]").attr("href", t)
            }, function () {
                e("link[id=color_css]").attr("href", a)
            })
        }
        e(s.container + " a").click(function () {
            var n = s.directory + this.id + ".css";
            e("link[id=color_css]").attr("href", n);
            a = n;
            if (s.useCookie) {
                t("style_selected", this.id, s.cookieExpires)
            }
        })
    };
	
	
/*	jQuery("#full-width").click(function () {
		   
		    var n = $("html").removeClass("boxed");
            a = n;
            if (s.useCookie) {
                t("box_selected", this.n, s.cookieExpires)
            }
        })
	jQuery("#box-width").click(function () {
			$("html").addClass("boxed");
			var n =  $("html").addClass("boxed");
			a = n;
			if (s.useCookie) {
				t("box_selected", this.n, s.cookieExpires)
			}
		})	*/


    jQuery(".predefined_styles").styleSwitcher();
	
	// Pattern Switcher
	
    e.fn.patternSwitcher = function (r) {
        var i = {
            slidein: true,
            preview: false,
            container: this.selector,
            directory: "css/",
            useCookie: true,
            cookieExpires: 30,
            manageCookieLoad: true
        };
        var s = e.extend(i, r);
        if (s.useCookie && s.manageCookieLoad) {
            var o = n("patt_selected");
            if (o) {
                var u = this.id ;
				e("html").removeClass("pattern_2");
				e("html").removeClass("pattern_3");
                e("html").addClass(o);
		        a = u
            } else {}
        }
        if (s.slidein) {
            e(s.container).slideDown("slow")
        } else {
            e(s.container).show()
        }
        var a = e("link[id=color_css]").attr("href");
        
        e(s.container + " a").click(function () {
            var n =  this.id ;
			e("html").removeClass("pattern_1");
			e("html").removeClass("pattern_2");
			e("html").removeClass("pattern_3");
		    e("html").addClass(n);
		    a = n;
            if (s.useCookie) {
                t("patt_selected", this.id, s.cookieExpires)
            }
        })
    };
	
		
    jQuery(".predefined_styles_bg").patternSwitcher();
	
	//
	
	// Layout Switcher
	
    e.fn.layoutSwitcher = function (r) {
        var i = {
            slidein: true,
            preview: false,
            container: this.selector,
            directory: "css/",
            useCookie: true,
            cookieExpires: 30,
            manageCookieLoad: true
        };
        var s = e.extend(i, r);
        if (s.useCookie && s.manageCookieLoad) {
            var o = n("layout");
		   if (o) {
                var u = this.id ;
				   e("html").addClass(o);
		        a = u
            } else {}
        }
        if (s.slidein) {
            e(s.container).slideDown("slow")
        } else {
            e(s.container).show()
        }
         e(s.container + " a").click(function () {
            var n =  this.id ;
			    e("html").addClass(n);
				if (n == "full-width") {
				   e("html").removeClass("boxed");	
				}
		    a = n;
            if (s.useCookie) {
                t("layout", this.id, s.cookieExpires)
            }
        })
    };
	
		
    jQuery(".predefined_styles_layout").layoutSwitcher();
	
	
    jQuery(".demo_changer .demo-icon").click(function () {
        if (jQuery(".demo_changer").hasClass("active")) {
            jQuery(".demo_changer").animate({
                left: "-180px"
            }, function () {
                jQuery(".demo_changer").toggleClass("active")
            })
        } else {
            jQuery(".demo_changer").animate({
                left: "0px"
            }, function () {
                jQuery(".demo_changer").toggleClass("active")
            })
        }
    })
	
})(jQuery)