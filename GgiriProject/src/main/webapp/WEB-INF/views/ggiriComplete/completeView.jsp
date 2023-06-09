
<!-- ggiriComplete/completeView.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ggiriComplete/completeView.jsp</title>
<style type="text/css">
table { border-collapse: collapse; }
</style>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<div class="wrap completeView">
	<h1> 프로젝트 내용 </h1>
		<table border="1">
			<tr>
				<th style="display: none"> 번 호 </th><td style="display: none">${data.completeNum }</td>
			</tr>
			<tr>
				<th style="display: none"> 작성자 </th><td style="display: none"></td>
			</tr>
			<tr>
				<th style="display: none"> 작성일 </th><td style="display: none">${data.comdate }</td>
			</tr>
			<tr>
				<th> 프로젝트 제목 </th>
			</tr>
			<tr>
				<td>${data.title }</td>
			</tr>
			<tr>
				<th> 프로젝트 설명 </th>
			</tr>
			<tr>
				<td><pre><c:out value="${data.content }"/></pre></td>
			</tr>
			<tr>
				<th> 이런 스킬을 사용했어요. </th>
			</tr>
			<tr>
				<td><pre><c:out value="${data.skill }"/></pre></td>
			</tr>
			<tr>
				<th> 함께 진행한 팀원들을 소개할게요. </th>
			</tr>
			<tr>
				<td>${data.members }</td>
			</tr>
			<tr>
				<th> Tag </th>
			</tr>
			<tr>
				<td>${data.tag }</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<div id="reply"></div>
					<c:if test="${data.id==loginUser }">
						<input type="button" value="수정" onclick="location.href='../ggiriComplete/completeModify?completeNum=${data.completeNum }'"> &nbsp;
						<input type="button" value="삭제" onclick="location.href='../ggiriComplete/delete?completeNum=${data.completeNum }'"> &nbsp;
					</c:if>
					<input type="button" value="프로젝트 목록" onclick="location.href='../ggiriComplete/completeList'">
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>