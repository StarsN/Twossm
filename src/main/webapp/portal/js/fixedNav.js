;(function($) {

  $.fn.fixedNav = function(ops) {

    var $w = $(window),
        options = ops || {},        
        nav = this,
        $e = $(this),
        $wrap = null,
        navCls = ops.navCls || 'fixed_top',
        callback = ops.callback || function() {},
        itemCallback = ops.itemCallback || function() {},
        //$scope = $('.' + ops.renderCls) || '',
        //$item = $('.' + ops.itemCls) || '',
        inRender = false;


    function init() {

        $wrap = $('.nav_menu_wrap');
        $wrap.height($wrap.height());
        itemCallback();

    }

    function fixed() {

        var wt = $w.scrollTop(),
            wb = wt + $w.height(),
            et = $wrap.offset().top,
            eb = et + $wrap.height();

        inRender = eb >= wt && et <= wb;
        return eb >= wt && et <= wb;
    }

//  function render() {
//
//      var wb = $w.scrollTop(),
//          et = $scope.offset().top,
//          bt = $('.nav_menu_wrap').offset().top;
//          
//      return wb >= et && bt <= wb;
//  }


    function main() {

        if ($('.nav_menu_wrap').offset().top <= $(window).scrollTop()) {


            if (!fixed() && !$e.hasClass(navCls)) {
                $e.addClass(navCls);
            } else if (fixed() && $e.hasClass(navCls)) {
                $e.removeClass(navCls);
            }

        }
    }

//  function checkItem() {
//
//      var wt = $w.scrollTop(),
//          wb = wt + $w.height();
//
//      $.each($item, function(index, obj) {
//
//          
//          var et = $(obj).offset().top - $wrap.height();
//
//          if (wt >= et) {
//              $e.find('a').removeClass('active').eq(index).addClass('active');
//          }
//
//      });
//  }




    $w.on("scroll", function() {

        //render();
        main();
        //checkItem();

        if ($('.nav_menu_wrap').offset().top <= $(window).scrollTop()) {
            if (!inRender) {
            	$e.addClass(navCls);               
            }
        } else {
            $e.removeClass(navCls);
        }

    });

    init();
    
    return nav;

  };

})(window.jQuery || window.Zepto);