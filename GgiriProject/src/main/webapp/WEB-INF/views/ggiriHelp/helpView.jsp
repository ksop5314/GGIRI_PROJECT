<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<table border="1">
		<tr>
			<th style="display: none"> 번 호 </th><td style="display: none">${data.helpNo }</td>
		</tr>
		<tr>
			<th width="150px"> 작성자 </th><td width="850px">${data.id }</td>
		</tr>
		<tr>
			<th> 작성일 </th><td>${data.helpDate }</td>
		</tr>
		<tr>
			<th> 제목 </th><td>${data.title }</td>
		</tr>
		<tr>
			<th> 프로젝트 설명 </th><td><pre><c:out value="${data.content }"/></pre></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<c:choose>
					<c:when test="${loginUser }"></c:when>
				</c:choose>
				<c:if test="${loginUser == null}">
					
				</c:if>
				<c:if test="${data.id==loginUser }">
					<input type="button" value="수정" onclick="location.href='../ggiriHelp/helpModifyForm?helpNo=${data.helpNo }'"> &nbsp;
					<input type="button" value="삭제" onclick="location.href='../ggiriHelp/helpDelete?helpNo=${data.helpNo }'"> &nbsp;
				</c:if>
				<c:if test="${data.id == kakaoMember.id || data.id == googleMember.id || data.id == naverMember.id }">
					<input type="button" value="수정" onclick="location.href='../ggiriHelp/helpModifyForm?helpNo=${data.helpNo }'"> &nbsp;
					<input type="button" value="삭제" onclick="location.href='../ggiriHelp/helpDelete?helpNo=${data.helpNo }'"> &nbsp;
				</c:if>
			</td>
		</tr>
	</table>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>