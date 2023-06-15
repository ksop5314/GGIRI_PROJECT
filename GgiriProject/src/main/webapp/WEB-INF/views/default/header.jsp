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
	font-family: 'IBM Plex Sans KR', sans-serif;
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
nav {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	width: 100%;
	border-radius: 40px;
	border: 2px solid navy;
}
nav ul {
	list-style: none;
	display: flex;
	justify-content: end;
}
nav ul li {
	padding: 10px;	
}
nav ul li:last-child{
	padding-right: 30px;
}

nav ul a {
	padding: 10px;
	text-decoration: none;
	color: black;
}
nav ul li a {
	display: flex;
	text-decoration: none;
	color: black;
}
nav ul li a:hover {
	/* color: #D8D8D8; */
}
.img {
    /* max-width: 100%; */
    width: 30px;
}
.img-hover {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 40px;
    display: none;
}
.img:hover .img-hover {
    display: block;
}
.button{
	padding: 6.5px 0 0 0;
	background-color: white;
	width: 30px;
	height: 30px;
	border: none;
    margin: 0px auto;
 	position: relative;
	display: inline-block;
}
.dropdown {
	width: 30px;
	height: 30px;
    margin: 0px auto;
}
#drop-content{
    position: absolute;
    z-index: 1;
}
#drop-content a{
    display:block;
    font-size: 14px;
    background-color: #F6F6F6;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 2px 0px 0px 0px;
}
#drop-content p {
	display:block;
    font-size: 14px;
    background-color: #F6F6F6;
    color: black;
    text-decoration: none;
    padding: 10px 36px;
    margin: 2px 0px 0px 0px;
}
/* .dropdown-button {
	border: none;
	width: 40px;		
	height: 40px;
}
.dropdown-content {
	display: none;
	position: absolute;
	min-width: 75px;
	padding: 5px;
}
.dropdown-content a {
	color: black;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	display: block;
}
.dropdown-content a:hover {
	border-bottom: 2px solid black;
	text-align: center;
	background-color: #F6F6F6;
	opacity:0.75;
}
.dropdown:hover .dropdown-content {
	display: block;
} */
/* .dropdown:hover .dropdown-button {
	background-color: #CD853F;
} */

