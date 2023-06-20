<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.id{
	text-align: center;
	margin: auto;
	margin-left: 180px;
	margin-right: 180px; 
	float:left;
}
</style>
</head>
<body>
	<div>
		<c:if test="${list.size() == 0 }">
			<h1>좋아요수 집계중입니다</h1>
		</c:if>
		<div>
			<c:forEach var="list" items="${rank }">
			<c:set var="i" value="${i+1}"></c:set>
				<div class="id">
					<img style="width: 140px; height: 140px; "
					onclick="location.href='${contextPath }/ggiriProject/projectView?projectNum=${list.projectNum}'" src="${contextPath }/resources/image/${i }.png">
					<div style="font-size: 15px;">글 번호 : ${list.projectNum }</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>