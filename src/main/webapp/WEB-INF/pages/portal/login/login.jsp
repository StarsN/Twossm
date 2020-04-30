<%@ page language="java" import="java.util.*,java.net.URLDecoder" pageEncoding="utf-8"%>
<%
	//获取请求上下文
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<meta content="email=no" name="format-detection">
	<title></title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/css/base.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/css/style.css"/>
	<script src="<%=basePath%>portal/js/adaptive.js"></script>
	<script>
		// 设计图宽度
		window['adaptive'].desinWidth = 750;
		// body 字体大小
		window['adaptive'].baseFont = 18;

		// 显示最大宽度
		window['adaptive'].maxWidth = 750;

		// 初始化
		window['adaptive'].init();
	</script>
</head>
<body>

<div class="container bgfff">

	<!--
        如果有底部菜单栏：pb98s
    -->
	<div class="content">


		<!--
            登录
        -->
		<div class="loginPage" id="loginPage">
			<form id="real_id_form_login" action="<%=basePath%>member/login" method="post">
				<div class="login">
					<div class="login_itemBox">
						<div class="login_item">
							<input type="tel" name="phoneNumber" id="phoneNumber" value="" class="lo_input loTel" placeholder="请输入手机号码">
							<span class="error" style="color: red;font-size: 0.22rem" id="phoneError"></span>
						</div>
						<div class="login_item pwdStyle">
							<input type="password" name="" id="pwd" value="" class="lo_input loPwd password" placeholder="请输入密码">
							<input type="hidden" name="password" id="password" value=""  class="common_input" autocomplete="off"/>
							<span class="error" style="color: red;font-size: 0.22rem" id="passwordError"></span>
						</div>
						<!--
						验证码登录：默认隐藏
					-->
						<div class="login_item codeStyle" hidden>
							<input type="text" name="" id="sms_code" value="" class="lo_input loCode" placeholder="请输入验证码"/>
							<span class="error" style="color: red;font-size: 0.22rem" id="codeError"></span>
							<div class="frcode">
								<input type="button" id="getCode" name="" value="获取验证码" class="btn_getMsgcode">
							</div>
						</div>
					</div>

<%--				<p class="eroTip">错误提示语！</p>--%>

					<div class="login_bottom">
						<div class="checkList">
							<input type="checkbox" name="" id="" value="" class="form_check">
							<span>我已阅读</span>
							<a href="javascript:showDelPop()" class="lg_rule">《手机商城用户注册协议》</a>
						</div>
						<div class="login_item">
						<!--
                            交互，输入信息后，登录按钮去掉class.btn_login_gray 登  录
                        -->
							<input type="button" name="" id="login" value="登  录" class="btn_login">
							<input type="button" name="" id="sms_login" value="登  录" class="btn_login" style="display:none"><br>
						</div>

						<div class="login_tip">
							<a href="#" class="fl">新用户注册</a>
							<a href="<%=basePath%>login/returnForgetPage" class="fr">忘记密码</a>
						</div>
					</div>
				</div>
			</form>
			<!--
                或从以下方式登录
            -->
			<div class="wechat_login" style="display: block">
				<span>或从以下方式登录</span>
				<div class="wechat_tip" style="display: block">
					<!--
                        微信登录方式
                    -->
<%--					<a href="javascript:void(0);" id="wechatLogin" class="wechat_login_img">--%>
<%--						<img src="<%=basePath%>portal/images/new_pdimg/icon_weixin.png" width="50" height="50">--%>
<%--						<p>微信登录</p>--%>
<%--					</a>--%>
					<!--
                        验证码登录方式
                    -->
					<a href="javascript:void(0);" id="miniprogramLogin" class="wechat_login_img lgStyle_Formsg">
						<img src="<%=basePath%>portal/images/new_pdimg/newicon_appEmail.png" width="50" height="50">
						<p>短信验证码登录</p>
					</a>
					<a href="javascript:void(0);" id="passwordLogin" class="wechat_login_img lgStyle_Formsg" style="display:none">
						<img src="<%=basePath%>portal/images/new_pdimg/newico_plogin.png" width="50" height="50">
						<p style="font-size: .24rem;color: #999;padding-top: .2rem;">账号密码登录</p>
					</a>
				</div>
			</div>
		</div>
		<!--
            end 登录
        -->
	</div>
</div>


<!--
    透明背景
-->
<div class="flexBg" style="display: none;"></div>

<!--
    协议弹窗
