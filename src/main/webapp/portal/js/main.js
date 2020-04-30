$(function(){
	
	/*底部选项选择*/
	$('.footer ul li').on('click', function() {
		$(this).addClass('curr').siblings().removeClass('curr');
	});
})

//判断是否登录
	  $(document).ajaxComplete(function(event,xhr,options){
		  if(xhr.responseText.indexOf('"code":"007"')>0){
			  window.location.href="/sjsc/jsp/component/portal/JSP/login/login.jsp?isBack=ajaxBack";
		  };
	  });

//js判断当前页面是否微信浏览器打开
function isWeixin(){
    var ua = navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i)=="micromessenger") {
        return true;
    } else {
        return false;
    }
}

//js判断密码是否满足 数字、小写、大写、特殊符号（,.~!@#$%^&*），4选3
function checkPassworkReg(v){
	var re1 = /[a-z]/g;
    var re2 = /[A-Z]/g;
    var re3 = /[0-9]/g;
    var re4 = /[,.~!@#$%^&*]/g;
    var r1 = re1.test(v);
    var r2 = re2.test(v);
    var r3 = re3.test(v);
    var r4 = re4.test(v);
    var r5 = v.length>=8&&v.length<=20;
    if ((r1  && r3 && r4 && r5)|| (r2  && r3 && r4 && r5)||(r1  && r2 && r4 && r5)||(r1  && r2 && r3 && r5)){
        return true;
    }else{
    	return false;
    }
 } 