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
	font-family: 'IBM Plex Sans KR', sans-serif;
}

div{
	font-family: 'IBM Plex Sans KR', sans-serif;
	margin-right: auto;
	margin-left: auto;
}

.navdiv {
	width: 1300px;
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

.subImg {
    /* max-width: 100%; */
    width: 30px;
}

.subImg-hover {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 40px;
    display: none;
}

.subImg:hover .subImg-hover {
    display: block;
}

.subButton{
	padding: 6.5px 0 0 0;
	background-color: white;
	width: 30px;
	height: 30px;
	border: none;
    margin: 0px auto;
 	position: relative;
	display: inline-block;
	cursor: pointer;
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

.mainSlideShow {
	width: 1500px;
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

.mainPageSize {
	width: 1500px;
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
	<div class="mainPageSize">
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
			<a href="/root/index"><img width="270px" height="90px" src="/root/resources/image/logo6.png"></a>
			<nav>
				<ul>
					<li><a href="/root/ggiriMember/memberList"> 프리랜서 보기 </a></li>
					<li><a href="/root/ggiriProject/projectList"> 프로젝트 보기 </a></li>
					<li><a href="/root/ggiriComplete/completeList"> 완성된 프로젝트 </a></li>
					<li><a href="/root/ggiriHelp/helpList"> 고객센터 </a></li>
					<li>
						<div class="dropdown"> 
							<button onclick="dp_menu()" class="subButton">
								<img class="subImg" src="/root/resources/image/menu1.png">
							</button>
						        <div style="display: none;" id="drop-content">
							        <c:if test="${loginUser != null}">
										<b>Ggiri 계정 접속</b><br>
							            <a href='/root/ggiriMember/myInfo'>내 정보</a>
							            <a href="/root/ggiriMember/ggiriLogout">LOGOUT</a>
							            <a href="/root/ggiriProject/heartList">찜 목록</a>
							        </c:if>   
							        <c:if test="${kakaoMember != null}">
										<b>Kakao 계정 접속</b><br>
										<a href="/root/ggiriMember/snsInfo">내 정보</a>
										<a href="/root/ggiriMember/kakaoLogout">LOGOUT</a>
										 <a href="/root/ggiriProject/heartList">찜 목록</a>
									</c:if>	
									<c:if test="${naverMember != null}">
										<b>Naver 계정 접속</b><br>
										<a href="/root/ggiriMember/snsInfo">내 정보</a>
										<a href="/root/ggiriMember/naverLogout">LOGOUT</a>
									</c:if>
									<c:if test="${googleMember != null}">
										<b>Google 계정 접속</b><br>
										<a href="/root/ggiriMember/snsInfo">내 정보</a>
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