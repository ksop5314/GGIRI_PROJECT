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
	margin-left: 110px;
	margin-right: 50px;  
	float:left;
}
table {
    border-collapse: separate;
    border-spacing: 0;
    table-layout: fixed;
    width: 200px;
    height: 200px;
}

td {
    border: 1px solid black;
    border-radius: 30px;
    padding: 10px;
}
.center-parent {
    display: flex;
    justify-content: center;
}
</style>
</head>
<body>
	<div class="center-parent">
		<c:if test="${list.size() == 0 }">
			<h1>좋아요수 집계중입니다</h1>
		</c:if>
		<div>
			<c:forEach var="list" items="${rank }">
			<c:set var="i" value="${i+1}"></c:set>
				<div class="id">
					<table >
					<tr>
					<td>
						<img style="width: 140px; height: 140px; "
						onclick="location.href='${contextPath }/ggiriProject/projectView?projectNum=${list.projectNum}'" src="${contextPath }/resources/image/${i }.png">
						<div style="font-size: 14px;"><a href="${contextPath}/ggiriProject/projectView?projectNum=${list.projectNum}">${list.title }</a></div>
					</td>
					<tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>