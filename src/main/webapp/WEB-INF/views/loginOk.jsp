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
							<% //view에서 넘어오고 jsp에서 model은(스크립틀릿에서는) request에서 보낸다 getAttribute는 String으로만 받는다
								//String checkIdFlag = (String) request.getAttribute("checkIdFlag");							
							int checkIdFlag = Integer.parseInt(request.getAttribute("checkIdFlag").toString()); //위와 같다
							int checkIdPwFlag = Integer.parseInt(request.getAttribute("checkIdPwFlag").toString()); //위와 같다
								if(checkIdFlag == 0) {
							%>
							<script type="text/javascript">
								alert("입력하신 아이디는 존재하지 않음. 다시 확인 하시옹");
								history.go(-1);
							</script>
							<% 
								} else if(checkIdPwFlag == 0){
							%>
							<script type="text/javascript">
								alert("입력하신 아이디와 비밀번호는 일치하지 않음. 다시 확인 하시옹");
								history.go(-1);
							</script>
							<%
								}
							%>
							
							${mid }님 로그인 하셨습니다. 반갑습니다!<br>
								${memberDto.mname }님의 가입일은 [${memberDto.mdate }]입니다.
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