$(function(){

	addArticle = function(){
		
		
		// 取得HTML内容
		html = editor.html();

		// 同步数据后可以直接取得textarea的value
		editor.sync();
		var context = $('#addText').val(); // jQuery

		var title = $("#addTitle").val();

		alert(context);
	    var param = {
	    		title:title,
	    		context:context,
	        };
			   $.ajax({
	               url: '/rck/addArticle',
	               data: param,
	               type: 'POST',
	               async:false,
	               success: function (result) {
	            	   alert("success");
	//               	var rs = JSON.parse(result);
	//                   type = rs.type;
	                   location.reload();
	               },
	               error:function(){
	            	   
	               }
	           });
		}
});