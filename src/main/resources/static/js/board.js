/**
 * 
 */
 
 function boardCheck() {
		 
	if(document.board_frm.qname.value.length == 0) {
		alert("이름은 필수 입력 사항이라구.");
		return;
	} 
	 
	 if(document.board_frm.qname.value.length < 2) {
		alert("이름은 2글자 이상 입력 사항이라구우.");
		return;
	} 
	 
	 if(document.board_frm.qname.value.length > 10) {
		alert("이름은 10글자 미만 사항이라구우우.");
		return;
	} 
	 
	  if(document.board_frm.qcontent.value.length <10) {
		alert("질문내용은 10글자 이상 이어야한다궁.");
		return;
	} 
	 
	 
	 if(document.board_frm.qemail.value.length == 0) {
		alert("이메일은 필수입력 사항이라구.");
		return;
	} 
	 
	 
	document.board_frm.submit();
 }