body {
 	background: white;
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
			<a href="/root/index"><img width="300px" height="95px" src="/root/resources/image/logo6.png"></a>
			<nav>
				<ul>
					<li><a href="/root/ggiriMember/memberList"> 프리랜서 보기 </a></li>
					<li><a href="/root/ggiriProject/projectList"> 프로젝트 보기 </a></li>
					<li><a href="/root/ggiriComplete/completeList"> 진행한 프로젝트 </a></li>
					<!-- <li> | </li>
					<li><a href="/root/ggiriMessage/messageList">chat</a></li>
					 -->
					<!-- <li> | </li> -->
					<%-- <c:if test="${kakaoMember != null}">
						<li><a>${kakaoMember.name}</a></li>
					<li> | </li>
					<c:if test="${kakaoMember != null}">
						<li style="font-size: 12px;"><a>${kakaoMember.name}</a></li>
						<li style="font-size: 10px;"><a>${kakaoMember.email}</a></li>
						<li style="font-size: 12px;"><p><b>Kakao</b> 계정으로 접속중</p></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/snsInfo">내 정보</a></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/kakaoLogout">LOGOUT</a></li>
					</c:if> --%>
			<%-- 		<c:if test="${naverMember != null}">
						<li><a>${naverMember.name}</a></li>
					</c:if>
					<c:if test="${naverMember != null}">
						<li style="font-size: 12px;"><a>${naverMember.name}</a></li>
						<li style="font-size: 10px;"><a>${naverMember.id}</a></li>
						<li style="font-size: 12px;"><p><b>Naver</b> 계정으로 접속중</p></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/snsInfo">내 정보</a></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/naverLogout">Logout</a></li>
					</c:if>
					<c:if test="${googleMember != null}">
						<li style="font-size: 10px;"><a>${googleMember.name}</a></li>
						<li style="font-size: 10px;"><a>${googleMember.id}</a></li>
						<li style="font-size: 12px;"><p><b>Google</b> 계정으로 접속중</p></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/snsInfo">내 정보</a></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/googleLogout">Logout</a></li>
					</c:if>
					<c:if test="${kakaoMember == null && loginUser == null && naverMember == null && googleMember == null}">
						<li><a href="/root/ggiriMember/ggiriLogin"> LOGIN </a></li>
					</c:if> --%>
					
					<%-- <c:if test="${loginUser != null}">
						<li><a href="/root/ggiriMember/myInfo">내 정보</a></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/ggiriLogout"> LOGOUT </a></li>
						
					</c:if>	 --%>
					<li>
					<div class="dropdown"> 
					<button onclick="dp_menu()" class="button">
						<img class="img" src="/root/resources/image/menu1.png">
					</button>
				        <div style="display: none;" id="drop-content">
				        <c:if test="${loginUser != null}">
				            <a href='/root/ggiriMember/myInfo'>내 정보</a>
				            <a href="/root/ggiriMember/ggiriLogout">LOGOUT</a>
				        </c:if>   
				        <c:if test="${kakaoMember != null}">
							<a href="/root/ggiriMember/snsInfo">내 정보</a>
							<p>Kakao 계정 접속</p>
							<a href="/root/ggiriMember/kakaoLogout">LOGOUT</a>
						</c:if>	
						<c:if test="${naverMember != null}">
							<a href="/root/ggiriMember/snsInfo">내 정보</a>
							<p>Naver 계정 접속</p>
							<a href="/root/ggiriMember/naverLogout">LOGOUT</a>
						</c:if>
						<c:if test="${googleMember != null}">
							<a href="/root/ggiriMember/snsInfo">내 정보</a>
							<p>Google 계정 접속</p>
							<a href="/root/ggiriMember/googleLogout">LOGOUT</a>
						</c:if>
						<c:if test="${kakaoMember == null && loginUser == null && naverMember == null && googleMember == null}">
							<a href="/root/ggiriMember/ggiriLogin"> LOGIN </a>
						</c:if>
		       			</div>
		       		</div>
		       		</li>
	<%-- 				<div class="dropdown"> 
 						<button class="dropdown-button">
 							<img class="img" src="/root/resources/image/menu.png">
  							<!-- <img class="img-hover" src="/root/resources/image/menu2.png"> -->
  						</button>
 						<div class="dropdown-content">
							<c:if test="${loginUser != null}">
								<a href="/root/ggiriMember/myInfo">내 정보</a>
								<a href="/root/ggiriMember/ggiriLogout">LOGOUT</a>
							</c:if>	
							<c:if test="${kakaoMember != null}">
								<a href="/root/ggiriMember/snsInfo">내 정보</a>
								<li style="font-size: 12px;"><p><b>Kakao</b> 계정으로 접속중</p></li>
								<a href="/root/ggiriMember/kakaoLogout">LOGOUT</a>
							</c:if>	
							<c:if test="${naverMember != null}">
								<a href="/root/ggiriMember/snsInfo">내 정보</a>
								<li style="font-size: 12px;"><p><b>Naver</b> 계정으로 접속중</p></li>
								<a href="/root/ggiriMember/naverLogout">LOGOUT</a>
							</c:if>
							<c:if test="${googleMember != null}">
								<a href="/root/ggiriMember/snsInfo">내 정보</a>
								<li style="font-size: 12px;"><p><b>Google</b> 계정으로 접속중</p></li>
								<a href="/root/ggiriMember/googleLogout">LOGOUT</a>
							</c:if>
							<c:if test="${kakaoMember == null && loginUser == null && naverMember == null && googleMember == null}">
								<a href="/root/ggiriMember/ggiriLogin"> LOGIN </a>
							</c:if>
						</div>
					</div> --%>
				</ul>
			</nav>
		</div>
	</div>
	<!-- // navdiv -->
	<script>
        function dp_menu(){
            let click = document.getElementById("drop-content");
            if(click.style.display === "none"){
                click.style.display = "block";
 
            }else{
                click.style.display = "none";
 
            }
        }
    </script>
</body>
</html>