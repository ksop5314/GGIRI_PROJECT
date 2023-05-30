<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}
.background {
   	background-image: url('resources/image/mainBack.jpg');
}
.banner-txt {
	font-size: 2rem;
	line-height: 35px;
	font-family: 'IBM Plex Sans KR', sans-serif;
}

</style>
</head>
<body>
	<div class="search-box">
		<input type="text" name="s" id="search-txt" placeholder="어떤 프로젝트 찾으세요?" class="search-txt" >
    	<a class="search-btn" href="#">
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
			<button class="signup" style="font-size:14px;width:150px;height:50px;"><a href="/root/ggiriMember/signup_free">프리랜서 회원가입</a></button>
<!-- 			<span class="signup" style="font-size:1.2rem;width:10rem"><a href="/signup-free">프리랜서 회원가입</a></span> -->			
			<br><br>
		</div>
    </div>
</body>
</html>
