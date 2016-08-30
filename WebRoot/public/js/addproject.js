$(function(){

	add = function(){
		alert('yes');
	var name = $("#name").val();
	var rank = $("#rank").val();
	var begin_time = $("#begin_time").val();
	var end_time = $("#end_time").val();
	var max = $("#max").val();
	var teacher = $("#teacher").val();
	var teamname = $("#teamname").val();
	// 取得HTML内容
	html = editor.html();

	// 同步数据后可以直接取得textarea的value
	editor.sync();
	var context = $("#context").val();
	alert(context);
    var param = {
    		name:name,
    		rank:rank,
    		begin_time:begin_time,
    		end_time:end_time,
    		max:max,
    		teacher:teacher,
    		teamname:teamname,
    		context:context,
        };
		   $.ajax({
               url: '/rck/addProject',
               data: param,
               type: 'POST',
               async:false,
               success: function (result) {
            	   alert(name);
//               	var rs = JSON.parse(result);
//                   type = rs.type;
                   location.reload();
               },
               error:function(){
            	   
               }
           });
	}
	deleteReply = function(replyId){
		alert(replyId);
	    var param = {
	    		replyId:replyId,
	        };
		   $.ajax({
               url: '/rck/deleteReply',
               data: param,
               type: 'POST',
               async:false,
               success: function (result) {
            	   alert('delete success');
//               	var rs = JSON.parse(result);
//                   type = rs.type;
                   location.reload();
               },
               error:function(){
            	   
               }
               
           });
		   
	}
});