$(function(){
	
	var type;

  	$("#myform").submit(function(){
            return false;
    });

    checkForm = function(){
        var reg = /^[0-9a-zA-Z]+$/;
        var name = $("#username").val();
        var password = $("#password").val();
        var codeText = $("#codeText").val();
        var flag = true;
        if(name.trim().length==0||name.trim().length<6){
        	 $("#myform")[0].reset();
            alert("用户名未填写或过短");
            flag = false;
            return;
        }
        if(!reg.test(name)){
        	 $("#myform")[0].reset();
            alert("用户名不是数字或者字母");
            flag = false;
            return;
        }
        if(password.trim().length==0||password.trim().length<6){
        	 $("#myform")[0].reset();
            alert("密码未填写或过短");
            flag = false;
            return;
        }
        if(!reg.test(password)){
        	 $("#myform")[0].reset();
            alert("密码不是数字或者字母");
            flag = false;
            return;
        }
        if(codeText.trim()==''){
       		$("#myform")[0].reset();
            alert("验证码未填写");
            flag = false;
            return;
        }
        
        if(flag == false)  return;

        var param = {
        	name:name,
        	password:password,
        	codeText:codeText
        };


		   $.ajax({
               url: '/rck/doLogin',
               data: param,
               type: 'POST',
               async:false,
               success: function (result) {
               	var rs = JSON.parse(result);
                   type = rs.type;
                   if((typeof  type !=undefined)&&type==-1){
                		 $("#myform")[0].reset();
                		 freshCode($(".codeImgArea img"));
                   }else if((typeof  type !=undefined)&&type==-2){
                       $(".codeTextInfo").text("验证码有误").css("display","");
                       	$("#myform")[0].reset();
                       	freshCode($(".codeImgArea img"));
                   }else if((typeof  type !=undefined)&&type==1){
                      window.location.href="/rck/indexJump";
                   }

//            	 	console.log(rs.msg);
               },
               error:function(){
             	  	alert('登陆失败');
             	  	freshCode($(".codeImgArea img"));
               }
           });	   
    };
    
   
    $("#username").bind("focus",function(){
        $(".loginInputArea").css({
            "border-color": "#66afe9",
            "outline": "0",
            "-webkit-box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
            "box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
        });
        if((typeof  type !=undefined)&&type==-1){
            $(".usernameInfo").text("用户名或密码有误").css("display","");
			 type=undefined;
        }else{
            $(".usernameInfo").text("请输入您的登录名").css("display","none");
        }

    }).bind("blur",function(){
        $(".loginInputArea").css({
            "border": "1px solid rgb(204,204,204)"
        });
        if($("#username").val().trim()==''){
            $(".usernameInfo").css("display","");
        }else{
            $(".usernameInfo").css("display","none");
        }
    });
    $("#password").bind("focus",function(){
        $(".passwordArea").css({
            "border-color": "#66afe9",
            "outline": "0",
            "-webkit-box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
            "box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
        });
        $(".passwordInfo").text("请输入密码").css("display","none");
    }).bind("blur",function(){
        $(".passwordArea").css({
            "border": "1px solid rgb(204,204,204)"
        });
        if($("#password").val().trim()==''){
            $(".passwordInfo").css("display","");
        }else{
            $(".passwordInfo").css("display","none");
        }
    });
    $("#codeText").bind("focus",function(){
        $(".codeTextArea").css({
            "border-color": "#66afe9",
            "outline": "0",
            "-webkit-box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
            "box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
        });
        $(".codeTextInfo").text("请输入验证码").css("display","none");
    }).bind("blur",function(){
        $(".codeTextArea").css({
            "border": "1px solid rgb(204,204,204)"
        });
        if($("#codeText").val().trim()==''){
            $(".codeTextInfo").css("display","");
        }else{
            $(".codeTextInfo").css("display","none");
        }
    });
});

function freshCode(obj){
    $(obj).attr("src","/rck/getImageCode?time="+Math.random());
}