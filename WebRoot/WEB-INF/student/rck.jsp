<%@page import="cc.rck.model.User"%>
<%@page import="cc.rck.DAO.basic.UserskillDAO"%>
<%@page import="cc.rck.model.Userskill"%>
<%@page import="cc.rck.model.Skills"%>
<%@page import="cc.rck.DAO.basic.SkillsDAO"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.print(basePath);
String str = request.getParameter("type").toString();
if(str==null){
}
int type = Integer.parseInt(str);

SkillsDAO sdao = new SkillsDAO();
List<Skills> list = sdao.findByType(type);
HashSet<User> set=new HashSet<User>();
UserskillDAO udao = new UserskillDAO();
for(int i =0 ;i<list.size();i++){
	Skills kill = list.get(i);
	List<Userskill> li = udao.findByProperty("skills",kill);
	if(li==null){
		li = new ArrayList();
	}
	for(int j = 0;j<li.size();j++){
		set.add(li.get(j).getUser());
	}
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="header.jsp"></jsp:include>
<div class="content">
    <div class="hd">
        <ul class="hd_head">
            <li class="current"><a href="rckJump?type=1">全部</a></li>
            <li><a href="rckJump?type=1">程序设计类</a></li>
            <li><a href="rckJump?type=2">ACM类</a></li>
            <li><a href="rckJump?type=3">多媒体类</a></li>
            <li><a href="rckJump?type=4">移动开发类</a></li>
            <li><a href="rckJump?type=5">网站设计类</a></li>
        </ul>
    </div>
    <div class="show clearfix">
    <%
    	for(User user : set ){
    	%>
    		<div class="member">
            <div class="member-photo">
                <a href="infoJump?userid=<%=user.getNumber() %>"><img src="http://res.cloudinary.com/sydjs/image/upload/c_thumb,f_auto,g_faces,h_360,w_360/v1459973040/gfa2izhn2whefmchuase.jpg" alt="陈鑫" width="180" height="180"></a>
            </div>
            <div class="member-info">
                <h5 class="member-title">
                    <a href="infoJump?userid=<%=user.getNumber() %>"><%=user.getName() ==null||user.getName().length()==0  ? user.getNumber():user.getName() %></a>
                </h5>
                <div class="member-class"><%=user.getClass_() %></div>
            </div>
        </div><%
    	}
    %>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="public/css/rck.css">
<jsp:include page="footer.jsp"></jsp:include>
</html>
