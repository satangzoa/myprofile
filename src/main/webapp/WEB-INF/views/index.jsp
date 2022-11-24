<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
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
					<tr>
						<td class="skillbox"><span class="title03">J</span><span class="title04">AVA</span></td>
						<td rowspan="6" class="picbox">
							<img src="${pageContext.request.contextPath }/resources/img/pengsoo2.png">
						</td>
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">J</span><span class="title04">SP</span></td>
					
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">S</span><span class="title04">PRINGBOOT</span></td>
					
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">J</span><span class="title04">AVASCRIPT</span></td>
						
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">H</span><span class="title04">TML5</span></td>
						
					</tr>
					<tr>
						<td class="skillbox"><span class="title03">D</span><span class="title04">ATABASE</span></td>
						
					</tr>
				
				</table>	
				</center>		
			</td>
		</tr>
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>