<%@page import="cc.rck.model.Teams"%>
<%@page import="cc.rck.DAO.basic.TeamsDAO"%>
<%@page import="cc.rck.DAO.basic.ProjectsDAO"%>
<%@page import="cc.rck.model.Projects"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String str = request.getParameter("project").toString();
ProjectsDAO pdao = new ProjectsDAO();
Projects project = pdao.findById(Integer.parseInt(str)); 
TeamsDAO tdao = new TeamsDAO();
List<Teams> list = tdao.findByProperty("projects", project);
if(list==null){
	list = new ArrayList();
}

String teammate = new String();
for(int i =0 ;i<list.size();i++){
	if(i!=0)
		teammate+="，";
	teammate+="<a href=\"infoJump?userid="+list.get(i).getUser().getNumber()+"\">";

	if(list.get(i).getUser().getName()==null||list.get(i).getUser().getName().length()==0)
		teammate+=list.get(i).getUser().getNumber();
	else
		teammate+=list.get(i).getUser().getName();
	teammate+="</a>";
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="header.jsp"></jsp:include>
<div class="container content">
    <!-- Page Head -->
    <h2 style="font-weight: bold">浏览项目</h2>
    <br>

    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
        浏览项目内容，并可进行申请！
    </div>

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <span role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                  aria-expanded="false" aria-controls="collapseOne" class="collapsed">项目
            </span>
            <a href="#" data-toggle="modal" style="padding-top: 0px;padding-bottom: 0px;float: right" data-target="" class="btn applyBtn" ><span
                    class="glyphicon-leaf glyphicon" aria-hidden="true"></span><span>申请</span>
            </a>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="content-box-content">

                    <div class="content_header">
                        <h4><%=project.getName() %></h4>
                        <p><small>
                            <span>管理员 发布于 <%=project.getBeginTime() %>	</span>
                            <a class="list" href="projectlistJump" >返回项目列表</a>
                            </small>
                        </p>

                        <div class="basicInfo">
                            <p class="small">项目状态：<span>已结束</span></p>
                            <p class="small">项目最大人数：<span id ="maxteammate" ><%=project.getMax() %></span>人</p>
                            <p class="small">项目级别：<span><%=project.getRank() %></span></p>
                            <p class="small">项目开始时间：<span><%=project.getBeginTime() %></span></p>
                            <p class="small">项目结束时间：<span><%=project.getEndTime() %></span></p>
                            <p class="small">指导老师：<span><%=project.getTeacher() %></span></p>
                            <p class="small">小组名称：<span><%=project.getTeamname() %></span></p>
                            <p class="small">当前人员数：<span id ="nowteammate"><%=list.size()%></span></p>
                            <p class="small">当前组员：<span><%=teammate%></span></p>
                        </div>

                    </div>


                    <div class="divider"></div>
                    <div id="textarea" name="textfield">
                    <%=project.getContext() %>
                    </div>
                    <div class="share">
                        <div class="bdsharebuttonbox"><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a></div>
                        <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="modal fade" id="applyModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title">申请信息</h4>
            </div>
            <div class="modal-body">
                <div class="infoText1" style="display: none;color: red">
                    当前项目已结束超期或人数已满，无法再进行申请!
                </div>
                <div class="infoText2" style="display: none">
                    项目正在进行中，还需录取<%=project.getMax()-list.size() %>人
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" onclick="sendApply(<%=project.getIdprojects() %>);" class="btn btn-success">发出申请</button>
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" type="text/css" href="public/css/project.css">
<script src="public/js/projectdetail.js"></script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
