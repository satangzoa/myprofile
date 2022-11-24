/**
 * 
 */
 
  function joinCheck() {
	  
	  if(document.join_frm.mid.value.length == 0) {
		  alert("아이디는 필수 입력 사항이지롱. 다시 확인해줭!");
		  return;
	  }
	  
	   if(document.join_frm.mid.value.length == 4) {
		  alert("아이디가 너무 짧다아. 더 길게 4자이상 해줘어!");
		  return;
	  }
	  
	   if(document.join_frm.mpw.value.length == 0) {
		  alert("비밀번호도 필수 입력 사항이지롱. 다시 확인해줭!");
		  return;
	  }
	   
	   if(document.join_frm.mpw_check.value.length == 0) {
		  alert("비밀번호체크란도 필수란다. 다시 확인해줭!");
		  return;
	  }
	  
	  if(document.join_frm.mpw.value.length != document.join_frm.mpw_check.value.length) {
		  alert("비밀번호가 일치 하지 않는디~! 다시 확인해줭!");
		  return;
	  }
	    if(document.join_frm.mname.value.length == 0) {
		  alert("이름은 필수 입력 사항이지롱. 다시 확인해줭!");
		  return;
	  }
	 
	   if(document.join_frm.memail.value.length == 0) {
		  alert("이메일은 필수 입력 사항이지롱. 다시 확인해줭!");
		  return;
	  }
	  document.join_frm.submit();
	  
  }