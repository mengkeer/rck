<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
    <link href="public/css/register.css" rel="stylesheet" type="text/css">
    <script src='public/js/jquery-2.1.4.min.js'></script>
    <script src='public/js/bootstrap.min.js'></script>
    <script src='public/js/register.js'></script>
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
                用户注册
                <span class="login">已有账号？点击<a href="login.jsp">这里</a>登陆</span>
            </h4>
            <div class="registerArea">
                <form id="myform"  method="post">
                    <div class="form-group loginInputArea has-feedback">
                        <input id="username" required="required" type="text" name="username" class="form-control loginInput" placeholder="学号/邮箱">
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="info">
                        <p class="usernameInfo" style="display: none">建议以学号作为用户名,长度至少为6位</p>
                        <p class="usernameErrorInfo" style="display: none">用户名未输入或不符合规范</p>
                    </div>
                    <div class="form-group has-feedback passwordArea">
                        <input id="password" required="required" type="password" name="password" class="form-control passwordInput" placeholder="密码">
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="info">
                        <p class="passwordInfo" style="display: none">6~20个字符，支持数字、字母或者以上两种的组合</p>
                        <p class="passwordErrorInfo" style="display: none">密码未填写或不符合规范</p>
                    </div>
                    <div class="form-group has-feedback password_reArea">
                        <input id="password_re" required="required" type="password" name="password_re" class="form-control password_reInput" placeholder="确认密码">
                       <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="info">
                        <p class="password_reInfo" style="display: none">6~20个字符，支持数字、字母或者以上两种的组合</p>
                        <p class="password_reErrorInfo" style="display: none">两次密码不相符</p>
                    </div>

                    <button class="btn btn-default"  onclick="checkForm();"><span>注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;测</span></button>
                </form>
            </div>

        </div>
    </div>
</div>
</body>
</html>
