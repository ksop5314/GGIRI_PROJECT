
<!-- ggiriProject/projectView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriProject/projectView.jsp</title>
<style type="text/css">
table { border-collapse: collapse; }
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap projectView">
	<h1> 프로젝트 내용 </h1>
		<table border="1">
			<tr>
				<th width="150px"> 번 호 </th><td width="850px">${data.projectNum }</td>
			</tr>
			<tr>
				<th> 작성자 </th><td>${data.id }</td>
			</tr>
			<tr>
				<th> 제 목 </th><td>${data.title }</td>
			</tr>
			<tr>
				<th> 작성일 </th><td>${data.prodate }</td>
			</tr>
			<tr>
				<th> 프로젝트 설명 </th><td><pre><c:out value="${data.content }"/></pre></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<div id="reply"></div>
					<c:if test="${data.id==loginUser }">
						<input type="button" value="수정" onclick="location.href='../ggiriProject/modifyForm?projectNum=${data.projectNum }'"> &nbsp;
						<input type="button" value="삭제" onclick="location.href='../ggiriProject/delete?projectNum=${data.projectNum }'"> &nbsp;
					</c:if>
					<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'">
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"></c:import>

</body>
</html>