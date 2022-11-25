<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contact.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.js"></script>
<title>** Bak's profile **</title>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="75%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01">저는 박소망입니다.</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02">저는 개발자를 꿈꾸고 있습니다.</span>
			</td>
		</tr>
		<tr>
			<td >
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="15">
					<tr class="contentbox">
						<td class="content">
						<center>
							<table border="0" cellspacing="0" cellpadding="15">
								<form action="questionModify" method="post" name="board_frm">
									<input type="hidden" value="${qdto.qnum }" name="qnum">
									<tr>
										<td><span class="content_text01">ID&nbsp;&nbsp;&nbsp; </span></td>
										<td><input class="input_type01" type="text" name="qid" value="${qdto.qid }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME &nbsp;&nbsp; &nbsp;</span></td>
										<td><input class="input_type01" type="test" name="qname" value="${qdto.qname }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">QUESTION </span></td>
										<td><textarea class="textarea_type01"  rows="5" clos="30" name="qcontent"  readonly="readonly">${qdto.qcontent}</textarea></td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MAIL &nbsp;&nbsp;</span></td>
										<td><input class="input_type01" type="text" name="qemail"  value="${qdto.qemail }" readonly="readonly"></td>
									</tr>
									
									<tr>
										<td><span class="content_text01">DATE &nbsp;&nbsp;</span></td>
										<td><input class="input_type01" type="text" name="qdate"  value="${qdto.qdate }" readonly="readonly"></td>
									</tr>
									<tr> 
										<td colspan="2">
										<%
											String boardId = (String) request.getAttribute("qid");
										if(boardId.equals("손님이심")) {//로그인 안됨
										%>
											<input class="button_type01" type="submit" value="수정" >&nbsp;&nbsp;
											<input class="button_type01" type="button" value="삭제" onclick="script:window.location='questionDelete?qnum=${qdto.qnum}'">
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
										<%
											} else if((sessionId != null) && (sessionId.equals(boardId))) {
										%>
											<input class="button_type01" type="submit" value="수정" >&nbsp;&nbsp;
											<input class="button_type01" type="button" value="삭제" onclick="script:window.location='questionDelete?qnum=${qdto.qnum}'">
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
										<%
											}else{
										%>
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
										<%
											}
											%>
										</td>
									</tr>
								</form>
							</table>
							<center>
						</td>
					</tr>
				</table>	
				</center>		
			</td>
		</tr>
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>