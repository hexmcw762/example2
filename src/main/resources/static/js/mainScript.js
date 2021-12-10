/**
 * 
 */

$(function(){
	var idck;
	var pwck;

	$('#submit1').click(function(){
	if(idck==1){
		alert("아이디 중복");
		return false;
	}
	if(valichk()){
		return false;
	}
	if(pwck==1){
		alert("비밀번호 다름");
		return false;
	}
	
	$('form').submit();
	
	});
	
	$('#passwd').keyup(function(){
		$('font[id=check]').text('');
		if($('#passwd').val()!=$('#passwd2').val()){
			$('font[id=check]').text('');
			$('font[id=check]').attr('color','red');
			$('font[id=check]').text('비밀번호 다름');
			pwck=1;
		}else{
			$('font[id=check]').text('');
			$('font[id=check]').attr('color','blue');
			$('font[id=check]').text('비밀번호 같음');
			pwck=0;
		}
	});
	$('#passwd2').keyup(function(){
		
		if($('#passwd').val()!=$('#passwd2').val()){
			$('font[id=check]').text('');
			$('font[id=check]').attr('color','red');
			$('font[id=check]').text('비밀번호 다름');
			pwck=1;
		}else{
			$('font[id=check]').text('');
			$('font[id=check]').attr('color','blue');
			$('font[id=check]').text('비밀번호 같음');
			pwck=0;
		}
	});
	
	$('#idchck').on("propertychange change input past", function(){
		$.ajax({
			asynk:true,
			type:'post',
			url:"idCheck",
			dataType:"json",
			data:{"mem_id":$("#idchck").val()},
			success:function(data){
				if(data>0){
					$('font[id=warning]').text('');
					$('font[id=warning]').attr('color','red');
					$('font[id=warning]').text('이미 존재하는 아이디 입니다.');
					$('#idchck').focus();
					idck=1;
				}else{
					$('font[id=warning]').text('');
					$('font[id=warning]').attr('color','blue');
					$('font[id=warning]').text('사용 가능한 아이디 입니다.');
					$('#idchck').focus();
					idck=0;
				}
			},
			error:function(error){
				alert("error :"+error);
			}
		});
	});
	
		$('#login').click(function(){
			var loginObj = $("form[name='loginForm']")
			if($("input[name='mem_id']").val()==""){
				alert("아이디 입력");
				$("input[name='mem_id']").focus();
				return false;
			}
			if($("input[name='m_passwd']").val()==""){
				alert("패스워드 입력");
				$("input[name='m_passwd']").focus();
				return false;
			}
			loginObj.submit();
		});
		
	$("#inputCheck").click(function(){
	    if(valichk()){
			return false;
		}
	  $('form').submit();
	//document.wForm.action = "/admin";
      });

})

function shopMgrDetail(no){
	//document.detail.o_no.value=no;
	$("#no").val(no);
	document.detail.submit();

}

function valichk(){
	var flen = $("form[name='wForm'] .chk").length;
	for(var i=0; i<flen; i++){
		if($('.chk').eq(i).val()=="" || $('.chk').eq(i).val()==null || $('.chk').eq(i).val().trim()==""){
			alert("필수 입력 항목입니다.");
			$('.chk').eq(i).focus();
			return true;
		}
	}
	var str=document.wForm.m_email.value;	   
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.'); 
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var eMailSize = str.length;
	if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
	else {
		  alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
		  document.wForm.m_email.focus();
		  return true;
	}

}

 function cartUpdate(f, index) {
		   var url1 ;
		   if('D'==f) 
			   url1 = "cartProc?flag=delete";
		   else if('U'==f)
			   url1="cartProc?flag=update";
			 $.ajax({
		     	  async: true,
		         type : 'post',
		         data : { "quantity" : $("input[name=quantity]").eq(index).val(),
		                  "p_no":$("input[name=p_no]").eq(index).val() 
		                }, 
		         url : url1,
		         dataType : "json",
		         success : function(data) {
		         }
		    });
	    };

