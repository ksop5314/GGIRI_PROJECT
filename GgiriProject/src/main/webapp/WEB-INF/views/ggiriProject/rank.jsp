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
	<div>
		<c:if test="${list.size() == 0 }">
			<h1>좋아요수 집계중입니다</h1>
		</c:if>
		<c:if test="">
			<div>
				<c:forEach var="list" items="${rank }">
				<c:set var="i" value="${i+1 }"></c:set>
					<div>
						<img style="width: 140px; height: 140px;"
						onclick="location.href=''" src="../resources/image/${i }.png">
						<div style="font-size: 15px;">글 번호 : ${list.projectNum }</div>
						<div style="font-size: 15px;">작성자 : ${list.id }</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>