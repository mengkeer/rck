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
	UserDAO udao = new UserDAO();
	user =  (User)udao.findById(user.getNumber());
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
                <a href="infoJump" class="bg-blue">
                    <i class="al-1" style="background-position:-71px -31px;"></i>
                    <span>我的信息</span>
                </a>
            </li>
            <li>
                <a href="headJump">
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
            <span class="acc-sec">基本信息</span>
            <a href="#" data-toggle="modal" data-target="#editModal" class="btn editBtn" style="display:<%=type==1? "":"none"%>"><span
                    class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</a>
            </a>
        </div>
        <div class="sr-b">
            <div class="alert alert-dismissible" style="display:none" id="info_div"  role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
                <span id="info_text">修改成功</span>
            </div>
            <br /> 

            <ul>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">账号：</p>
                        <div class="sbi-m">
                            <span><%=user.getNumber() %></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">姓名：</p>
                        <div class="sbi-m">
                            <span id="p_name"><%=user.getName()==null?"":user.getName()%></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">性别：</p>
                        <div class="sbi-m">
                            <span id="p_sex"><%=user.getSex()==null?"":user.getSex()%></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">班级信息：</p>
                        <div class="sbi-m">
                            <span id="p_class"><%=user.getClass_()==null ?"":user.getClass_()%></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">手机号：</p>
                        <div class="sbi-m">
                            <span id="p_phone"><%=user.getPhone()==null?"":user.getPhone()%></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">邮箱：</p>
                        <div class="sbi-m">
                            <span id="p_email"><%=user.getEmail()==null?"":user.getEmail()%></span>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="sb-info">
                        <p class="sbi-l">个人简介：</p>
                        <div class="sbi-m">
                            <span id="p_brief"><%=user.getBrief()==null?"":user.getBrief()%></span>
                        </div>
                    </div>
                </li>
            </ul>

        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title">更改个人信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="myform" role="form">

                    <div class="modal-left">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <nobr>姓名</nobr>
                            </label>

                            <div class='col-sm-8'>
                                <input type='text' id="name" name="name" class="form-control" value="<%=user.getName()==null?"":user.getName()%>" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <nobr>性别</nobr>
                            </label>

                             <div class='col-sm-8'>
                                 <!--<input type='text' id="sex" name="sex" class="form-control"/>-->
                                 <select id="sex" class="sex form-control">
                                    <option value="男" <%= user.getSex().equals("男")?"selected":"" %>>男</option>
                                     <option value="女" <%= user.getSex().equals("女")?"selected":"" %>>女</option>
                                 </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <nobr>邮箱</nobr>
                            </label>

                            <div class='col-sm-8'>
                                <input type='text' id="email" name="email" class="form-control" value="<%=user.getEmail()==null?"":user.getEmail()%>">
                            </div>
                        </div>
                      

                    </div>
                    <div class="modal-right">
                    
                      <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <nobr>班级信息</nobr>
                            </label>

                            <div class='col-sm-8'>
                                <input type='text' id="class" name="class" class="form-control" value="<%=user.getClass_()==null?"":user.getClass_()%>"> 
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <nobr>手机号</nobr>
                            </label>

                            <div class='col-sm-8'>
                                <input type='text' id="phone" name="phone" class="form-control" value="<%=user.getPhone()==null?"":user.getPhone()%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                <nobr>简介</nobr>
                            </label>

                            <div class='col-sm-8'>
                                 <textarea id="brief" name="brief" class="form-control" ><%=user.getBrief()==null?"":user.getBrief()%></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="clearfix"></div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="update();" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-success" onclick="updatemge();" form="myform">确认修改</button>
            </div>
        </div>
    </div>
</div>


<link rel="stylesheet" type="text/css" href="public/css/info.css">
<script type="text/javascript" src="public/js/info.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
