<%@page import="cc.rck.model.User"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<% User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user"); %>
<head>
    <title>DHU人才库</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="public/css/common.css">
    <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
    <script src='public/js/jquery-2.1.4.min.js'></script>
    <script src='public/js/bootstrap.min.js'></script>
    <script src="public/js/common.js"></script>
    <script src='public/js/info.js'></script>
</head>
<body>
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-content">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars"></span>
            </button>
            <a class="navbar-brand" href="/">
                <img src="public/img/wakatime-120.png">
                <span>东华人才库</span>
            </a>
        </div><div id="navbar-content" class="collapse navbar-collapse navbar-right">

            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">人才库</a>
                    <ul class="dropdown-menu">
                        <li><a href="rckJump?type=1">程序设计类</a></li>
                        <li><a href="rckJump?type=2">ACM类</a></li>
                        <li><a href="rckJump?type=3">多媒体类</a></li>
                        <li><a href="rckJump?type=4">移动开发类</a></li>
                        <li><a href="rckJump?type=5">网站设计类</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">项目活动</a>
                   <ul class="dropdown-menu">
                        <li><a href="articlelistJump">文章资源</a></li>
                        <li><a href="projectlistJump">项目列表</a></li>
                        <li><a href="postJump">发布文章</a></li>
                        <li><a href="addprojectJump">发布项目</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="messageJump" class="dropdown-toggle" data-toggle="dropdown">消息中心</a>
                    <ul class="dropdown-menu">
                        <li><a href="messageJump">全部消息</a></li>
                        <li><a href="messageJump">未读消息</a></li>
                        <li><a href="messageJump">发送消息</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="infoJump" class="dropdown-toggle" data-toggle="dropdown"><%=user.getName() ==null||user.getName().length()==0  ? user.getNumber():user.getName() %></a>
                    <ul class="dropdown-menu">
                        <li><a href="infoJump">基本信息</a></li>
                        <li><a href="modpwdJump">密码修改</a></li>
                    </ul>
                </li>
                <li><a href="logout" class="navbar-link">注销</a></li>
            </ul>
        </div>

        
    </div>
</div>