-->
<div class="popMod popRule" id="popRule" style="display: none;">
	<h2 class="rule_title">手机商城协议</h2>
	<div class="rule_info">
		<strong>一、 本站服务条款的确认和接纳</strong>
		<p>本站的各项电子服务的所有权和运作权归本站。本站提供的服务将完全按照其发布的服务条款和操作规则严格执行。您同意所有本站发布的服务条款和操作规则的约定，并接受《中国移动网上商城会员章程》（“《会员章程》”）完成注册程序，才能成为本站的正式用户。您确认：本《会员章程》内容是处理双方权利义务的约定，除非违反国家强制性法律，否则始终有效。在注册成为本站的正式用户的同时，您也同时承认了您拥有签署、履行本《会员章程》中的各项规定（包括但是不限于购买这些产品）的权利能力和行为能力，并且您对于您所提供的所有信息的真实性负责。</p>
		<strong>二、 服务简介</strong>
		<p>本站运用自己的操作系统通过国际互联网络为用户提供网络服务。同时，用户必须：<br/>
			(1)自行配备上网的所需设备，包括个人电脑、调制解调器或其它必备上网装置。<br/>
			(2)自行负担个人上网所支付的与此服务有关的电话费用、网络费用。<br/>
			基于本站所提供的网络服务的重要性，用户应同意<br/>
			(1)提供详尽、准确的个人资料。<br/>
			(2)不断更新注册资料，符合及时、详尽、准确的要求。<br/>
			本站保证不公开用户的真实姓名、地址、电子邮箱和联系电话等用户信息， 除以下情况外：<br/>
			(1)用户授权本站透露这些信息。<br/>
			(2)相应的法律及程序要求本站提供用户的个人资料。<br/>
			为更好的为您提供会员服务，本站可能会委托相关合作方向您提供一部分会员服务而无须经过您的同意或特别告知您；对此，你完全理解并予以同意。</p>
		<strong>三、 价格和数量</strong>
		<p>本站将尽最大努力保证您所购商品的价格与网站上公布的价格一致。 产品的信息都在本站上指明，您同意并知晓这类信息将可能随时更改。 您所订购的商品，如果发生缺货，您有权取消订单。</p>
		<strong>四、商品信息</strong>
		<p>本站的商品价格、数量、是否有货等商品信息随时都有可能发生变动，本站将不作特别通知。由于网站上商品信息的数量极其庞大，虽然本站会尽最大努力保证您所浏览商品信息的准确性，但由于众所周知的互联网技术因素等客观原因存在，本站网页显示的信息可能会有一定的滞后性或差错，对此情形请您知悉并理解，并不要求本站对此承担任何责任；本站欢迎纠错，并会视情况给予纠错者一定的奖励。</p>
		<strong>五、订单</strong>
		<p>在您下订单时，请您仔细确认所购商品的名称、价格、数量、型号、联系地址、电话、收货人等信息。收货人与用户本人不一致的，收货人/用户的行为和意思表示视为用户/收货人的行为和意思表示，用户/收货人应对收货人/用户的行为及意思表示的法律后果承担连带责任。 除法律另有强制性规定外，双方约定如下： 本站中销售方展示的商品和价格等信息仅仅是要约邀请，您下单时须填写您希望购买的商品数量、价款及支付方式、收货人、联系方式、收货地址（合同履行地点）、合同履行方式等内容；系统生成的订单信息是计算机信息系统根据您填写的内容自动生成的数据，仅是您向销售方发出的合同要约；销售方收到您的订单信息后，只有在销售方将您在订单中订购的商品从仓库实际直接向您发出时（以订单状态已发货为标志），方视为您与销售方之间就实际直接向您发出的商品建立了合同关系；如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了合同关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品才成立合同关系。您可以随时登录您在本站注册的账户，查询您的订单状态。 终端合约类商品属于特殊商品，在您完成下单支付，合约生效后，即视为您与销售方之间形成了合同关系，合约生效方式和时间以销售方在商品页的说明为准，您在进行下单支付后即视为已认同销售方关于合约类商品的合同生效方式，并建立双方的合同关系。 由于市场变化及各种以合理商业努力难以控制的因素的影响，本站无法保证您提交的订单信息中希望购买的商品都会有货；如您拟购买的商品， 发生缺货，您有权取消订单，且不会向本站主张任何权利或者要求任何赔偿。</p>
		<strong>六、 送货</strong>
		<p>本站将会把产品送到您所指定的送货地址。所有在本站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，本站将无法承担迟延配送的责任：<br/>
			(1)客户提供错误信息和不详细的地址；<br/>
			(2)货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果;<br/>
			(3)不可抗力，例如：自然灾害、交通戒严、突发战争等;<br/>
			(4)法定及特殊节假日期间，物流商无法正常配送的。</p>
		<strong>七、 服务条款的修改</strong>
		<p>本站将可能不定期的修改本用户协议的有关条款，一旦条款及服务内容产生变动，本站将会在重要页面上提示修改内容。</p>
		<strong>八、 用户隐私制度</strong>
		<p>尊重用户个人隐私是本站的一项基本政策。所以，作为对以上第二条注册资料分析的补充，本站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本站中的非公开内容，但是相应的法律及程序要求本站提供用户的个人资料的情形除外。 您同意并认可本站可以通过邮件、短信、电话等形式，向您及您指定的收货人发送订单信息、促销活动等告知信息。</p>
		<strong>九、 用户的帐号，密码和安全性</strong>
		<p>用户一旦注册成功，成为本站的合法用户，将得到一个密码和用户名。您可随时根据指示改变您的密码。用户需谨慎合理的保存、使用用户名和密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通知本站和向公安机关报案。为保护您的权益，您在设定用户名和密码时，请勿使用重复性或者连续数字的简单密码；请勿将密码告知他人，因用户名、密码保管不善而造成的经济损失由您自行承担。您需要对通过您的账户中所进行的活动和事件负全责。非经本站事先同意，用户名和密码不得出借、转让、继承或者赠与。</p>
		<strong>十、对用户信息的存储和限制</strong>
		<p>如果用户违背了国家法律法规规定或本协议约定，本站有视具体情形随时单方中止或终止对其提供网络服务的权利。</p>
		<strong>十一、用户管理</strong>
		<p>本协议依据国家相关法律法规规章制定，用户同意严格遵守以下条款：<br/>
			(1)从中国境内向外传输技术性资料时必须符合中国有关法规。<br/>
			(2)不利用本站从事非法活动。<br/>
			(3)不干扰或混乱网络服务。<br/>
			(4)遵守所有使用网络服务的网络协议、规定、程序和惯例。<br/>
			用户须承诺不传输任何违法犯罪的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽的、不文明的等信息资料；不传输损害国家社会公共利益和涉及国家安全的信息资料；不传输教唆他人从事本条所述行为的信息资料。 未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p>
		<strong>十二、第三方链接</strong>
		<p>本站可能包括指向第三方网站的链接（下称"链接网站"）。"链接网站"非由中国移动所控制，对于任何"链接网站"的内容，包括但不限于"链接网站"内含的任何链接，或"链接网站"的任何改变或更新，中国移动均不予负责。自"链接网站"接收的网络传播或其它形式之传送，中国移动也不予负责。中国移动在域名上提供这些链接仅为了您的便利所设，加入任何链接不表示中国移动与这些网站经营者有任何关连。您有责任查阅并遵守"链接网站"上登载的隐私声明及使用规定。</p>
		<strong>十三、风险提示</strong>
		<p>移动商城服务是免费和有偿并存。中国移动明确表示不对其服务提供任何类型的担保，不论是明确的或隐含的。既不担保服务一定能满足用户的要求，也不担保服务不会受中断。用户应对此予以充分理解并接受，同意就任何信息资料(下载或通过中国移动服务取得)丢失，以及由于系统受损而产生的所有风险和责任，均由用户自己承担。 用户通过移动商城进行交易、获取有偿服务而发生的所有税费及有关费用，均由用户负责支付。因此产生的风险也由用户个人承担。中国移动提醒用户应该通过自己的谨慎判断确定登录物品及相关信息的真实性、合法性和有效性。</p>
		<strong>十四、通告</strong>
		<p>所有发给用户的通告都可通过重要页面的公告或者其他本站认为适宜的方式予以传送。用户协议条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p>
		<strong>十五、网络服务内容的所有权</strong>
		<p>本站定义的网络服务内容包括：文字、软件、声音、图片、录象、图表、广告中的全部内容；电子邮件的全部内容；本站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者和本站授权。</p>
		<strong>十六、责任限制</strong>
		<p>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并尽最大努力使客户免受损失。</p>
		<strong>十七、法律管辖和适用</strong>
		<p>本协议的订立、执行和解释及争议的解决均应适用中国法律。 如发生本站服务条款与中国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它有效条款继续有效。 如双方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均可向人民法院提起诉讼。</p>
	</div>
	<div class="bBtn">
		<a href="javascript:;" class="popSure">确 定</a>
	</div>
