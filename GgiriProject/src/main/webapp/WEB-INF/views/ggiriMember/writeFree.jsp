<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script type="text/javascript">
function count_check(obj){
	var chkBox = document.getElementsByName("skill");
	var chkCnt = 0;
	for(var i = 0; i < chkBox.length ; i++){
		if(chkBox[i].checked){
			chkCnt++;
		}
	}
	if(chkCnt > 10){
		alert("보유 기술은 10개까지 선택할 수 있습니다.");
		obj.checked = false;
		return false;
	}
	
}


</script>
<style type="text/css">
*{
	margin: 0;
}
h1{
	text-align: center;
}
table{
	margin-left: auto;
	margin-right: auto;
}
table tr{
	margin-right: 5px;
}
table textarea{
	width: 100%;
	height: 6.25em;
	resize: none;
}

</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<h1>프리랜서 등록하기</h1>
	<form action="${contextPath }/ggiriMember/writeSave" method="post">
		<table >
			<tr>
				<c:if test="${loginUser != null}">
					<input type="hidden" name="name" id="name" value="${loginUser }">
				</c:if>
				<c:if test="${kakaoMember != null}">
					<input type="hidden" name="name" id="name" value="${kakaoMember.name }">
				</c:if>
				<c:if test="${naverMember != null}">
					<input type="hidden" name="name" id="name" value="${naverMember.name }">
				</c:if>
			</tr>
			<tr> 
				<c:if test="${loginUser != null}">
					<th>작성자 </th><td><input type="text" name="id" id="id" value="${loginUser }" readonly></td>
				</c:if>
				<c:if test="${kakaoMember != null}">
					<th>작성자 </th><td><input type="text" name="id" id="id" value="${kakaoMember.id }" readonly></td>
				</c:if>
				<c:if test="${naverMember != null}">
					<th>작성자 </th><td><input type="text" name="id" id="id" value="${naverMember.id}" readonly></td>
				</c:if>
			</tr>
			<tr>
				<th>자기소개 : </th><td><input type="text" name="introduce" id="introduce" placeholder="한줄로 자기소개 해주세요!" maxlength="20"></td>
			</tr>
			<tr>
				<th> 구인직종 </th>
				<td>
					<ul>
						<li>
							<label for="occupation_01"> 개발자 </label>
							<input type="radio" class="hidden" name="job" id="occupation_01" value="developer" checked>
							<label for="occupation_02"> 퍼블리셔 </label>
							<input type="radio" class="hidden" name="job" id="occupation_02" value="publisher">
							<label for="occupation_03"> 디자이너 </label>
							<input type="radio" class="hidden" name="job" id="occupation_03" value="designer">
							<label for="occupation_04"> 기획자 </label>
							<input type="radio" class="hidden" name="job" id="occupation_04" value="planner">
						</li>
					</ul>
				</td>
			</tr>
			<tr>
			<th> 활용가능<br>기술 </th>
				<td>
					<ul>
						<li>
							<label for="available_0">Front-End</label>
							<input type="checkbox" class="hidden" name="skill" id="available_0" value="frontEnd" onclick="count_check(this)">
							<label for="available_1">Back-End</label>
							<input type="checkbox" class="hidden" name="skill" id="available_1" value="backEnd" onclick="count_check(this)">
							<label for="available_2">Java</label>
							<input type="checkbox" class="hidden" name="skill" id="available_2" value="java" onclick="count_check(this)">
							<label for="available_3">Spring</label>
							<input type="checkbox" class="hidden" name="skill" id="available_3" value="spring" onclick="count_check(this)">
							<label for="available_4">Maven</label>
							<input type="checkbox" class="hidden" name="skill" id="available_4" value="maven" onclick="count_check(this)">
							<label for="available_5">Jenkins</label>
							<input type="checkbox" class="hidden" name="skill" id="available_5" value="jenkins" onclick="count_check(this)">
							<label for="available_6">WebView</label>
							<input type="checkbox" class="hidden" name="skill" id="available_6" value="webView" onclick="count_check(this)">
							<label for="available_7">node.js</label>
							<input type="checkbox" class="hidden" name="skill" id="available_7" value="node.js" onclick="count_check(this)">
							<label for="available_8">React.js</label>
							<input type="checkbox" class="hidden" name="skill" id="available_8" value="react.js" onclick="count_check(this)">
							<label for="available_9">react-native</label>
							<input type="checkbox" class="hidden" name="skill" id="available_9" value="react-native" onclick="count_check(this)">
							<label for="available_10">Vue.js</label>
							<input type="checkbox" class="hidden" name="skill" id="available_10" value="Vue.js" onclick="count_check(this)"><br>
							<label for="available_11">JavaScript</label>
							<input type="checkbox" class="hidden" name="skill" id="available_11" value="javaScript" onclick="count_check(this)">
							<label for="available_12">Oracle</label>
							<input type="checkbox" class="hidden" name="skill" id="available_12" value="oracle" onclick="count_check(this)">
							<label for="available_13">MSSQL</label>
							<input type="checkbox" class="hidden" name="skill" id="available_13" value="msSql" onclick="count_check(this)">
							<label for="available_14">MySQL</label>
							<input type="checkbox" class="hidden" name="skill" id="available_14" value="mySql" onclick="count_check(this)">
							<label for="available_15">MariaDB</label>
							<input type="checkbox" class="hidden" name="skill" id="available_15" value="mariaDB" onclick="count_check(this)"><br>
							<label for="available_16">MongoDB</label>
							<input type="checkbox" class="hidden" name="skill" id="available_16" value="mongoDB" onclick="count_check(this)">
							<label for="available_17">Android</label>
							<input type="checkbox" class="hidden" name="skill" id="available_17" value="android" onclick="count_check(this)">
							<label for="available_18">loT</label>
							<input type="checkbox" class="hidden" name="skill" id="available_18" value="lot" onclick="count_check(this)">
							<label for="available_19">PHP</label>
							<input type="checkbox" class="hidden" name="skill" id="available_19" value="php" onclick="count_check(this)">
							<label for="available_20">jQuery</label>
							<input type="checkbox" class="hidden" name="skill" id="available_20" value="jquery" onclick="count_check(this)">
							<label for="available_21">Aduino</label>
							<input type="checkbox" class="hidden" name="skill" id="available_21" value="aduino" onclick="count_check(this)"><br>
							<label for="available_22">Hybrid</label>
							<input type="checkbox" class="hidden" name="skill" id="available_22" value="hybrid" onclick="count_check(this)">
							<label for="available_23">UNIX</label>
							<input type="checkbox" class="hidden" name="skill" id="available_23" value="unix" onclick="count_check(this)">
							<label for="available_24">C#</label>
							<input type="checkbox" class="hidden" name="skill" id="available_24" value="c#" onclick="count_check(this)">
							<label for="available_25">C</label>
							<input type="checkbox" class="hidden" name="skill" id="available_25" value="c" onclick="count_check(this)">
							<label for="available_26">C++</label>
							<input type="checkbox" class="hidden" name="skill" id="available_26" value="c++" onclick="count_check(this)">
							<label for="available_27">Qt</label>
							<input type="checkbox" class="hidden" name="skill" id="available_27" value="qt" onclick="count_check(this)">
							<label for="available_28">Server</label>
							<input type="checkbox" class="hidden" name="skill" id="available_28" value="server" onclick="count_check(this)"><br>
							<label for="available_29">Miplatform</label>
							<input type="checkbox" class="hidden" name="skill" id="available_29" value="miplatform" onclick="count_check(this)">
							<label for="available_30">Thymeleaf</label>
							<input type="checkbox" class="hidden" name="skill" id="available_30" value="thymeleaf" onclick="count_check(this)">
							<label for="available_31">flutter</label>
							<input type="checkbox" class="hidden" name="skill" id="available_31" value="flutter" onclick="count_check(this)">
							<label for="available_32">ios</label>
							<input type="checkbox" class="hidden" name="skill" id="available_32" value="ios" onclick="count_check(this)">
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th>근무 가능기간 : </th><td><input type="text" name="project_period" id="project_period" placeholder="200101" width="20" height="20"></td>
			</tr>
			<tr>
				<th>선호하는 근무장소 : </th><td><input type="text" name="place_of_work" id="place_of_work" placeholder="도시입력 예)서울:인천:대전"></td>
			</tr>
			<tr>
				<th>소개할 url : </th><td><input type="text" name="url_name" id="url_name" placeholder="소개할 url을 입력해주세요"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록하기" ></td>
			</tr>
			</table>
			
			</form >
			
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>