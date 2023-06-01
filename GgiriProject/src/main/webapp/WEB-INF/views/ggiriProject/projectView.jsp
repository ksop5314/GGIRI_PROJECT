
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
				<th width="100px"> 글 번호 </th><td width="200px">${data.projectNum }</td>
				<th width="100px"> 작성자 </th><td width="200px">${data.id }</td>
			</tr>
			<tr>
				<th width="100px"> 제 목 </th><td width="200px">${data.title }</td>
				<th width="100px"> 작성일 </th><td width="200px">${data.prodate }</td>
			</tr>
			<tr>
				<th> 내 용 </th><td>${data.content }</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<div id="reply"></div>
					<c:if test="${data.id==loginUser }">
						<input type="button" value="수정" onclick="location.href='${contextPath }/board/modifyForm?writeNo=${data.writeNo }'"> &nbsp;
						<input type="button" value="삭제" onclick="location.href='${contextPath }/board/delete?writeNo=${data.writeNo }&imageFileName=${data.imageFileName }'"> &nbsp;
					</c:if>
					<input type="button" value="답글달기" onclick="slide_click()"> &nbsp;
					<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriProject/projectList'">
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"></c:import>

</body>
</html>