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
								<form action="questionOk" method="post" name="board_frm">
									<tr>
										<td><span class="content_text01">ID&nbsp;&nbsp;&nbsp; </span></td>
										<td><input class="input_type01" type="text" name="qid" value="${memberId }" readonly="readonly"></td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME &nbsp;&nbsp; &nbsp;</span></td>
										<td><input class="input_type01" type="test" name="qname"></td>
									</tr>
									<tr>
										<td><span class="content_text01">QUESTION </span></td>
										<td><textarea class="textarea_type01"  rows="5" clos="30" name="qcontent"></textarea></td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MAIL &nbsp;&nbsp;</span></td>
										<td><input class="input_type01" type="text" name="qemail"></td>
									</tr>
									
									<tr> 
										<td colspan="2">
											<input class="button_type01" type="button" value="질문하기" onclick="boardCheck()">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
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