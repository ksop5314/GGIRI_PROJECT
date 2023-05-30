<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
* {
	margin: 0;
}
.wrap{
	width: 1000px;
	margin: auto;
	text-align: left;
}
.header {
	width: 1000px;
}
.navdiv {
	width: 100%;
}
li {
	padding: 10px;
	text-align: left;
}
nav {
	width: 100%;
	border-radius: 40px 80px / 80px 40px;
	border: 2px solid navy;	
}
nav ul {
	list-style: none;
	display: flex;
	justify-content: end;
}
nav ul li {
	padding: 10px;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
nav ul a {
	padding: 10px;
	text-decoration: none;
	color: black;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
nav ul li a {
	text-decoration: none;
	font-family: 'IBM Plex Sans KR', sans-serif;
	color: black;
}
nav ul li a:hover {
	color: #D8D8D8;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="header"></div>	
	</div>
	<!-- // wrap -->
	<div class="navdiv">
		<div class="wrap">
			<a href="/root/index"><img width="300px" height="95px" src="resources/image/logo6.png"></a>
			<nav>
				<ul>
					<li><a href="/root/free/freeList"> 프리랜서 보기 </a></li>
					<li> | </li>
					<li><a href="/root/project/projectList"> 프로젝트 보기 </a></li>
					<li> | </li>
					<li>
						<c:if test="${loginUser != null }">
							<a href="/root/member/logout"> LOGOUT </a>
						</c:if>
						<c:if test="${loginUser == null }">
							<a href="/root/member/login"> LOGIN </a>
						</c:if>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- // navdiv -->
</body>
</html>