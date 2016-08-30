<%@page import="cc.rck.DAO.basic.UserDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cc.rck.model.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="header.jsp"></jsp:include>

<% 
	User user = (User)session.getAttribute("user");
	UserDAO udao = new UserDAO();
	user =  (User)udao.findById(user.getNumber());
 %>


<div class="alert alert-info alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
            aria-hidden="true">&times;</span></button>
    <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
    &nbsp;你的密码是经过<span style="font-weight: bold">哈希函数加密后以密文(理论上不可逆)</span>存储在数据库的；请放心，即使有人入侵了系统也无法轻易破解你的密码~<br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由于科创中心目前是内部网络，如果同学忘记了密码，目前只能请管理员重置密码（请携带一卡通/学生证或其他有效身份证件联系管理员）。
</div>

<div class="content">
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
                    <i class="al-1"></i>
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
                <a href="modpwdJump"  class="bg-blue">
                    <i class="al-3"></i>
                    <span>密码修改</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="info-right">
        <div class="sr-t">
            <span class="tit-b"></span>
            <span class="acc-sec">修改密码</span>
        </div>
        <div class="sr-b">
            <div class="alert alert-dismissible" style="display:none" id="info_div"  role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
                <span id="info_text">使用一个不容易被别人猜解、自己不会忘记的密码！</span>
              </div>
          </div>

        <form  class="form-horizontal" method="post" id ="modpwd">

            <div class="form-group">
                <label class="col-sm-2 control-label">当前密码：</label>
                <div class="col-sm-4">
                    <input type="password" id="now_password" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">新密码：</label>

                <div class="col-sm-4">
                    <input type="password" id="new_password" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">确认密码：</label>

                <div class="col-sm-4">

                    <input type="password" id="re_password" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit"  onclick="modpwdForm();" class="btn btn-success">确认修改</button>
                </div>
            </div>

        </form>
        </div>
   
</div>

<link rel="stylesheet" type="text/css" href="public/css/info.css">
<script type="text/javascript" src="public/js/info.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
