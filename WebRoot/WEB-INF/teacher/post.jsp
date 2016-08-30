<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="header.jsp"></jsp:include>
<div class="container content">
    <!-- Page Head -->
    <h2>发布请求</h2>
    <br>

    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
        请在下面的文本框中输入文章标题和内容，然后点击发布按钮来发布文章！
    </div>

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                   aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                    写文章
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="content-box-content">

                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
                        注意：您当前的身份为学生，必须审核通过后才能显示出来！
                    </div>

                    <form >
                        <div class="form-group">
                            <label  class="col-sm-12">文章标题</label>
                            <p style="padding-left: 15px"><small>请输入精炼、简短的文章标题。</small></p>
                            <div class="col-sm-4">
                                <input type="text" class="form-control " id="addTitle">
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <label class="col-sm-12">请输入文章正文</label>
                            <p style="padding-left: 15px"><small>对于有图片的文章，可以先把文章发表到易班或者其他可以公开访问的博客，然后再复制过来哦~</small></p>
                            <div class="col-sm-12">
                                <textarea name="post"  id="addText" style="width:100%;height:300px;"></textarea><br/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4">
                                <button type="submit" class="btn btn-success" onclick="addArticle();">提交</button>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>


<script src='public/js/collapse.js'></script>
<script charset="utf-8" src="public/lib/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="public/lib/kindeditor/lang/zh_CN.js"></script>
<style>
    .panel-title a{
        font-weight:bold;
    }
    .panel-title a:hover,.panel-title a:focus{
        text-decoration: none;
    }
</style>
<script>
    KindEditor.ready(function(K){
        editor = K.create("#addText");
    });
</script>

<script src='public/js/post.js'></script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
