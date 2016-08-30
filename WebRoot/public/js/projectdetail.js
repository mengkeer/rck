
$(function(){
    $(".applyBtn").click(function(){
        $("#applyModal").modal("toggle");
      
        var max = $("#maxteammate").text();
        var now = $("#nowteammate").text();
        if(parseInt(now)<parseInt(max)){
        	$(".infoText1").css("display","none");
        	$(".infoText2").css("display","");
            $("#snedApply").removeAttr("disabled"); 
        }else{
            $(".infoText1").css("display","");
        	$(".infoText2").css("display","none");
            $("#snedApply").attr("disabled","true");
        }
    });
    
    sendApply = function(idproject){
    			   $.ajax({
    	               url: '/rck/applyProject',
    	               data: {idproject:idproject},
    	               type: 'POST',
    	               async:false,
    	               success: function (result) {
    	            	   alert("success");
    	            	   var rs = JSON.parse(result);
    	            	   type = rs.type;
    	                   location.reload();
    	               },
    	               error:function(){
    	            	   
    	               }
    	           });
    };
});
