<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="cc.rck.model.User"%>
<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% User user = (User)ServletActionContext.getRequest().getAttribute("user"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>3din</title>
    <link rel="stylesheet" type="text/css" href="public/css/index.css">
    <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
    <script src='public/js/jquery-2.1.4.min.js'></script>
    <script src='public/js/bootstrap.min.js'></script>
</head>
<body>

<script type="text/javascript">
    $(document).ready(function () {
        $('#index-static-header').hide();

        $('#indicator-0').css('opacity','1');
    });
</script>

<!--header begin-->
<div class="index-header">
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
            </div>

            <div id="navbar-content" class="collapse navbar-collapse navbar-right">

                <ul class="nav navbar-nav navbar-left">
                    <li class="dropdown">
                        <a href="rckJump?type=1"" class="dropdown-toggle" data-toggle="dropdown">人才库</a>
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
                        <a href="infoJump" class="dropdown-toggle" data-toggle="dropdown"><span id="header_name"><%=user.getName() ==null||user.getName().length()==0  ? user.getNumber():user.getName() %></span></a>
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

    <div class="header-body">
        <h1>东华大学人才管理系统</h1>
        <h3>Let's go!</h3>
        <button class="btn btn-default" role="button" onclick="location.href='projectlistJump'">
            浏览所有项目
        </button>
    </div>

    <div class="overlay"></div>

</div>

<div id="index-static-header" class="index-static-header">
    <div class="navbar navbar-default navbar-staticTop" role="navigation">
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
            </div>

            <div id="navbar-content" class="collapse navbar-collapse navbar-right">

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
                        <li><a href="myprojectlistJump">我参与的项目</a></li>
                        <li><a href="postJump">发布文章</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">消息中心</a>
                        <ul class="dropdown-menu">
                        <li><a href="messageJump">全部消息</a></li>
                        <li><a href="messageJump">未读消息</a></li>
                        <li><a href="messageJump">发送消息</a></li>
                        </ul>
                    </li>

                </ul>

                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">mengkeer</a>
                        <ul class="dropdown-menu">
                        <li><a href="infoJump">基本信息</a></li>
                        <li><a href="skillsJump">专业技能</a></li>
                        <li><a href="modpwdJump">密码修改</a></li>
                        </ul>
                    </li>
                    <li><a href="logout" class="navbar-link">注销</a></li>
                </ul>
            </div>

        </div>
    </div>
</div>
<!--header end-->

<!--news div begin-->
<div class="index-news">
    <span class="glyphicon glyphicon-volume-up" style="top:3px" aria-hidden="true"></span>
    <span>科创中心信息平台发布了~</span>
    <button class="btn" role="button" onclick="location.href='detailjump?article=7'">more+</button>
    <button class="close" role="button">x</button>
    <div class="clearfix"></div>
</div>
<!--news div end-->

<!--description begin-->
<div id="description" class="index-description">
    <div class="des-background">
        <h2>开发人员介绍</h2>
    </div>

    <div class="des-content container">
        <div class="row">
            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-xs-12">
                <img src="upload/avatar/131340226.jpg" alt="3din"/>
                <h3>姜傲腾</h3>
                <div>抽屉泛黄的日记，榨干了回忆。</div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-xs-12">
                <img src="upload/avatar/131340126.jpg" alt="陈鑫"/>
                <h3>陈鑫</h3>
                <div>他很懒，没有什么个性签名。。</div>
            </div>
            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-xs-12">
                <img src="upload/avatar/131340119.jpg" alt="祝大神"/>
                <h3>祝大神</h3>
                <div>考完数据库，我意识到，该报警了.不然挂了没人收尸...</div>
            </div>
        </div>
    </div>
</div>
<!--description end-->

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
        <li data-target="#carousel-example-generic" data-slide-to="3" class=""></li>
    </ol>

    <div class="introduce-title">
        <h2>特色功能介绍</h2>
    </div>
    <div class="carousel-inner" id="introduce" role="listbox">

        <div class="item active">
            <h2>1.人才库</h2>
            <p class="item-info">汇聚计院顶尖大神，罗列出其擅长技能，并有联系方式哦~~</p>
        </div>
        <div class="item">
            <h2>2.项目活动</h2>
            <p class="item-info">您可以发布文章或项目，或申请其它人发布的项目，还可以留言评论。。</p>
        </div>
        <div class="item">
            <h2>3.消息中心</h2>
            <p class="item-info">可以给他人发送消息，接收他人消息，并可以对消息进行删除，批量删除，设置为已读等操作</p>
        </div>
        <div class="item">
            <h2>4.个人中心</h2>
            <p class="item-info">可以修改编辑删除个人基本信息，更可自定义个性头像，支持裁剪，同时还可选定已拥有的技能和希望获得的技能</p>
        </div>
    </div>
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!--footer begin-->
<div class="index-footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="footer-logo">
                    <img src="public/img/wakatime-120.png" alt="logo"/>
                    <span>人才库</span>
                </div>
                <div class="footer-text">
                    <p>东华大学人才管理系统</p>
                    <p>2016-04-20</p>
                </div>
            </div>

            <div class="col-sm-offset-3 col-xs-offset-0 col-lg-2 col-md-2 col-sm-2 col-xs-12">
                <p  class="footer-title">
                    team
                </p>
                <nav class="footer-list">
                    <ul>
                        <li>
                            <!--<a href=""></a>-->
                            <span>mengkeer</span>
                        </li>
                        <li>
                            <span>jat</span>
                        </li>
                        <li>
                            <span>zyy</span>
                        </li>
                    </ul>
                </nav>
            </div>

            <div class="col-sm-offset-1 col-xs-offset-0 col-lg-2 col-md-2 col-sm-2 col-xs-12">
                <p  class="footer-title">
                    CONTACT US
                </p>
                <nav class="footer-list">
                    <ul>
                        <li>
                            <span>1812422367@qq.com</span>
                        </li>
                        <li>
                            <span>352408322@qq.com</span>
                        </li>
                        <li>
                            <span>675917545@qq.com</span>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<p class="copyright">Copyright ©2015-2017 slotus. All Rights Reserved 鄂ICP备15010044号-1 沪公网安备 31011702000056号</p>
<!--footer end-->

</body>

<script type="text/javascript">
    $(function () {
        $('.close').click(function () {
            $('.index-news').hide();
        });

        $(window).scroll(function () {
            var winPos = $(window).scrollTop();
            var desPos=$('#description').offset().top;
            if(winPos>desPos){
                $('#index-static-header').slideDown(300);
            }else{
                $('#index-static-header').slideUp(300);
            }
        });

    })
</script>

</html>