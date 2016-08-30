<%@page import="cc.rck.DAO.basic.UserDAO"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="cc.rck.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<jsp:include page="header.jsp"></jsp:include>

<% 
	int type;
	User user = (User)session.getAttribute("user");
	User guest =(User)session.getAttribute("guest");
	if(user.getNumber().equals(guest.getNumber())){
		type=1;
	}else{
		type=0;
		user =guest;
	}
 %>

<div class="alert alert-info alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
    <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
    &nbsp;在这里查看和修改你的基本信息。填写更多的信息，可以方便老师对你有更多的了解~<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果学号、姓名、所在班级等基本信息有误，请联系科创中心管理人员进行修改。<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请准确填写自己的Email，方便信息通知和老师联系你（填写不正确可能影响一些重要信息的传达）。<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人简介(纯文本方式)最多填写255个字符(多余部分自动截断)，可以填写自我介绍、联系方式等信息。<br>
</div>

<div class="content clearfix">
    <div class="info-left">
        <div class="sty-head">
            <div class="head-set">
                <img width="66" height="66" src="<%=user.getImage()!=null? user.getImage():"upload/avatar/default.jpg" %>">
            </div>
            <span class="sty-name"><%=user.getNumber() %></span>
        </div>
        <ul class="info-list">
            <li>
                <a href="infoJump">
                    <i class="al-1" style="background-position:-71px -31px;"></i>
                    <span>我的信息</span>
                </a>
            </li>
            <li>
                <a href="headJump"  class="bg-blue">
                    <i class="al-2"></i>
                    <span>我的头像</span>
                </a>
            </li>
            <li>
                <a href="modpwdJump">
                    <i class="al-3"></i>
                    <span>密码修改</span>
                </a>
            </li>
            <li>
                <a href="skillsJump">
                    <i class="al-4"></i>
                    <span>我的技能</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="info-right">
        <div class="sr-t">
            <span class="tit-b"></span>
            <span class="acc-sec">头像设置</span>
        </div>
        <div class="sr-b">
            <div class="head_show clearfix">

                <div class="head_show_img">
                    <img src="<%=user.getImage()!=null? user.getImage():"upload/avatar/default.jpg" %>">
                    <span>当前头像</span>
                </div>
                <div class="head_show_post">
                   <div class="postImg">
                       <img src="public/img/head_post.png">
                       <span>上传图片</span>
                   </div>
                   <form id="uploadForm" style="display: none" action="uploadBigImage" enctype="multipart/form-data" method="post">
                        <input type="file" id="file_choose" name="image" style="display: none">
                          <input type="submit" value="提交">
                    </form>
                    <button type="button" id="file_choose_btn" class="btn btn-default">图片上传</button>
                </div>
                <div class="head_show_info">
                    <p>支持JPG、PNG等格式，图片需小于2M。</p>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="public/css/info.css">
<script type="text/javascript" src="public/js/info.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
