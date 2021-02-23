/*!
 * jQuery goTop v2.0.0 (https://github.com/scottdorman/jquery-gotop)
 * Copyright 2015 Scott Dorman (@sdorman)
 * Licensed under MIT (https://github.com/scottdorman/jquery-gotop/blob/master/LICENSE)
 * Adapted from goUp originally developed by Roger Vila (@_rogervila)
 */
(function ($) {
    $.fn.goTop = function (options) {

        $.fn.goTop.defaults = {
            container: '',
            appear: 200,
            scrolltime: 800,
            src: "fas fa-chevron-up",
            width: 45,
            place: "right",
            color: '',
            fadein: 500,
            fadeout: 500,
            opacity: 0.5,
            marginX: 2,
            marginY: 2,
            zIndex: 9
        };

        var opts = $.extend({}, $.fn.goTop.defaults, options);

        return this.each(function () {
            var g = $(this);
            g.html("<a id='goTopAnchor'><span id='goTopSpan' /></a>");

            var ga = g.children('a');
            var gs = ga.children('span');

            var css = {
                "position": "fixed",
                "display": "block",
                "width": "'" + opts.width + "px'",
                "z-index": opts.zIndex,
                "bottom": opts.marginY + "%"
            };

            css[opts.place === "left" ? "left" : "right"] = opts.marginX + "%";

            g.css(css);

            //opacity
            ga.css("opacity", opts.opacity);
            gs.addClass(opts.src);
            gs.css("font-size", opts.width);
            ga.css("color", opts.color);
            gs.hide();

            //appear, fadein, fadeout
            $(function () {
                $(opts.container || window).scroll(function () {
                    if ($(this).scrollTop() > opts.appear) {
                        gs.fadeIn(opts.fadein);
                    }
                    else {
                        gs.fadeOut(opts.fadeout);
                    }
                });

                //hover effect
                $(ga).hover(function () {
                    $(this).css("opacity", "1.0");
                    $(this).css("cursor", "pointer");
                }, function () {
                    $(this).css("opacity", opts.opacity);
                });

                //scrolltime
                $(ga).click(function () {
                    $('body,html').animate({
                        scrollTop: 0
                    }, opts.scrolltime);
                    return false;
                });
            });
        });
    };
})(jQuery);
