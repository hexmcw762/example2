/**
 * 
 */
 
 function productUpdate(no,flag){
	
	$("#no").val(no);
	if(flag=='U'){
		document.update.action = "/productUpdate";
	}else if(flag=='D'){
		document.update.action = "/productDelete";
	}
		document.update.submit();
}

function compare(m_id){
	adminpw = $("#pw").val();
	pw = prompt('비밀번호를 입력하시오.');
	if(adminpw==pw){
		$("#id").val(m_id);
		document.detail.submit();
	}else{
		alert("관리자 비밀번호가 틀립니다.");
		return false;
	}
}


function pwCheck(flag){
	window.name="update";
	var ff = document.getElementById('postF');
	if(flag=='U'){
		ff.action='memberUpdate';
	}else if(flag=='D'){
		ff.action='memberDelete';
	}
	openWin = window.open("/pwCheck","pwCheck","width=500, height=200, toolbar=no, location=no, menubar=no, resizable = no, scrollbars = no");
}

function setParentText(){
	var cpass = document.getElementById("pwCheck").value;
	var pw = opener.document.getElementById("pw").value;
	compare(cpass,pw);
}

function compare(cpw,pw){
	var f = opener.document.getElementById('postF');
	if(pw==cpw){
		f.submit();
		this.window.close();
	}else{
		alert("비밀번호 오류");
		this.window.close();
	}
}


function orderUpdate(form,flag){
	form.flag.value=flag;
	form.submit();
}