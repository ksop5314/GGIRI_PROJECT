<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr" dir="ltr">
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<title>body</title>
<style type="text/css">
body{
    margin: 0;
    padding: 0;
    background-color: #fff;
}
.search-box{
    padding: 10px;
    position: absolute;
    top: 30%;
    left: 50%;
    transform: translate(-50%,-50%);
    height: 30px;
    background-color: #fff;
    border: 2.5px solid navy;
    border-radius: 30px;
    transition: 0.4s;
    width:30px;
}
.search-box:hover{
    box-shadow: 0px 0px .5px 1px navy;
    width: 282px;
}
.search-btn{
    text-decoration: none;
    float: right;
    width: 30px;
    height: 30px;
    background-color: #fff;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: navy;
}
.search-box:hover > .search-btn{
    background-color: #fff;
}
.search-txt{
    display: flex;
    padding: 0;
    width: 0px;
    border:none;
    background: none;
    outline: none;
    float: left;
    font-size: 1rem;
    line-height: 30px;
    transition: .4s;
}
.search-box:hover > .search-txt{
    width: 240px;
    padding: 0 6px;
    cursor: pointer;
}
.background {
   	background-image: url('resources/image/mainBack.jpg');
}
.banner-txt {
	font-size: 2rem;
	line-height: 35px;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
.back button {
    background-color: #FA8072;
    color: white;
    border:none; 
    border-radius:15px; 
    min-height: 40px; 
    min-width: 150px;
   	font-family: 'IBM Plex Sans KR', sans-serif; 
   	cursor: pointer;
}

.back button:hover {
      background-color:#FFA07A;
      transition: 0.5s;
      color: white;
}


#chat {
    position: fixed;
    right: 60px;
    bottom: 150px;
    width: 110px;
    height: 100px;
    cursor: pointer;
}

</style>
<script type="text/javascript">
   
	<!--Start of Tawk.to Script-->
	
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
		var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
		s1.async=true;
		s1.src='https://embed.tawk.to/64792a8b74285f0ec46f0cd5/1h1skscbn';
		s1.charset='UTF-8';
		s1.setAttribute('crossorigin','*');
		s0.parentNode.insertBefore(s1,s0);
	})();
	<!--End of Tawk.to Script-->
   
/*    function chatActivate(){
      window.open("/root/ggiriChat/chatAct", "_blank", "width=500px, height=1500px");
   } */
	
   function searchProject() {
	    var keyword = document.getElementById("searchTxt").value;
	    var url = "/root/ggiriProject/projectList.do?condition=titleContent&keyword=" + encodeURIComponent(keyword);
	    window.location.href = url;
	}
   
   /* function searchSkill() {
	    var keyword = document.getElementById("key").value;
	    var url = "/root/ggiriProject/projectList.do?condition=titleContent&keyword=" + encodeURIComponent(key);
	    window.location.href = url;
	} */
   
</script>
</head>
<body>
	<div class="search-box">
    <input type="text" id="searchTxt" name="s" placeholder="어떤 프로젝트를 찾으세요?" class="search-txt" />
	    <a class="search-btn" href="#" onclick="searchProject()">
	        <i class="fas fa-search"></i>
	    </a>
	</div>

    <br><br>
    <div class="background">
		<div class="back" style="text-align:center; padding-top:8rem; padding-bottom:2rem; font-family: 'IBM Plex Sans KR', sans-serif;">
			<p class="main-banner-text"><br>대한민국 최고<br>
			<span style="color:#f76a22">IT 프리랜서 매칭 플랫폼</span></p><br>
			<p class="banner-txt">
			다양한 동료들과 함께<br>
			새로운 팀을 만들어<br>
			우리 '끼리' 계속 성장하는</p>
 			<img width="150px" height="45px" alt="" src="resources/image/logo6.png">
			<br>
			<c:if test="${loginUser != null || naverMember != null || kakaoMember != null }">
				<button class="findmem" type="button" onclick="location href='#'">동료 찾기 >></button>			
			</c:if>
			<c:if test="${loginUser == null && naverMember == null && kakaoMember == null }">
			<button class="signup" type="button" onclick="location.href='/root/ggiriMember/signup_free'">프리랜서 회원가입</button>
			</c:if>
			<br><br><br><br><br>
			<a href="${path}/board/best_list.do">베스트 게시물 게시판</a>
			<br>
			
			<!-- <div class="eblock-project">
			<a href="/root/ggiriProject/projectList.do?condition=titleContent&keyword=JAVA">
            <div class="emain-project bg-gradation-10">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-java.png"></p>
                <p class="emain-project-name">JAVA</p>
            </div>
			</a>
			<a href="/root/ggiriProject/projectList.do?condition=titleContent&keyword=ASP%2C.NET">
            <div class="emain-project bg-gradation-30">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-asp.png"></p>
                <p class="emain-project-name">ASP.NET</p>
            </div>
			</a>
            <div class="emain-project bg-gradation-50">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-php.png"></p>
                <p class="emain-project-name">PHP</p>             
            </div>
			</a>
			<a href="/root/ggiriProject/projectList.do?condition=titleContent&keyword=android,ios">
            <div class="emain-project bg-gradation-60">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-mobile.png"></p>
                <p class="emain-project-name">iOS・Android</p>             
            </div>
			</a>
			<a href="./list-partner?oc=1">
            <div class="emain-project bg-gradation-10">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-pub.png"></p>
                <p class="emain-project-name">퍼블리싱</p>             
            </div>
			</a>
			<a href="./list-partner?oc=2">
            <div class="emain-project bg-gradation-30">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-design.png"></p>
                <p class="emain-project-name">디자인</p>             
            </div>
			</a>
			<a href="./list-partner?oc=3">
            <div class="emain-project bg-gradation-50">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-plan.png"></p>
                <p class="emain-project-name">기획</p>             
            </div>
			</a>
			<a href="./list-partner?oc=4">
            <div class="emain-project bg-gradation-60">
                <p class="emain-project-img"><img class="w-10" src="./public/images/icon-main-etc.png"></p>
                <p class="emain-project-name">기타</p>             
            </div>
			</a>
        </div>
         -->
          <option value="title" <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
			 <input type="text" name="keyword" id="keyword" style="font-family: 'IBM Plex Sans KR', sans-serif"
           placeholder="검색어" value="${keyword }"/>
    <button id="button1" type="submit">검색</button>
			
			<button class="JAVA" id="key" onclick="searchPro()">JAVA</button>	
			<button class="SERVER" id="key" onclick="searchPro()">SERVER</button>	
			<button class="PHP" ID="key" onclick="/root/ggiriProject/projectList.do?condition=titleContent&keyword=">PHP</button>	
			<button class="ios" ID="key" onclick="/root/ggiriProject/projectList.do?condition=titleContent&keyword=">ios, Android</button>			
			<br><br>
			<button class="publishing" type="button" onclick="searchProject()">퍼블리싱</button>			
			<button class="design" type="button" onclick="searchProject()">디자인</button>			
			<button class="planning" type="button" onclick="searchProject()">기획</button>			
			<button class="sundry" type="button" onclick="searchProject()">기타</button>			
			 
		</div>
    </div>
</body>
</html>
