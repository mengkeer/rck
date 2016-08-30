<%@page import="cc.rck.DAO.basic.MessageDAO"%>
<%@page import="cc.rck.model.Message"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="cc.rck.model.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
MessageDAO dao = new MessageDAO();
List<Message> messages = dao.findByProperty("userBySender", user);
messages.addAll(dao.findByProperty("userByReciver", user));
if(messages==null){
	messages = new ArrayList<Message>();
}
List<Message> firstMessage = new ArrayList<Message>();
for(int i = 0 ;i< messages.size();i++){
	if(messages.get(i).getFlag()==0 && messages.get(i).getUserByReciver().getNumber().equals(user.getNumber()))
		firstMessage.add(messages.get(i));
}
%>
<html>
<jsp:include page="header.jsp"></jsp:include>

<div id="main-wraper">
    <div class="ibx-crumbs">
        <span class="ibx-crumbs-title">消息中心</span>
        <a class="send-btn" data-toggle="modal" data-target="#editModal"><span class="glyphicon glyphicon-send"></span><span class="send-text">发送消息</span></a>
    </div>
    <div class="news-list-nav">
        <div class="news-list-nav-item news-list-nav-op-btn list-del-btn" style="display: block;">
            <span class="news-list-nav-btn-icon 
"></span>清空所有消息
        </div>
        <div class="news-list-nav-item news-list-nav-op-btn list-set-read-btn" style="display: block;">
            <span class="news-list-nav-btn-icon"></span> 全部置为已读
        </div>
        <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
            <ul id="myTabs" class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">全部消息</a></li>
                <li role="presentation" class=""><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">未读消息<span class="message-num">(<%=firstMessage.size() %>)</span></a></li>
            </ul>
        </div>
    </div>
    <div id="myTabContent" class="tab-content">
        <div role="tabpanel"   class="tab-pane fade active in clearfix" id="home" aria-labelledby="home-tab">
                <% if(messages.size()==0){ %>
            <div class="news-box">
                <div class="news-box-empty">
                    <p>没有新消息</p>
                </div>
            </div>
         <%}else{%>
            <div class="news-box">
                <div class="news-box-list clearfix">
                    <ul class="news-list-wrap">
                    <%
                    	for(int i = messages.size()-1 ;i>=0;i--){
                    %><li class="news-list-item clearfix isread-item ">
                            <div class="news-list-item-wrap <%=user.getNumber().equals(messages.get(i).getUserBySender().getNumber())? "self":"" %>">
                                <p class="small news-item-title">发送者:
                                <span class="news-item-sender">
                                <a href="infoJump?userid=<%=messages.get(i).getUserBySender().getNumber() %>"><%=messages.get(i).getUserBySender().getNumber() %></a>
                                </span>&nbsp;&nbsp;&nbsp;&nbsp;接受者:
                                <span class="news-item-receiver" >
                                <a href="infoJump?userid=<%=messages.get(i).getUserByReciver().getNumber() %>">
                                <%=messages.get(i).getUserByReciver().getNumber() %>
                                </a>
                                </span></p>
                                <div class="news-item-content">
                                    <a class="news-link"><%=messages.get(i).getContext()%></a>
                                </div>
                             	<div class="news-item-right">
                                    <span class="news-list-time"><%=messages.get(i).getSendtime() %></span>
                                    <div class="news-list-item-right-op">
                                        <span class="news-list-item-right-read news-list-item-right-btn <%= messages.get(i).getFlag()==1 ? "readed": "" %>" onclick="readOne(this,<%=messages.get(i).getId()%>);"></span>
                                        <span class="news-list-item-right-del news-list-item-right-btn" onclick="deleteMessage(<%=messages.get(i).getId()%>);"></span>
                                    </div>
                                </div>
                            </div>
                        </li>                               
                    	<% }%>
					</ul>
			</div>
			</div>
			<div class="common-pager-wrap clearfix">
                <label>页数:</label>	<span>1/1</span>    
                <ul class="common-pager-group">
                    <li class="common-pager-item common-pager-disabled" data-type="first">首页</li>
                    <li class="common-pager-item common-pager-disabled" data-type="previous">上一页</li>
                    <li class="common-pager-item common-pager-disabled" data-type="next">下一页</li>
                    <li class="common-pager-item common-pager-disabled" data-type="last">末页</li>
                </ul>
            </div>
			<% }%>
        </div>
        <div role="tabpanel"  class="tab-pane fade clearfix" id="profile" aria-labelledby="profile-tab">
        <% if(firstMessage.size()==0){ %>
            <div class="news-box">
                <div class="news-box-empty">
                    <p>没有新消息</p>
                </div>
            </div>
         <%}else{%>
         <div class="news-box">
         <div class="news-box-list clearfix">
             <ul class="news-list-wrap">
             <%
             	for(int i = firstMessage.size()-1 ;i>=0;i--){
             %><li class="news-list-item clearfix isread-item ">
                     <div class="news-list-item-wrap <%=user.getNumber().equals(messages.get(i).getUserBySender().getNumber())? "self":"" %>">
                         <p class="small news-item-title">发送者:<span class="news-item-sender"><%=firstMessage.get(i).getUserBySender().getNumber() %></span>&nbsp;&nbsp;&nbsp;&nbsp;接受者:<span class="news-item-receiver"><%=firstMessage.get(i).getUserByReciver().getNumber() %></span></p>
                         <div class="news-item-content">
                             <a class="news-link"><%=firstMessage.get(i).getContext()%></a>
                         </div>
                      	<div class="news-item-right">
                             <span class="news-list-time"><%=firstMessage.get(i).getSendtime() %></span>
                             <div class="news-list-item-right-op">
                                 <span class="news-list-item-right-read news-list-item-right-btn <%= firstMessage.get(i).getFlag()==1 ? "readed": "" %>" onclick="readOne(this,<%=firstMessage.get(i).getId()%>);"></span>
                                 <span class="news-list-item-right-del news-list-item-right-btn" onclick="deleteMessage(<%=firstMessage.get(i).getId()%>);"></span>
                             </div>
                         </div>
                     </div>
                 </li>                               
             	<% }%>
				</ul>
		</div>
		</div>
		 <div class="common-pager-wrap clearfix">
         <label>页数:</label>	<span>1/1</span>    
         <ul class="common-pager-group">
             <li class="common-pager-item common-pager-disabled" data-type="first">首页</li>
             <li class="common-pager-item common-pager-disabled" data-type="previous">上一页</li>
             <li class="common-pager-item common-pager-disabled" data-type="next">下一页</li>
             <li class="common-pager-item common-pager-disabled" data-type="last">末页</li>
         </ul>
     </div>
		<%}%>

        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title">发送消息</h4>
            </div>
            <div class="modal-body">
                <form id="mgeform" class="form-horizontal">
                    <div class="form-group">

                        <label for="receiver" class="send-label col-sm-12 control-label">receiver</label>
                        <br />
                        <br />
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="receiver" id="receiver" placeholder="学号">
                        </div>
                        <div id="errorDiv" class="alert alert-warning alert-dismissible col-sm-6" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Warning!</strong><span class="errorInfo"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sendText"  class="send-label col-sm-5 control-label">发送的消息</label>
                        <br />
                        <br />
                        <div class="col-sm-12">
                            <textarea  class="form-control" rows="5" name="sendText" id="sendText" placeholder="text"></textarea>
                        </div>

                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" id="startSend" class="btn btn-success" onclick="sendMessage();" >发送信息</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h4 class="modal-title">显示信息</h4>
            </div>
            <div class="modal-body">
                <form  class="form-horizontal">
                    <div class="form-group">
                        <label for="show-sender" class="send-label col-sm-2 control-label">sender:</label>
                        <div class="col-sm-4">
                            <p class="form-control-static" id="show-sender"></p>
                        </div>
                        <label for="show-receiver" class="send-label col-sm-2 control-label">receiver:</label>
                        <div class="col-sm-4">
                            <p class="form-control-static" id="show-receiver"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sendText"  class="send-label col-sm-5 control-label">发送的消息</label>
                        <br />
                        <br />
                        <div class="col-sm-12">
                            <p class="form-control-static" id="show-sendText"></p>
                        </div>

                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" disabled class="btn btn-success">发送信息</button>
            </div>
        </div>
    </div>
</div>

<link type="text/css" rel="stylesheet" href="public/css/messages.css">
<script src="public/js/tab.js"></script>
<script src="public/js/messages.js"></script>

<jsp:include page="footer.jsp"></jsp:include>
</html>
