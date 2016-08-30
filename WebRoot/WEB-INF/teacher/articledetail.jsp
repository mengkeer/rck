<%@page import="cc.rck.model.Replies"%>
<%@page import="cc.rck.DAO.basic.RepliesDAO"%>
<%@page import="cc.rck.model.Article"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Article article = (Article)request.getSession().getAttribute("articledetail");
RepliesDAO rdao = new RepliesDAO();
List <Replies> replies = rdao.findByProperty("article", article);
if(replies==null){
	replies = new ArrayList();
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript">
	var articleId = <%=article.getId() %>;
</script>

<div class="container content">
    <!-- Page Head -->
    <h2 style="font-weight: bold">浏览文章</h2>
    <br>

    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
        浏览文章内容，并可对其进行编辑！
    </div>

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                   aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                    文章
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="content-box-content">

                    <div class="content_header">
                        <h4><%= article.getTitle() %></h4>
                        <p><small>
                            <span><a href="infoJump?userid=<%=article.getUser().getNumber() %>"><%=article.getUser().getName() ==null||article.getUser().getName().length()==0  ? article.getUser().getNumber():article.getUser().getName() %></a> 发布于 <%=article.getPubtime() %>	</span>
                            <a class="list" href="articlelistJump" >返回文章列表</a>
                        </small>
                        </p>
                    </div>
                    <div class="divider"></div>
                    <%=article.getContext()%>
                    <div class="share">
                        <div class="bdsharebuttonbox"><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a></div>
                        <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingTwo">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"
                   aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                    回帖
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="content-box-content">
                    
                    <div class="comment">
                    	<% for(int i = 0  ; i< replies.size() ;i++) {%>
                    	<div>
                            <p><small>
                                <span><%=i+1%>楼</span>
                                <a  class="comment_right" onclick="deleteReply(<%=replies.get(i).getId() %>);" >删除</a>
                            </small>
                            </p>
                            <div class="comment_text col-md-10 col-md-offset-1" >
                                <%=replies.get(i).getContext() %>
                             </div>
                            <div class="clearfix"></div>
                            <p class="comment_date">
                                <small>
                                <span style="float: right"><a href="infoJump?userid=<%=replies.get(i).getUser().getNumber() %>"><%=replies.get(i).getUser().getNumber() %></a>&nbsp;于&nbsp;<%=replies.get(i).getReplytime() %>&nbsp;回复</span>
                                </small>
                            </p>
                            <div class="clearfix"></div>

                        </div>
                    	<% }%>
                    </div> 
                    <div class="divider"></div>

                    <div class="reply">
                        <p>回复</p>
                        <form >
                            <textarea class="text-input textarea" id="content" name="content" style="width:100%;" rows="10"></textarea>
                            <br /> <br />
                            <button type="submit" class="btn btn-success" onclick="replyform();">回复</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" type="text/css" href="public/css/project.css">
<script src='public/js/articledetail.js'></script>

<jsp:include page="footer.jsp"></jsp:include>
</html>