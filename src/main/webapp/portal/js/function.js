$(function() {
	//	   ;(function(){ //移动端快速点击
	//		 var isTouch = ('ontouchstart' in document.documentElement) ? 'touchstart' : 'click', _on = $.fn.on;
	//		 $.fn.on = function(){
	//		 arguments[0] = (arguments[0] === 'click') ? isTouch: arguments[0];
	//			return _on.apply(this, arguments);
	//			};
	//		})();					

	//绑定移动端a：active效果
	document.body.addEventListener('touchstart', function() {});
	
	/*公告文字滚动*/
	$('.d-notice-bar_content').each(function(){
		var tEl = $(this);
		var nLength = tEl.width();
		var dWidth = tEl.parent('.d-notice-bar_word').width();
		if(dWidth<nLength){
			var dTime = ((nLength / dWidth) * 7);
			tEl.css({
			  "padding-left":parseInt(dWidth+5)+'px',
			  "animation-delay":"0s",
			  "animation-duration": dTime+"s"
			});
			tEl.addClass('notice_play');
		} else{
			tEl.css({
			  "padding-left":"",
			  "animation-delay":"",
			  "animation-duration":""
			});
			tEl.removeClass('notice_play');
		}
	})	

	/*点击搜索框隐藏提示*/
//	$('.container').on('click','.sTipsBox', function(){
//		var el = $(this);
//		el.find('span').hide();
//		el.siblings('.re_field').removeAttr('readonly').focus();
//	});
//	/*搜索框如果是空的则显示提示*/
//	$('.container').on('blur','.re_field',function(){
//		var el = $(this);
//		if(el.val()=='' || el.val()==undefined){
//			el.attr('readonly','readonly').siblings('.sTipsBox').show();	
//		} 
//	});
});