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
    <h2>添加项目信息</h2>
    <br>

    <div class="alert alert-info alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
        请在下面的列表中认真填写项目的相关信息！
    </div>

    <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title">
                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                   aria-expanded="false" aria-controls="collapseOne" class="collapsed">
                    项目详细信息
                </a>
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
            <div class="panel-body">
                <div class="content-box-content">

                    <form  method="post">
                        <div class="form-group clearfix">
                            <label class="col-md-12">项目全名</label>
                            <p class="small">64字符以内(超出截断)，如“基于云平台的大学生科创信息管理系统”</p>
                            <div class="col-md-4">
                                 <input id="name" type="text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group clearfix">
                            <label class="col-md-12">项目级别</label>
                            <div class="col-md-4">
                                <select id="rank" class="form-control">
                                    <option>普通</option>
                                    <option>院级</option>
                                    <option>校级</option>
                                    <option>上海级</option>
                                    <option>国家级</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group clearfix">
                            <label class="col-md-12">项目开始时间</label>
                            <p class="small">项目开始时间（yyyy-mm-dd，例如2012-12-21）。注意:项目开始时间包含日期当天</p>
                            <div class='input-group col-md-4' id='datetimepicker1'>
                                <input id="begin_time" type="text" class="form-control">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>

                        <div class="form-group clearfix">
                            <label class="col-md-12">项目预期截止时间</label>
                            <p class="small">项目预期截止时间（yyyy-mm-dd，例如2012-12-21）。注意:项目预期截止时间包含日期当天</p>
                            <div class='input-group col-md-4' id='datetimepicker2'>
                                <input id="end_time" type="text" class="form-control">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>

                        <div class="form-group clearfix">
                            <label class="col-md-12">项目组团最大人数</label>
                            <div class="col-md-4">
                               <input id="max" type="text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group clearfix">
                            <label class="col-md-12">指导老师（如果有指导教师，请准确填写其姓名，只能填一个；否则此项留空）</label>
                            <p class="small">目前系统中只有本学院教师的相关数据，如果想要添加学院以外老师作为指导教师请联系科创中心管理人员。</p>
                            <div class="col-md-4">
                                <input id="teacher" type="text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group clearfix">
                            <label class="col-md-12">小组名称（如果有项目要求小组给出一个组名请在此填写；如果没有请留空）</label>
                            <p class="small">提示：如果有的话，组名会被打印在纸质证书或其他凭证上；不填写组名的情况默认以所有组员姓名的组合作为队名。</p>
                            <div class="col-md-4">
                                <input id="teamname" type="text" class="form-control">
                            </div>
                        </div>
                        
                        <div class="form-group clearfix">
                            <label class="col-md-12">项目简介</label>
                            <p class="small">填写项目的背景、内容、需求或其它内容等</p>
                            <div class="col-md-12">
                                <textarea id="context"  style="width:100%;height:300px;"></textarea><br />
                            </div>
                        </div>

  
                        <div class="form-group">
                            <div class="col-md-4">
                                <button type="submit" class="btn btn-success" onclick="add();" >确认添加</button>
                            </div>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>

</div>


<link rel="stylesheet" type="text/css" href="public/css/teacher.css">
<link rel="stylesheet" type="text/css" href="public/lib/datepicker/css/bootstrap-datetimepicker.min.css">
<script  src="public/js/moment-with-locales.js"></script>
<script src="public/lib/datepicker/js/bootstrap-datetimepicker.min.js"></script>
<script charset="utf-8" src="public/lib/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="public/lib/kindeditor/lang/zh_CN.js"></script>

<script  src="public/js/addproject.js"></script>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker1,#datetimepicker2').datetimepicker({
                    dayViewHeaderFormat: 'YYYY年 MMMM',
                    defaultDate: '',
                    locale: 'zh_CN',
                    format: 'YYYY-MM-DD',
                    inline: false,
                    sideBySide: false,
                }
        );
    });
       var editor;
        KindEditor.ready(function(K){
            editor = K.create("textarea");
        });
</script>
<jsp:include page="footer.jsp"></jsp:include>
</html>
