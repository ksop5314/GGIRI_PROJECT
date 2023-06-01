
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectAll.jsp</title>
<style type="text/css">
.skill{
	display: inline-block;
}
form {
	float:left; 
	margin-right: 15px;
}
#h3 {
	text-align: center;
	background-color: white;
	border-color: black;
	opacity:1.0;
}
#h3:hover {
	background-color: gray;
}
table { border-collapse: collapse; }
.div_view_projects { justify-content: center; }
.ecard-100-white { display: inline-block; }
#div_view_projects { text-align: center; }
</style>
</head>
<body>
<c:import url="../default/header.jsp"/>
	<br>
	<div class="wrap">
		<div  style="float: left">
		   <p>끼리가 보증하는 IT파트너</p>
		   <p id="h">프로젝트 등록하면<br>
		   더 정확한 추천을 받을 수 있어요</p>
		</div> 
		<div>
		   <button class="#" type="button" style="border-radius: 10px; border-width: 2px; font-size: 15px; padding-top: 5px; padding-bottom: 5px; border-color: #f76a22; background-color: #fff;color: #000;" id="pjtReg" onclick="pjtReg()">프로젝트 등록하기 </button>
		</div>
		<br><br>
		<div   class="skill">
		   <form method="get" action="main">
		      <button id="h3" type="submit" style=" border-radius: 30px;"> ⚙️  개발자 </button>
			</form>
			<form action="#">
			   <button id="h3" type="submit" style=" border-radius: 30px;"> 🛠  퍼블리셔  </button> 
			</form>
			<form action="#">
			    <button id="h3" type="submit" style=" border-radius: 30px;"> 🎨  디자이너 </button> 
			</form>
			<form action="#">
			   <button id="h3" type="submit" style=" border-radius: 30px;"> 📝  기획자 </button> 
			</form>
			<form action="#">
			   <button id="h3" type="submit" style=" border-radius: 30px;"> 🔗  기타 </button> 
			</form>
		</div>
	</div>
	<br><br>
	
	<div id="div_view_projects">
		<div class="ecard-100-white ">
			<div class="ecard-lb-div">
	            <span class="ebtn-small ebtn-cf-pink">고급</span>
	            <span class="ebtn-small ebtn-cf-pink">JAVA</span> 
			</div>
	        <p class="mr-10">
	            <span class="ebtn-small ebtn-cf-dgray">개발자</span>
	            <span class="ebtn-small ebtn-cf-dgray">상주</span>
	            <span class="ebtn-small ebtn-cf-dgray">3개월</span>
				<span class="ebtn-small ebtn-cf-dgray">서울|중구</span>
				<span class="ebtn-small ebtn-cf-dgray">금액 비공개</span>
	        </p>
	        <p class="ecard-title"> <a href="../project/projectAll">[상주] [고급/JAVA/3개월/을지로입구] SK 렌터카 EV링크 APP 개발(BO개발)</a> </p>
	        <a href="../project/projectAll" class="absolute left-5 right-20 top-5 bottom-5"></a>
		</div>
		<div class="ecard-100-white ">
			<span class="ebtn-heart">
                <!-- <div class="plike  jjim-no-login" data-pjt-key="VjQ0RTU3MQ==">
                    <i class="fa fa-heart-o"></i>
                </div> -->
            </span>
			<div class="ecard-lb-div">
	            <span class="ebtn-small ebtn-cf-pink">고급</span>
	            <span class="ebtn-small ebtn-cf-pink">C#</span>
	            <span class="ebtn-small ebtn-cf-pink">.NET</span>
	            <span class="ebtn-small ebtn-cf-pink">MVC</span> 
			</div>
	        <p class="mr-10">
	            <span class="ebtn-small ebtn-cf-dgray">개발자</span>
	            <span class="ebtn-small ebtn-cf-dgray">상주</span>
	            <span class="ebtn-small ebtn-cf-dgray">3개월</span>
			<span class="ebtn-small ebtn-cf-dgray">서울|마포구</span><span class="ebtn-small ebtn-cf-dgray">가격제안</span>
	        </p>
	        <p class="ecard-title"> <a href="./project?fm_str=cHJvamVjdGtleT1WNDRFNTcx">[상주] [고급/.Net/C#/3개월/상암동] CJ ENM 웹서비스 개발</a> </p>
	        <a href="./project?fm_str=cHJvamVjdGtleT1WNDRFNTcx" class="absolute left-5 right-20 top-5 bottom-5"></a>
		</div>
		<div class="ecard-100-white ">
			<span class="ebtn-heart">
				<div class="plike  jjim-no-login" data-pjt-key="TzcxUTg4Mw==">
                    <i class="fa fa-heart-o"></i>
                </div>
            </span>
			<div class="ecard-lb-div">
	            <span class="ebtn-small ebtn-cf-pink">중급</span>
	            <span class="ebtn-small ebtn-cf-pink">JAVA</span>
	            <span class="ebtn-small ebtn-cf-pink">Android</span>
	            <span class="ebtn-small ebtn-cf-pink">iOS</span>
	            <span class="ebtn-small ebtn-cf-pink">IONIC</span> 
			</div>
	        <p class="mr-10">
	            <span class="ebtn-small ebtn-cf-dgray">개발자</span>
	            <span class="ebtn-small ebtn-cf-dgray">재택</span>
	            <span class="ebtn-small ebtn-cf-dgray">13개월</span>
				<span class="ebtn-small ebtn-cf-dgray">재택</span>
				<span class="ebtn-small ebtn-cf-dgray">가격제안</span>
	        </p>
	        <p class="ecard-title"> <a href="./project?fm_str=cHJvamVjdGtleT1PNzFRODgz">[재택] [중급/IONIC/12.8개월/재택] 캐스팅 플랫폼(앱) 유지보수 및 신규기능개발 (06월)</a> </p>
	        <a href="./project?fm_str=cHJvamVjdGtleT1PNzFRODgz" class="absolute left-5 right-20 top-5 bottom-5"></a>
		</div>
		<div class="ecard-100-white ">
			<span class="ebtn-heart">
				<div class="plike  jjim-no-login" data-pjt-key="TzgzQzc2MQ==">
                    <i class="fa fa-heart-o"></i>
                </div>
            </span>
			<div class="ecard-lb-div">
	            <span class="ebtn-small ebtn-cf-pink">고급</span>
	            <span class="ebtn-small ebtn-cf-pink">SE</span> 
			</div>
    	    <p class="mr-10">
	            <span class="ebtn-small ebtn-cf-dgray">개발자</span>
	            <span class="ebtn-small ebtn-cf-dgray">상주</span>
	            <span class="ebtn-small ebtn-cf-dgray">7개월</span>
				<span class="ebtn-small ebtn-cf-dgray">경기|성남시 중원구</span>
				<span class="ebtn-small ebtn-cf-dgray">가격제안</span>
 	       </p>
     	   <p class="ecard-title"> <a href="./project?fm_str=cHJvamVjdGtleT1PODNDNzYx">[상주] [고급/SE/7개월/성남] 영원무역 내부시스템 인프라 운영</a> </p>
     	   <a href="./project?fm_str=cHJvamVjdGtleT1PODNDNzYx" class="absolute left-5 right-20 top-5 bottom-5"></a>
		</div>
		<div class="ecard-100-white ">
			<span class="ebtn-heart">
                <div class="plike  jjim-no-login" data-pjt-key="WjU4SDIyMA==">
                    <i class="fa fa-heart-o"></i>
                </div>
            </span>
			<div class="ecard-lb-div">
	            <span class="ebtn-small ebtn-cf-pink">중급</span>
	            <span class="ebtn-small ebtn-cf-pink">Java</span>
	            <span class="ebtn-small ebtn-cf-pink">Vue.js</span>
	            <span class="ebtn-small ebtn-cf-pink">SpringBoot</span>
	            <span class="ebtn-small ebtn-cf-pink">Oracle</span> 
			</div>
	        <p class="mr-10">
	            <span class="ebtn-small ebtn-cf-dgray">개발자</span>
	            <span class="ebtn-small ebtn-cf-dgray">상주</span>
	            <span class="ebtn-small ebtn-cf-dgray">7개월</span>
				<span class="ebtn-small ebtn-cf-dgray">경기도|이천</span>
				<span class="ebtn-small ebtn-cf-dgray">가격제안</span>
	        </p>
			<p class="ecard-title"> <a href="./project?fm_str=cHJvamVjdGtleT1aNThIMjIw">[상주] [중급/Java(Vue.js)/7개월/이천] SK하이닉스 교육시스템 기능 추가개발 및 유지보수</a> </p>
			<a href="./project?fm_str=cHJvamVjdGtleT1aNThIMjIw" class="absolute left-5 right-20 top-5 bottom-5"></a>
		</div>
		<div class="ecard-100-white ">
			<span class="ebtn-heart">
                <div class="plike  jjim-no-login" data-pjt-key="TjgwRzQ1Ng==">
                    <i class="fa fa-heart-o"></i>
                </div>
            </span>
			<div class="ecard-lb-div">
	            <span class="ebtn-small ebtn-cf-pink">초급</span>
	            <span class="ebtn-small ebtn-cf-pink">Vue.js</span>
	            <span class="ebtn-small ebtn-cf-pink">Java</span>
	            <span class="ebtn-small ebtn-cf-pink">SpringBoot</span> 
			</div>
			<p class="mr-10">
	            <span class="ebtn-small ebtn-cf-dgray">개발자</span>
	            <span class="ebtn-small ebtn-cf-dgray">상주</span>
	            <span class="ebtn-small ebtn-cf-dgray">3개월</span>
				<span class="ebtn-small ebtn-cf-dgray">서울|서대문구</span>
				<span class="ebtn-small ebtn-cf-dgray">금액 협의가능</span>
			</p>
			<p class="ecard-title"> <a href="./project?fm_str=cHJvamVjdGtleT1OODBHNDU2">[상주] [초급/Vue.js/2~3개월/충정로역/2명]ㅇㅇ 부동산 통합 플랫폼 구축 </a> </p>
			<a href="./project?fm_str=cHJvamVjdGtleT1OODBHNDU2" class="absolute left-5 right-20 top-5 bottom-5"></a>
		</div>
		<div class="ecard-100-white ">
	        <span class="ebtn-heart">
                <div class="plike  jjim-no-login" data-pjt-key="UjcxVTU4NA==">
                    <i class="fa fa-heart-o"></i>
                </div>
            </span>
			<div class="ecard-lb-div">
	            <span class="ebtn-small ebtn-cf-pink">초급</span>
	            <span class="ebtn-small ebtn-cf-pink">Javascript</span>  <span class="ebtn-small ebtn-cf-pink">React</span> 
			</div>
			<p class="mr-10">
	            <span class="ebtn-small ebtn-cf-dgray">개발자</span>
	            <span class="ebtn-small ebtn-cf-dgray">상주</span>
	            <span class="ebtn-small ebtn-cf-dgray">3개월</span>
				<span class="ebtn-small ebtn-cf-dgray">서울|중구</span>
				<span class="ebtn-small ebtn-cf-dgray">금액 비공개</span>
			</p>
			<p class="ecard-title"> <a href="./project?fm_str=cHJvamVjdGtleT1SNzFVNTg0">[상주] [초급/React/3개월/을지로] SKT 사이트 프론트 개발(7/3~)</a> </p>
			<a href="./project?fm_str=cHJvamVjdGtleT1SNzFVNTg0" class="absolute left-5 right-20 top-5 bottom-5"></a>
		</div>
	</div>

	
	<!-- 
	<div class="project-all">
		<div class="project-all__head">
			<h3 class="project-all__title">전체 프로젝트</h3>
				<div class="sort sort--right">
				<button type="button" class="sort__button">골라 보기<i aria-hidden="true" class="icon icon--filter"></i></button>
				</div>
				<div class="project-tag">
					<div class="project-tag__wrapper">
						<button type="button" class="badge-tag">전체</button>
						<button type="button" class="badge-tag">#챌린지</button>
						<button type="button" class="badge-tag">#동네</button>
						<button type="button" class="badge-tag">#기록</button>
						<button type="button" class="badge-tag">#Flutter</button>
						<button type="button" class="badge-tag">#React Native</button>
						<button type="button" class="badge-tag">#Typescript</button>
					</div>
				</div>
		</div>
		<div class="project-all__content">
			<div class="q-infinite-scroll">
			<ul class="project-all__list">
				<li class="list__item">
					<a href="javascript:void(0)" class="list__link">
						<div class="project-card">
						
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230504113217/Weekmotion_%EC%8D%B8%EB%84%A4%EC%9D%BC.png" alt="" class="project-card__image">
							<strong class="project-card__name">Weekmotion</strong>
							<p class="project-card__desc">감정을 일기로 기록하고 관리하는 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230504113217/230530_%ED%8F%AC%ED%85%90%EB%8D%B0%EC%9D%B4_%EB%89%B4%EB%8F%85_%EC%8D%B8%EB%84%A4%EC%9D%BC-480X480.jpg" alt="" class="project-card__image">
							<strong class="project-card__name">뉴독</strong>
							<p class="project-card__desc">뉴스레터 큐레이션 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230216113419/%EC%98%A4%EB%8A%98%EC%9D%98%ED%8E%B8%EC%A7%80_thum.png" alt="" class="project-card__image">
							<strong class="project-card__name">오늘의 편지</strong>
							<p class="project-card__desc">좋은 글귀와 그림을 주변에 함께 공유하고 싶어하는 시니어들을 위한 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230216113419/%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg" alt="" class="project-card__image">
							<strong class="project-card__name">친구:Be</strong>
							<p class="project-card__desc">슬기로운 인맥관리를 위한 경조사비 산출 솔루션 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230216113419/%EA%B5%AC%ED%95%B4%EC%A1%B0%ED%8C%80%EC%A6%88_%EB%AA%A8%EB%8B%A5%EB%AA%A8%EB%8B%A5_%EC%8D%B8%EB%84%A4%EC%9D%BC.png" alt="" class="project-card__image">
							<strong class="project-card__name">모닥모닥</strong>
							<p class="project-card__desc">캐주얼한 팀 온도체크 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230216113419/CaKku-beside_thumbnail.jpg" alt="" class="project-card__image">
							<strong class="project-card__name">카꾸</strong>
							<p class="project-card__desc">취향에 따라 카드를 구성하고 공유할 수 있는 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230216113419/cuokkamap_thumbnail.png" alt="" class="project-card__image">
							<strong class="project-card__name">커카맵</strong>
							<p class="project-card__desc">대체유 옵션을 제공하는 카페 지도 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230216113419/habiters_thumnail.jpg" alt="" class="project-card__image">
							<strong class="project-card__name">HABITERS</strong>
							<p class="project-card__desc">해빗트래커 기반 습관 성형 커뮤니티</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D230216113419/thumb.png" alt="" class="project-card__image">
							<strong class="project-card__name">포즈를 부탁해</strong>
							<p class="project-card__desc">즉석사진 포즈 추천 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%EC%95%8C%EB%A3%A8%EB%AF%B8%EB%8A%84_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">ACOE (A Cup of Earth)</strong>
							<p class="project-card__desc">텀블러 할인 지도 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%ED%95%98%EC%9A%B0%EC%8A%A4_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">쓰리픽</strong>
							<p class="project-card__desc">시간을 돈으로 환산해 보여주는 목표 관리 서비스 </p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/IMG_4339.PNG.png" alt="" class="project-card__image">
							<strong class="project-card__name">누구올림</strong>
							<p class="project-card__desc">대학생을 위한 메시지 큐레이션 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%EC%97%B4%EC%94%A8%EB%AF%B8_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">Roumo</strong>
							<p class="project-card__desc">나만의 루틴 관리를 도와주는 금융 습관 형성 앱</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%EA%B7%B8%EB%A3%A8%EB%B9%99480.png" alt="" class="project-card__image">
							<strong class="project-card__name">그루빙</strong>
							<p class="project-card__desc">친구들과 함께 채워나가는 TO-DO 빙고</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/MINE_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">MINE</strong>
							<p class="project-card__desc">자기 계발 콘텐츠 아카이빙 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/MOIM_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">MOIM</strong>
							<p class="project-card__desc">약속 일자, 추천 장소 셀렉 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/OoO_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">B.Nook</strong>
							<p class="project-card__desc">취향을 발견하고 경험을 공유하는 서점 큐레이션 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%ED%8F%AC%ED%8F%AC_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">포포</strong>
							<p class="project-card__desc">10대를 위한 투표 형식의 SNS 플랫폼</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%EB%A0%88%EB%94%94%EC%85%8B%EA%B3%A0_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">Goming (고밍)</strong>
							<p class="project-card__desc">내 삶을 회고하는 글쓰기 습관, 리추얼을 형성해주는 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%EC%A7%88%EC%B2%99%EC%9D%B4_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">질척이</strong>
							<p class="project-card__desc">생산적인 하루를 위한 목표 관리 앱</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D221015105156/%ED%8D%BC%EC%8A%A4%ED%8A%B8%20%ED%81%B4%EB%9E%98%EC%8A%A4_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">빌림</strong>
							<p class="project-card__desc">우리 동네 물건 대여 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D220813120226/%ED%82%A4%EB%AF%B8_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">키미</strong>
							<p class="project-card__desc">OKR을 쉽게 만들고 관리할 수 있는 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D220813120226/moyora%20.png" alt="" class="project-card__image">
							<strong class="project-card__name">모여라</strong>
							<p class="project-card__desc">우리 학교 동창 친구들의 근황을 확인하고, 추억을 나눌 수 있는 ’온라인 동창회’ 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D220813120226/%EC%86%8C%EA%B7%BC%EC%86%8C%EA%B7%BC_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">소근소근</strong>
							<p class="project-card__desc">콘텐츠 기록&amp;공유 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D220813120226/%EC%88%A0%EB%A0%81%EC%88%A0%EB%A0%81_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">술렁술렁</strong>
							<p class="project-card__desc">음주생활과 감정을 기록하는 술 일기 서비스</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D220813120226/%EB%A9%94%EC%9D%B8%EC%9D%B4%EB%AF%B8%EC%A7%80%28%EC%8D%B8%EB%84%A4%EC%9D%BC%29.png" alt="" class="project-card__image">
							<strong class="project-card__name">하루냥</strong>
							<p class="project-card__desc">하루를 위로해주는 모바일 속 작은 내 친구</p>
						</div>
					</a>
				</li>
				<li class="list__item">
					<a href="../project/projectAll" class="list__link">
						<div class="project-card">
							<img width="180" src="https://bsidebest.s3.ap-northeast-2.amazonaws.com/D220813120226/%EB%A1%A4%EB%B9%97_480.png" alt="" class="project-card__image">
							<strong class="project-card__name">롤빗</strong>
							<p class="project-card__desc">롤모델 습관 따라하기 서비스</p>
						</div>
					</a>
				</li>
			</ul>
			</div>
		</div>
	</div>
	-->
	<c:import url="../default/footer.jsp"/>
</body>
</html>