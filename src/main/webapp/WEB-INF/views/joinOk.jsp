<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contact.css">
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
				<table width="70%" border="0" cellspacing="0" cellpadding="15">
					<tr class="contentbox">
						<td class="content">
							안녕하십니꽈.<br>
							♥${mname}♥님 회원 가입을 축하드립니다!<br>
							가입하신 아이디는 ★${mid}★ 입니돠.
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