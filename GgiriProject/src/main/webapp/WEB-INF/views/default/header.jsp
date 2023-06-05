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
<script type="text/javascript">
	function new_chat(){
		window.open(
			"/root/ggiriChat/chatEcho",
		)
		
	}
</script>
</head>
<body>
	<div class="wrap">
		<div class="header"></div>	
	</div>
	<!-- // wrap -->
	<div class="navdiv">
		<div class="wrap">
			<a href="/root/index"><img width="300px" height="95px" src="/root/resources/image/logo6.png"></a>
			<nav>
				<ul>
					<li><a href="/root/ggiriMember/memberList"> 프리랜서 보기 </a></li>
					<li> | </li>
					<li><a href="/root/ggiriProject/projectList"> 프로젝트 보기 </a></li>
					<li> | </li>
					<li><a href="/root/ggiriComplete/completeList"> 진행한 프로젝트 </a></li>
					<li> | </li>
					<c:if test="${sessionConfigVO != null}">
						<li><a>${sessionConfigVO.kakaoNickname}</a></li>
						<li style="font-size: 10px;"><a>${sessionConfigVO.kakaoEmail}</a></li>
						<li style="font-size: 12px;"><p><b>Kakao</b> 계정으로 접속중</p></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/kakaoLogout">LOGOUT</a></li>
					</c:if>
					<c:if test="${naverMember != null}">
						<li><a>${naverMember.name}</a></li>
						<li style="font-size: 10px;"><a>${naverMember.id}</a></li>
						<li style="font-size: 12px;"><p><b>Naver</b> 계정으로 접속중</p></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/naverLogout">Logout</a></li>
					</c:if>
					<c:if test="${sessionConfigVO == null && loginUser == null && naverMember == null}">
						<li><a href="/root/ggiriMember/ggiriLogin"> LOGIN </a></li>
					</c:if>
					
					<c:if test="${loginUser != null}">
						<li>
							<a href="/root/ggiriMember/ggiriLogout"> LOGOUT </a>

						</li>
					</c:if>	
				</ul>
			</nav>
		</div>
	</div>
	<!-- // navdiv -->
</body>
</html>