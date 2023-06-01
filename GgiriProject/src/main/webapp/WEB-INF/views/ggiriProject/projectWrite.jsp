
<!-- project/projectWrite.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project/projectWrite.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"></c:import>
	<h1>프로젝트 등록</h1>
	<div class="wrap write_form">
		<div class="write_save">
			<form action="../project/projectSave" enctype="multipart/form-data" method="post">
				<b> 작성자 </b><br>
				<input type="text" name="id" value="${loginUser }" readonly><br>
				<b> 제 목 </b><br>
				<input type="text" name="title" size="50"><br>
				<b> 내 용 </b><br>
				<textarea rows="10" cols="50" name="content"></textarea><br>
				<br>
				<input type="submit" value="완료"> &nbsp;
				<input type="button" value="프로젝트 목록" onclick="location.href='../project/projectList'">
			</form>
		</div>
	</div>
	<c:import url="../default/footer.jsp"></c:import>
</body>
</html>