$(function(){
    var type;
    $("#myform").submit(function(){
        return false;
    });

    checkForm = function(){
        var reg = /^[0-9a-zA-Z]+$/;
        var name = $("#username").val();
        var password = $("#password").val();
        var password_re = $("#password_re").val();
        if(!checkName(name)){
            $("#myform")[0].reset();
            alert("用户名未输入或不符合规范");
            return;
        }
        if(!checkPassword(password,false)){
            $("#myform")[0].reset();
            alert("密码未填写或不符合规范");
            return ;
        }
        if(!checkPassword(password_re,true)){
            $("#myform")[0].reset();
            alert("两次密码不相符");
            return ;
        }

        var param = {
            name:name,
            password:password,
            password_re:password_re
        };

        $.ajax({
            url: '/rck/doRegister',
            data: param,
            type: 'POST',
            async:false,
            success: function (result) {
                var rs = JSON.parse(result);
                type = rs.type;
                console.log(type);
                if((typeof  type !=undefined)&&type==-1){
                    $("#myform")[0].reset();
                    
                }else{
                	alert('注册成功');
                }
            },
            error:function(){
                alert('注册失败');
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
            $(".usernameInfo").text("用户名已被注册").css({
                "display":"",
                "color":"#fb2e55"
            });
            type=undefined;
        }else{
            $(".usernameInfo").text("建议以学号作为用户名,长度至少为6位").css({
                "display":"",
                "color":"#999"
            });
        }

        $(".loginInputArea span").removeClass("glyphicon-ok").removeClass("glyphicon-remove");
    }).bind("blur",function(){
        $(".loginInputArea").css({
            "border": "1px solid rgb(204,204,204)"
        });
        var name = $("#username").val().trim();
        if(!checkName(name)){
            $(".usernameInfo").css("display","none");
            $(".usernameErrorInfo").css("display","");
            $(".loginInputArea span").removeClass("glyphicon-ok").addClass("glyphicon-remove");
        }else{
            $(".usernameInfo").css("display","none");
            $(".usernameErrorInfo").css("display","none");
            $(".loginInputArea span").removeClass("glyphicon-remove").addClass("glyphicon-ok");
        }
    }).bind("input",function(){
        if($("#username").val().trim()==''){
            $(".usernameInfo").css("display","");
            $(".usernameErrorInfo").css("display","none");
        }else{
            $(".usernameInfo").css("display","none");
            $(".usernameErrorInfo").css("display","none");
        }
    });
    $("#password").bind("focus",function(){
        $(".passwordArea").css({
            "border-color": "#66afe9",
            "outline": "0",
            "-webkit-box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
            "box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
        });
        $(".passwordInfo").css("display","");
        $(".passwordArea span").removeClass("glyphicon-ok").removeClass("glyphicon-remove");
    }).bind("blur",function(){
        $(".passwordArea").css({
            "border": "1px solid rgb(204,204,204)"
        });
        var password = $("#password").val().trim();
        if(!checkPassword(password,false)){
            $(".passwordErrorInfo").css("display","");
            $(".passwordInfo").css("display","none");
            $(".passwordArea span").removeClass("glyphicon-ok").addClass("glyphicon-remove");
        }else{
            $(".passwordInfo").css("display","none");
            $(".passwordErrorInfo").css("display","none");
            $(".passwordArea span").removeClass("glyphicon-remove").addClass("glyphicon-ok");
        }
    }).bind("input",function(){
        if($("#password").val().trim()==''){
            $(".passwordErrorInfo").css("display","none");
            $(".passwordInfo").css("display","");
        }else{
            $(".passwordInfo").css("display","none");
            $(".passwordErrorInfo").css("display","none");
        }
    });
    $("#password_re").bind("focus",function(){
        $(".password_reArea").css({
            "border-color": "#66afe9",
            "outline": "0",
            "-webkit-box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
            "box-shadow": "inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)",
        });
        $(".password_reInfo").css("display","");
        $(".password_reArea span").removeClass("glyphicon-ok").removeClass("glyphicon-remove");
    }).bind("blur",function(){
        $(".password_reArea").css({
            "border": "1px solid rgb(204,204,204)"
        });

        var password_re = $("#password_re").val().trim();
        if(!checkPassword(password_re,true)){
            $(".password_reInfo").css("display","none");
            $(".password_reErrorInfo").css("display","");
            $(".password_reArea span").removeClass("glyphicon-ok").addClass("glyphicon-removee");
        }else{
            $(".password_reInfo").css("display","none");
            $(".password_reErrorInfo").css("display","none");
            $(".password_reArea span").removeClass("glyphicon-remove").addClass("glyphicon-ok");
        }
    }).bind("input",function(){
        if(checkPassword($("#password_re").val().trim(),true)){
            $(".password_reArea span").removeClass("glyphicon-remove").addClass("glyphicon-ok");
        }
        if($("#password_re").val().trim()==''){
            $(".password_reInfo").css("display","");
            $(".password_reErrorInfo").css("display","none");
        }else{
            $(".password_reInfo").css("display","none");
            $(".password_reErrorInfo").css("display","none");
        }
    });

    $(".glyphicon").click(function(){
        if($(this).hasClass("glyphicon-remove")){
            $(this).parent().find("input").val("");
        }
    });

    checkName = function(name){
        if(name=='')    return false;
        var reg = /^[0-9a-zA-Z]+$/;
        if(!reg.test(name)){
            return false;
        }
        if(name.length<6){
            return false;
        }
        return true;
    };
    checkPassword = function(password,flag){
        if(password=='')    return false;
        var reg = /^[0-9a-zA-Z]+$/;
        if(!reg.test(password)){
            return false;
        }
        if(password.length<6||password.length>20){
            return false;
        }
        if(flag==true){
            if(password!=$("#password").val().trim()){
                return false
            }
        }
        return true;
    };

});