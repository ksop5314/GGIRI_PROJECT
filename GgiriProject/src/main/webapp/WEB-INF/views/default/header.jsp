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
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<style type="text/css">
* {
	margin: 0;
}
.wrap{
	width: 95%;
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

body {
 	background: white;
}

.mainSlideShow {
	width: 100%;
	height: 100%;
	margin-bottom: 20px;
}


.slides {
    padding: 0;
    width: 100%;
    height: 320px;
    display: block;
    margin: 0 auto;
    position: relative;
}

.slides input { display: none; }

.slide-container { display: block; }

.slide {
    top: 0;
    opacity: 0;
    width: 100%;
    height: 320px;
    display: block;
    position: absolute;
}

.slide img {
    width: 100%;
    height: 100%;
}

input:checked + .slide-container  .slide {
    opacity: 1;
    transition: 0.1s;
}

.nav-dots {
  width: 100%;
  bottom: 9px;
  height: 11px;
  display: block;
  position: absolute;
  text-align: center;
}

.nav-dots .nav-dot {
  top: -5px;
  width: 11px;
  height: 11px;
  margin: 0 4px;
  position: relative;
  border-radius: 100%;
  display: inline-block;
  background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.8);
}

.fade {
    animation-name: fade;
    animation-duration: 3s;
}

@keyframes fade {
    from {
        opacity: .4
    }
    to {
        opacity: 1
    }
}

</style>
<script type="text/javascript">

var slideIndex = 0;

window.onload = function(){
    showSlides();
 }

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("slide");
   
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1
    }
    slides[slideIndex - 1].style.display = "block";

    setTimeout(showSlides, 3000);
}

</script>
</head>
<body>
	<div class="mainSlideShow">
		<div class="slides">
		    <input type="radio" name="radio-btn" id="img-1" checked />
		    <div class="slide-container">
			    <div class="slide fade">
			      <img src="/root/resources/image/mainImage2.png" />
		        </div>
		    </div>
		
		    <input type="radio" name="radio-btn" id="img-2" />
		    <div class="slide-container">
		        <div class="slide fade">
		          <img src="/root/resources/image/mainImage.jpg" />
		        </div>
		    </div>
		
		    <input type="radio" name="radio-btn" id="img-3" />
		    <div class="slide-container">
		        <div class="slide fade">
		          <img src="/root/resources/image/mainImage3.jpg" />
		        </div>
		    </div>
		</div>
	</div>
	<!-- // wrap -->
	<div class="navdiv">
		<div class="wrap">
			<a href="/root/index"><img width="400px" height="120px" src="/root/resources/image/logo6.png"></a>
			<nav>
				<ul>
					<li><a href="/root/ggiriMember/memberList"> 프리랜서 보기 </a></li>
					<li> | </li>
					<li><a href="/root/ggiriProject/projectList"> 프로젝트 보기 </a></li>
					<li> | </li>
					<li><a href="/root/ggiriComplete/completeList"> 진행한 프로젝트 </a></li>
					<!-- <li> | </li>
					<li><a href="/root/ggiriMessage/messageList">chat</a></li>
					 -->
					<li> | </li>
					<c:if test="${kakaoMember != null}">
						<li style="font-size: 12px;"><a>${kakaoMember.name}</a></li>
						<li style="font-size: 10px;"><a>${kakaoMember.email}</a></li>
						<li style="font-size: 12px;"><p><b>Kakao</b> 계정으로 접속중</p></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/snsInfo">내 정보</a></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/kakaoLogout">LOGOUT</a></li>
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
					</c:if>
					
					<c:if test="${loginUser != null}">
						<li><a href="/root/ggiriMember/myInfo">내 정보</a></li>
						<li> | </li>
						<li><a href="/root/ggiriMember/ggiriLogout"> LOGOUT </a></li>
						
					</c:if>	
				</ul>
			</nav>
		</div>
	</div>
	<!-- // navdiv -->
</body>
</html>