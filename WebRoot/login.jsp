<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
    <link href="public/css/login.css" rel="stylesheet" type="text/css">
    <script src='public/js/jquery-2.1.4.min.js'></script>
    <script src='public/js/bootstrap.min.js'></script>
    <script src='public/js/login.js'></script>
</head>
<body>

    <div class="container-fluid">
        <div class="left">
            <img src="public/img/logo.png" alt="DHUCST科创中心LOGO">
        </div>
        <div class="right">
            <div class="bg"></div>
            <div class="area">
                <h4 class="header">
                    欢迎登陆
                    <span class="register">还没账号？点击<a href="register.jsp">这里</a>注册</span>
                </h4>
                <div class="loginArea">
                    <form class="form-horizontal" method="post" id="myform">
                        <div class="input-group loginInputArea">
                            <span class="glyphicon glyphicon-user input-group-addon"></span>
                            <input id="username" required="required" type="text" name="username" class="form-control loginInput" placeholder="学号/邮箱">
                        </div>
                        <div class="info">
                            <p class="usernameInfo" style="display: none">请输入您的登录名</p>
                        </div>
                        <div class="input-group passwordArea">
                            <span class="glyphicon glyphicon-lock input-group-addon"></span>
                            <input id="password" required="required" type="password" name="password" class="form-control passwordInput" placeholder="密码">
                        </div>
                        <div class="info">
                            <p class="passwordInfo" style="display: none">请输入密码</p>
                        </div>

                        <div class="codeArea">
                            <div class="input-group codeTextArea">
                                <span class="glyphicon glyphicon-sunglasses input-group-addon"></span>
                                <input id="codeText" required="required" type="text" name="codeText" class="form-control codeTextInput" placeholder="验证码">
                            </div>
                            <div class="input-group codeImgArea">
                                <img src="/rck/getImageCode" onclick="freshCode(this);">
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="info">
                            <p class="codeTextInfo" style="display: none">请输入验证码</p>
                        </div>
                        <div class="other input-group">
                            <input type="checkbox" name="rememberMe">&nbsp;一周内免登录 <a href="#">忘记密码?</a>
                        </div>
                        <button class="btn btn-default"  onclick="checkForm();"><span>登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</span></button>
                    </form>
                </div>

            </div>
        </div>
    </div>


</body>
</html>