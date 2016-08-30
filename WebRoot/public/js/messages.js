
$(function(){

    $(".news-list-item-wrap").find(".news-list-item-right-btn").css("display",'none');

    $(".news-list-item-wrap").hover(function(){
        $(this).css("background-color","#f5f5f5");
        $(this).find(".news-list-item-right-btn").css("display",'');
        if($(this).hasClass("self")){
        	$(this).find(".news-list-item-right-read").css("visibility","hidden");
        }
    },function(){
        $(this).css("background-color","#ffffff");
        $(this).find(".news-list-item-right-btn").css("display",'none');
    });

    $(".news-link").click(function(){
        var sendText = $(this).text();
        var root = $(this).parent().parent();
        var sender = $(root).find("span.news-item-sender").text();
        var receiver = $(root).find("span.news-item-receiver").text();
        $("#show-sender").text(sender);
        $("#show-receiver").text(receiver);
        $("#show-sendText").text(sendText);
        $('#showModal').modal('toggle');
    });
    
    $(".send-btn").click(function(){
    	$("#errorDiv").css("display","none");
    });

    $(".list-del-btn").click(function(){
        var param = {
          op:"deleteAll"
        };
        $.ajax({
            url: '/rck/deleteAll',
            data: param,
            type: 'POST',
            async:false,
            success: function (result) {
                location.reload();
            },
            error:function(){

            }
        });
    });

    $(".list-set-read-btn").click(function(){
        var param = {
            op:"readAll"
        };
        $.ajax({
            url: '/rck/readAll',
            data: param,
            type: 'POST',
            async:false,
            success: function (result) {
                location.reload();
            },
            error:function(){

            }
        });
    });

    readOne=function(node,id){
    	if($(node).hasClass("readed"))  return;
        var param = {
        		id:id,
            };
            $.ajax({
                url: '/rck/readOne',
                data: param,
                type: 'POST',
                async:false,
                success: function (result) {
                    location.reload();
                },
                error:function(){

                }
            });
  	};
 
    deleteMessage =function(id){
        var param = {
        		id:id,
            };
            $.ajax({
                url: '/rck/deleteOne',
                data: param,
                type: 'POST',
                async:false,
                success: function (result) {
                    location.reload();
                },
                error:function(){

                }
            });
  	};
    
    
  	$("#mgeform").submit(function(){
        return false;
  	});
  	
  	sendMessage =function(){
  		var receiver = $("#receiver").val();
  		var sendText = $("#sendText").val();
  		
        var param = {
        		receiver:receiver,
        		sendText:sendText,
            };
            $.ajax({
                url: '/rck/sendMessage',
                data: param,
                type: 'POST',
                async:false,
                success: function (result) {
                	var rs = JSON.parse(result);
                	var type = rs.type;
                	if(type==-1){
                		$("#errorDiv").css("display","block").find(".errorInfo").text("用户名不存在");
                	}else if(type==-2){
                		$("#errorDiv").css("display","block").find(".errorInfo").text("用户名不能为本人");
                	}else if(type==0){
                		$("#errorDiv").css("display","block").find(".errorInfo").text("发送失败");
                	}else{
                		 location.reload();
                	}
                   
                },
                error:function(){

                }
            });
  	};
    
    
});