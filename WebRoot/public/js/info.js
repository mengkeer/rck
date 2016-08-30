$(function(){
	
	var type;

  	$("#myform").submit(function(){
            return false;
    });
  	$("#modpwd").submit(function(){
  		return false;
  	});

  	updatemge = function(){
        var number = $("#id").val();
        var sex = $("#sex").val();
        var email = $("#email").val();
        var class_ = $("#class").val();
        var name = $("#name").val();
        var phone = $("#phone").val();
        var brief = $("#brief").val();

        var param = {
        	number:number,
        	email:email,
        	sex:sex,
        	class_:class_,
        	name:name,
        	phone:phone,
        	brief:brief,
        };
        $('#editModal').modal('toggle');
		   $.ajax({
               url: '/rck/updateMge',
               data: param,
               type: 'POST',
               async:false,
               success: function (result) {
               	   var rs = JSON.parse(result);
                   type = rs.type;
                   var user = rs.user;
                   $("#p_sex").text(user.sex);
                   $("#p_email").text(user.email);
                   $("#p_class").text(user.class_);
                   $("#p_name").text(user.name);
                   $("#p_phone").text(user.phone);
                   $("#p_brief").text(user.brief);
                   $("#header_name").text(user.name==""?user.number:user.name);
                   console.log(rs.user);
                   if((typeof type !=undefined)&&type==-1){
                		 //alert('修改失败！');
                       changeStatus(false,"修改失败");

                   }else
                	   //alert('修改成功!');
                       changeStatus(true,"修改成功!");


               },
               error:function(){
                   changeStatus(false,"修改失败");
               }
           }); 
    };
    
    modpwdForm = function(){
        var password = $("#now_password").val();
        var new_password = $("#new_password").val();
        var re_password = $("#re_password").val();

        if(new_password!=re_password){
            changeStatus(false,'两次密码不一致!');
           
            return;
        }

        var param = {
        	password:password,
        	new_password:new_password,
        };


		   $.ajax({
               url: '/rck/doModPwd',
               data: param,
               type: 'POST',
               async: true,
               success: function (result) {
               	   var rs = JSON.parse(result);
                   type = rs.type;

                   console.log(rs.type);
                   if((typeof type !=undefined)&&type==-1){
                		 //alert('密码错误!');
                       changeStatus(false,'密码错误!');
                   }else if((typeof type !=undefined)&&type==0){
                	   //alert('密码修改失败!');
                       changeStatus(false,'密码修改失败!');
                   }
                   else{
                	   //alert('密码修改成功!');
                       changeStatus(true,'密码修改成功!');
                   }
               },
               error:function(){
                   changeStatus(false,'密码修改失败!');
               }
           }); 
    };
    
    $("#file_choose_btn").click(function () {
        $("#file_choose").click();
        $("#file_choose").change(function(){
            var fileName = $("#file_choose").val();
            if (fileName!= '') {
                if(fileName.endWith(".png")||fileName.endWith("jpg")){

                    $("#uploadForm").submit();


                    //location.href = "cutImage.html"
                }else{
                    alert("文件类型有误");
                }
            }
        });
    });
    
    $("#ImgPostBtn").click(function(){
    	  if (parseInt($("#w").val()) > 0 && parseInt($("#h").val()) > 0) {
    		   var submitForm=$("#crop_form");
               $("#bw").val(parseInt($("#srcImg").width()));
               $("#bh").val(parseInt($("#srcImg").height()));
               $("#bigImage").val($("#srcImg").attr("src"));
               console.log($("#crop_form").attr("action"));
               submitForm.submit();
          }
    });



    String.prototype.endWith=function(endStr){
        var d=this.length-endStr.length;
        return (d>=0&&this.lastIndexOf(endStr)==d)
    };
});

function changeStatus(flag,mess,user){
    if(flag){
        $("#info_div").css("display","block").removeClass("alert-warning").addClass("alert-success");
        $("#info_text").text(mess);
    }else{
        $("#info_div").css("display","block").removeClass("alert-success").addClass("alert-warning");
        $("#info_text").text(mess);
    }
}