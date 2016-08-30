
<%@page import="cc.rck.model.Projects"%>
<%@page import="cc.rck.DAO.basic.ProjectsDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ProjectsDAO pdao = new ProjectsDAO();
List<Projects> projects = pdao.findAll();
if(projects==null){
	projects = new ArrayList();
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="header.jsp"></jsp:include>

 <div class="container content">
    <!-- Page Head -->
    <h2 style="font-weight: bold">科创中心/项目列表</h2>
    <br>

    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
        下面是科创中心发布的新闻、信息和资料下载的列表，供你参考。欢迎各位同学踊跃参加各类竞赛、科技创新项目。
    </div>

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                   aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                    信息列表
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="content-box-content">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>标题</th>
                                <th>作者</th>
                                <th>发布时间</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        	for(int i = projects.size()-1 ;i >=0;i--){
                        	%><tr>
                            <td>
                                <a href="projectdetailJump?project=<%=projects.get(i).getIdprojects() %>" title="title"><%= projects.get(i).getName() %></a>
                            </td>
                            <td>管理员
                            </td>
                            <td><%= projects.get(i).getBeginTime() %></td>
                        </tr>
                        	<%}
                         %>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="public/css/project.css">
<jsp:include page="footer.jsp"></jsp:include>