</div>



<script type="text/javascript" src="<%=basePath%>portal/js/jquery-3.2.1.min.js" ></script>
<script type="text/javascript" src="<%=basePath%>portal/js/function.js" ></script>
<script type="text/javascript">

	/*
  * 规则弹窗
  */
	function showDelPop(){
		$('.flexBg,#popRule').show();
	}

	/*
     * 关闭规则弹窗
     */
	$('.popSure').on('click',function(){
		$('#popRule,.flexBg').hide();
	});



	/*记住账号*/
	$('.checkList').on('click', function() {
		var _el = $(this);
		_el.find('.form_check').toggleClass('form_checkOn');
		if(_el.find('.form_check').hasClass('form_checkOn')) {
			_el.find('.form_check').attr('checked', true);
		} else {
			_el.find('.form_check').attr('checked', false);
		}
	});

	/*验证码登录*/
	// $('.lgStyle_Formsg').on('click',function(){
	// 	$('.codeStyle').show();
	// 	$('.pwdStyle').hide();
	// })
	$('#miniprogramLogin').on('click',function(){
		$('.codeStyle').show();
		$('.pwdStyle').hide();
		$("#miniprogramLogin").hide();
		$("#passwordLogin").show();
		$("#login").hide();
		$("#sms_login").show()
	})
	$('#passwordLogin').on('click',function(){
		$('.codeStyle').hide()
		$('.pwdStyle').show()
		$("#miniprogramLogin").show();
		$("#passwordLogin").hide();
		$("#login").show();
		$("#sms_login").hide();
	})

	//获取倒计时
	$(function() {
		var wait = 60;

		function time(obj) {
			if(wait == 0) {
				obj.className = 'btn_getMsgcode';
				obj.removeAttribute("disabled");
				obj.value = "获取验证码";
				wait = 60;
			} else {
				obj.className = 'btnCodeMsgDisabled'; //按钮变灰，不可点击
				obj.setAttribute("disabled", true);
				obj.value = "重新发送(" + wait + ")";
				wait--;
				setTimeout(function() {
							time(obj)
						},
						1000)
			}
		}
		document.getElementById("getCode").onclick = function() {
			var flag = checkPhone2();
			if(flag){
				var mobile = $("#phoneNumber").val();
				console.log("<%=basePath%>intelligentLink/sendVcode");
				$.ajax({
					url:"<%=basePath%>intelligentLink/sendVcode",
					<%--url:"<%=basePath%>login/returnRegisterPage",--%>
					data: {"mobile":mobile,},//传入后台参数
					type:"POST",
					dataType:'json',
					success:function(data){
						if ("1001" == data.code) {
							//发送成功
							layer.open({content: data.desc,time: 2 ,skin: 'msg'});
						} else if("1101" == data.code){
							//操作频繁
							layer.open({content: data.desc,time: 2 ,skin: 'msg'});
							wait = 0;
						}else {
							//发送失败
							layer.open({content: '验证码发送失败，请重新发送',time: 2,skin: 'msg'});
						}
					}
				});
				time(this);
			}
		}
	})

	function checkPhone2(){
		var phoneNumber=document.getElementById("phoneNumber").value;
		var s=document.getElementById("phoneError");
		var Reg=/^1[3456789]\d{9}$/;//手机号码格式
		if(phoneNumber==""){
			s.innerHTML="*请先输入手机号码";
			return false;
		} else{
			if(!Reg.test(phoneNumber)){
				s.innerHTML="*手机号码格式不正确";
				return false;
			}else{
				s.innerHTML="";
				return true;
			}
		}

	}

	//登录步骤开始
	//手机号码验证  是否注册过
	var phoneflag=true;
	function checkPhone(){
		var phoneNumber=document.getElementById("phoneNumber").value;
		var s=document.getElementById("phoneError");
		var phoneflag1=true;
		var phoneflag2=true;
		var Reg=/^1[3456789]\d{9}$/;//手机号码格式
		if(phoneNumber==""){
			s.innerHTML="*请先输入手机号码";
			phoneflag1=false;
			phoneflag=false;
			return phoneflag;
		} else{
			if(!Reg.test(phoneNumber)){
				s.innerHTML="*手机号码格式不正确";
				phoneflag2=false;
				phoneflag=false;
				return phoneflag;
			}else{
				s.innerHTML="";
				phoneflag=true;
			}
		}

	}

	//blur失去焦点时触发事件！
	$("#phoneNumber").blur(function(){
		checkPhone();
	});

	//密码登录
	$('#login').click(function () {
		//手机号验证
		checkPhone();
		//密码验证
		var passflag=false;
		var password = $(".password").val();//改为这个，2018-6-1 16:38:41，@choy
		var p1error = $("#passwordError");
		var Reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$/;//密码正则表达式，8-20的字母数字组合
		if(password==""){
			p1error.html("*请先输入密码")
		}
		else {
			/* if(!Reg.test(password)){
                p1error.html("*密码格式不正确");
            }else{ */
			passflag=true;
			p1error.html("");
			//}
		}
		var Protocol = false;
		if (phoneflag&&passflag) {
			//校验电子协议
			if(!$("input[type='checkbox']").is(':checked')){
				layer.open({
					content: '请接受中国移动用户注册协议！'
					,time: 3
					,skin: 'msg'
				});
			}else{
				Protocol=true;
			}
		}
		if(phoneflag&&passflag&&Protocol){
			console.log("正在登录")
			// 提交数据
			var index = layer.open({
				type: 2
				,content: '加载中...'
			});
			//赋值密码
			$("#password").val($.md5( $.md5( $.md5($(".password").val()))));
			console.log($("#password").val())
			$.ajax({
				url:"<%=basePath%>member/login",
				type:"POST",
				dataType:'json',
				data:{"phoneNumber":$("#phoneNumber").val(),"password":$("#password").val()},
				success:function(result){
					layer.close(index);//关闭加载层
					// var result = eval('('+result+')');
					console.log(result);
					if ("0" == result.code) {
						console.log("登录成功")
						layer.close(index);//关闭加载层
						window.location.href="<%=basePath%>member/returnPersonCenterPage";
					} else if(result.code=="2"){
						console.log("强制修改密码")
						layer.close(index);//关闭加载层
						window.location.href="<%=basePath%>member/returnChangePwdPage";
					} else{
						console.log("密码错误")
						layer.open({content:result.msg,skin:"msg",time:3});
					}
				},
				error:function(e){
					console.log("登录异常")
					layer.close(index);//关闭加载层
					layer.open({content:"登录异常："+e,skin:"msg",time:3});
				}
			});
			// $("#real_id_form_login").submit();
			// $('#real_id_form_login').ajaxSubmit({
			// 	dataType:'json',
			// 	data: {"sCode":$("#sCode").val(),},
			// 	success:function (result) {
			// 		var result = eval('('+result+')');
			// 		if ("0" == result.code) {
			// 			console.log("登录成功")
			// 			// window.location.href="";
			// 		} else if(result.code=="2"){
			// 			console.log("强制修改密码")
			// 		} else{
			// 			console.log("密码错误")
			// 		}
			// 	},
			// 	error:function () {
			// 		layer.open({content: '登录失败' ,time: 3,skin: 'msg' });
			// 	},complete:function(){
			// 		layer.close(index);//关闭加载层
			// 	}
			// });
		}
	});

	//验证码登录
	$('#sms_login').click(function () {
		var flag = checkPhone2();
		if(flag) {
			var mobile = $("#phoneNumber").val();
			var smsCode = $("#sms_code").val();
			var s = document.getElementById("codeError");
			if (smsCode == "") {
				s.innerHTML = "*请先输入验证码";
			} else {
				s.innerHTML = "";
				if(!$("input[type='checkbox']").is(':checked')){
					layer.open({
						content: '请接受中国移动用户注册协议！'
						,time: 3
						,skin: 'msg'
					});
				}else {
					$.ajax({
						url: "<%=basePath%>intelligentLink/sms_login",
						data: {'mobile': mobile, 'smsCode': smsCode},
						type: 'post',
						dataType: 'json',
						success: function (result) {
							//登录成功
							if (result.code == 0) {
								console.log("验证码登录成功")
								window.location.href="<%=basePath%>personalCenter/returnPersonalCenterPage";
							} else {
								layer.open({content: result.desc, skin: "msg", time: 1});
							}
						},
						error: function () {
							layer.open({content: "服务器出错", skin: "msg", time: 1});
						}
					});
				}
			}
		}
	})
</script>
</body>
<link rel="stylesheet" type="text/css" href="<%=basePath%>portal/js/layer/mobile/need/layer.css">
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.3.2.js"></script>
<script type="text/javascript" src="<%=basePath%>portal/js/layer/mobile/layer.js"></script>
<script src="<%=basePath%>portal/js/jquery/jquery.form.js"></script>
<script src="<%=basePath%>portal/js/main.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/md5.js" type="text/javascript"></script>
<script src="<%=basePath%>portal/js/itlogin-jssdk.js" type="text/javascript"></script>
</html>
