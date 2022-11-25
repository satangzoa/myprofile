<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- for문 사용위해 넣는다 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- jsp 사용위해 넣는다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/title.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/contact.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
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
							<br><br>
								<center>
								<table width="95%" border="0" cellspacing="0" cellpadding="15">
									<tr>
										<th class="board_title">NO</th>
										<th class="board_title">ID</th>
										<th class="board_title" width="50%">CONTENT</th>
										<th class="board_title">NAME</th>
										<th class="board_title">DATE</th>
									</tr>
									
									<c:forEach items="${qdtos }" var="qdto"> 
									<tr>
									<a href=""></a>
										<td class="board_content01">${qdto.qnum }</td>
										<td class="board_content01">${qdto.qid }</td>
										<td class="board_content02">
										<a href="questionView?qnum=${qdto.qnum }">
										<c:choose> 
											<c:when test="${fn:length(qdto.qcontent) > 20}">
												<c:out value="${fn:substring(qdto.qcontent,0,19) }"></c:out>... 
											</c:when>
											<c:otherwise>
												<c:out value="${qdto.qcontent }"></c:out>
											</c:otherwise>
										</c:choose>
										</a>
										</td>
										<td class="board_content01">${qdto.qname}</td>
										<td class="board_content01"> <%-- 설명설명설명 설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명설명--%>
										<c:out value="${fn:substring(qdto.qdate,0,10) }"></c:out>
									</td>
									</tr>
									</c:forEach>
									<tr>
										<td colspan="5" align="right">
										<input type="button" value="질문하기" class="button_type01" onclick="script:window.location='question'">
										</td>
									</tr>
								</table>
								</center>
							<br>
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