$(function(){

	replyform = function(){
	var content = $("#content").val();
    var param = {
    		content:content,
    		articleId:articleId,
        };
		   $.ajax({
               url: '/rck/addReply',
               data: param,
               type: 'POST',
               async:false,
               success: function (result) {
            	   alert(articleId);
//               	var rs = JSON.parse(result);
//                   type = rs.type;
                   location.reload();
               },
               error:function(){
            	   
               }
           });
	};
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