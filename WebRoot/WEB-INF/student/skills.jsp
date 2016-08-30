<%@page import="cc.rck.tools.SkillTool"%>
<%@page import="cc.rck.model.Userskill"%>
<%@page import="cc.rck.DAO.basic.UserskillDAO"%>
<%@page import="cc.rck.model.Skills"%>
<%@page import="cc.rck.DAO.basic.SkillsDAO"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="cc.rck.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="header.jsp"></jsp:include>
<%
	SkillsDAO dao = new SkillsDAO();
	List<Skills> list = dao.findAll();

	User user = (User) ServletActionContext.getRequest().getSession()
			.getAttribute("user");
	UserskillDAO Udao = new UserskillDAO();

	List<Userskill> myskills = Udao.findByProperty("user", user);

	List<Userskill> getskill = new ArrayList<Userskill>(100);

	List<SkillTool> tool = new ArrayList<SkillTool>();
	for (int i = 0; i < list.size(); i++) {
		SkillTool temp = new SkillTool();
		temp.set(i + 1, list.get(i).getName());
		tool.add(temp);
	}

	for (int i = 0; i < myskills.size(); i++) {
		int id = myskills.get(i).getSkills().getIdSkiil();
		tool.get(id - 1).setType(myskills.get(i).getType());
		if (myskills.get(i).getType() == 1)
			getskill.add(myskills.get(i));
	}
%>

<div class="alert alert-info alert-dismissible" role="alert">
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
	&nbsp;勾选你掌握的专业技能并保存.<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这样老师有项目的时候就能<span
		style="font-weight: bold">根据标签找到会相关技能的同学，</span>直接找掌握这些技能的同学沟通~<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这里没有你的擅长的技能吗？发邮件给科创中心，我们会及时增加新的标签~
</div>

<div class="content">
	<div class="info-left">
		<div class="sty-head">
			<div class="head-set">
				<img width="66" height="66" src="<%=user.getImage()!=null? user.getImage():"upload/avatar/default.jpg" %>">
			</div>
			<span class="sty-name"><%=user.getNumber()%></span>
		</div>
		<ul class="info-list">
			<li><a href="infoJump"> <i class="al-1"></i> <span>我的信息</span>
			</a></li>
			<li><a href="headJump"> <i class="al-2"></i> <span>我的头像</span>
			</a></li>
			<li><a href="modpwdJump"> <i class="al-3"></i> <span>密码修改</span>
			</a></li>
			<li><a href="skillsJump" class="bg-blue"> <i class="al-4"></i>
					<span>我的技能</span>
			</a></li>
		</ul>
	</div>

	<div class="info-right">
		<div class="sr-t">
			<span class="tit-b"></span> <span class="acc-sec">技能状态</span>
		</div>
		<div class="sr-b">


			<ul id="myTabs" class="pager" role="tablist">
				<li role="presentation" class="active"><a href="#home"
					id="home-tab" role="tab" data-toggle="tab" aria-controls="home"
					aria-expanded="true">已有拥有的技能</a></li>
				<li role="presentation" class=""><a href="#profile" role="tab"
					id="profile-tab" data-toggle="tab" aria-controls="profile"
					aria-expanded="false">希望获得的技能</a></li>

			</ul>
			<div id="myTabContent" class="tab-content">

				<div role="tabpanel" class="tab-pane fade active in" id="home"
					aria-labelledby="home-tab">
					<h4 style="text-align: center">我拥有的专业技能</h4>
					<table class="table table-hover table-striped">
						<tbody>
							<%
								for (int i = 0; i < myskills.size();) {
							%><tr>
								<%
									for (int j = 0; j < 3; j++, i++) {
											if (i == myskills.size())
												break;
											if (myskills.get(i).getType() == 1) {
								%>
								<td><%=myskills.get(i).getSkills().getName()%></td>
								<%
									}
										}
									}
								%>
							</tr>
							<%
								
							%>
						</tbody>
					</table>
					<div class="divider"></div>
					<h4 style="text-align: center">可选的专业技能</h4>
					<form action="/rck/updateSkill" method="post">
						<table id="stable" class="table table-hover table-striped">
							<tbody>
								<%
									for (int i = 0; i < tool.size();) {
								%><tr>
									<%
										for (int j = 0; j < 3; j++, i++) {
												if (i == tool.size())
													break;
									%>
									<td><input name="own" value="<%=i + 1%>" type="checkbox"
										<%=tool.get(i).getType() == 1 ? "checked" : ""%>><%=tool.get(i).getName()%></td>
									<%
										}
										}
									%>
								</tr>
								<%
									
								%>
							</tbody>
						</table>
						<div style="text-align: center">
							<button type="submit" class="btn btn-success">确认修改</button>
						</div>
					</form>

				</div>
				<div role="tabpanel" class="tab-pane fade" id="profile"
					aria-labelledby="profile-tab">
					<h4 style="text-align: center">我希望获得的专业技能</h4>
					<table class="table table-hover table-striped">
						<tbody>
							<%
								for (int i = 0; i < myskills.size();) {
							%><tr>
								<%
									for (int j = 0; j < 3; j++, i++) {
											if (i == myskills.size())
												break;
											if (myskills.get(i).getType() == 2) {
								%>
								<td><%=myskills.get(i).getSkills().getName()%></td>
								<%
									}
										}
									}
								%>
							</tr>
							<%
								
							%>
						</tbody>
					</table>
					<div class="divider"></div>
					<h4 style="text-align: center">可选的专业技能</h4>
					 <form action="/rck/updateSkill" method="post">
                    	<table class="table table-hover table-striped">
                        <tbody>
                         <%
                        	for(int i = 0 ;i<tool.size();){
                        	%><tr><%
                        		for(int j = 0;j<3 ;j++,i++){
                        			if(i == tool.size())
                        				break;
                        			%>
                        			<td><input name="want"  type="checkbox" value = "<%=i+1 %>"<%= tool.get(i).getType() == 2? "checked" :"" %>><%=tool.get(i).getName()%></td>
                        			<%
                        		}
                        	}
                        	%></tr><%
                         %>
                        </tbody>
                   	 </table>
						<div style="text-align: center">
							<button type="submit" class="btn btn-success">确认修改</button>
						</div>
					</form>

				</div>
			</div>

		</div>
	</div>
</div>

<link rel="stylesheet" type="text/css" href="public/css/info.css">
<script type="text/javascript" src="public/js/info.js"></script>

<jsp:include page="footer.jsp"></jsp:include>
</html>
