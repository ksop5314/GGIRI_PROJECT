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
	width: 1200px;
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
			<a href="/root/indexAdmin"><img width="300px" height="95px" src="/root/resources/image/logo6.png"></a>
			<nav>
				<ul>
					<li><a href="/root/ggiriAdmin/adminList"> <span style="font-size: 10px;">(관리자 권한)</span> 등록된 프리랜서 보기 </a></li>
					<li> | </li>
					<li><a href="/root/ggiriAdmin/projectList"> <span style="font-size: 10px;">(관리자 권한)</span> 진행중인 프로젝트 보기 </a></li>
					<li> | </li>
					<li><a href="/root/ggiriAdmin/adminCompleteList"> <span style="font-size: 10px;">(관리자 권한)</span> 완료된 프로젝트 </a></li>
					<li> | </li>
					<li>${ADMIN } 관리자 계정으로 접속중</li>
					<li> | </li>
					<li><a href="/root/ggiriAdmin/adminLogout"> LOGOUT </a></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- // navdiv -->
</body>
</html>