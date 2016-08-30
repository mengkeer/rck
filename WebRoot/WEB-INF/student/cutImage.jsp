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
	String BigImage = session.getAttribute("bigimage").toString();

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
                <img width="66" height="66" src="upload/avatar/default.jpg">
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
            <div class="head_post"  >
                <div class="head-perview clearfix">
                    <div class="perview-large">
                        <p style="font-size: 18px;text-align: center">原始图片</p>
                        <div id="baseview_box">
                            <img id="srcImg" src="<%=BigImage %>" />
                        </div>
                    </div>
                    <div class="preview-right">
                        <p style="font-size: 18px">头像预览</p>
                        <div class="preview-middle">
                            <div id="preview_box">
                                <img id="previewImg" src="<%=BigImage %>" />
                            </div>
                        </div>
                        <p style="font-size: 12px;color: #666;margin-top: 10px"><span>大头像100*100</span></p>
                        <div class="preview-small">
                            <div id="preview_box_small">
                                <img id="previewImg_small" src="<%=BigImage %>"/>
                            </div>
                        </div>
                        <p style="font-size: 12px;color: #666;margin-top: 10px"><span>小头像55*55</span></p>
                    </div>
                </div>
                <div id="DemoBox" style="display: none">
	                 <form action="cutBigImage" method="post" id="crop_form">
						<input type="text" id="bigImage" name="bigImage" />
						<input type="text" id="x" name="x" />
						<input type="text" id="y" name="y" />
						<input type="text" id="w" name="w" />
						<input type="text" id="h" name="h" />
						<input type="text" id="bw" name="bw" />
						<input type="text" id="bh" name="bh" />
					</form>
                   
                </div>
                <button id="ImgPostBtn" class="btn btn-success">保存头像</button>
            </div>
        </div>
    </div>
</div>




<link rel="stylesheet" type="text/css" href="public/css/info.css">
<link rel="stylesheet" type="text/css" href="public/css/jquery.Jcrop.css">
<script src="public/js/jquery.color.js"></script>
<script src="public/js/jquery.Jcrop.js"></script>
<script src="public/js/info.js"></script>

<script type="text/javascript">
    //简单的事件处理程序，响应自onChange,onSelect事件，按照上面的Jcrop调用
    function showCoords(obj) {
       
        $("#x").val(obj.x);
        $("#y").val(obj.y);
        $("#w").val(obj.w);
        $("#h").val(obj.h);
        if (parseInt(obj.w) > 0 && parseInt(obj.h) > 0) {
            //计算预览区域图片缩放的比例，通过计算显示区域的宽度(与高度)与剪裁的宽度(与高度)之比得到
            var rx = $("#preview_box").width() / obj.w;
            var ry = $("#preview_box").height() / obj.h;

            var rx2 = $("#preview_box_small").width() / obj.w;
            var ry2 = $("#preview_box_small").height() / obj.h;
            //通过比例值控制图片的样式与显示
            $("#previewImg").css( {
                width : Math.round(rx * $("#srcImg").width()) + "px", //预览图片宽度为计算比例值与原图片宽度的乘积
                height : Math.round(rx * $("#srcImg").height()) + "px", //预览图片高度为计算比例值与原图片高度的乘积
                marginLeft : "-" + Math.round(rx * obj.x) + "px",
                marginTop : "-" + Math.round(ry * obj.y) + "px"
            });
            $("#previewImg_small").css( {
                width : Math.round(rx2 * $("#srcImg").width()) + "px", //预览图片宽度为计算比例值与原图片宽度的乘积
                height : Math.round(rx2 * $("#srcImg").height()) + "px", //预览图片高度为计算比例值与原图片高度的乘积
                marginLeft : "-" + Math.round(rx2 * obj.x) + "px",
                marginTop : "-" + Math.round(ry2 * obj.y) + "px"
            });
        }
    }
    $("#srcImg").Jcrop( {
        aspectRatio : 1,
        onChange : showCoords,
        onSelect : showCoords,
        minSize : [ 50, 50 ],
    });

</script>

<jsp:include page="footer.jsp"></jsp:include>
</html>
