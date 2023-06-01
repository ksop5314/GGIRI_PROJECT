<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
				<th>작성자 </th><td><input type="text" name="id" id="id" value="${loginUser }" readonly></td>
			</tr>
			<tr>
				<th>자기소개 : </th><td><input type="text" name="introduce" id="introduce" placeholder="한줄로 자기소개 해주세요!" maxlength="20"></td>
			</tr>
			
			<tr>
				<th>프로젝트 수행이력</th>
			</tr>
			<tr>
				<th>프로젝트명 : </th><td><input type="text" name="project_name" id="project_name" placeholder="프로젝트명을 입력하세요" width="20" height="20"></td>
			</tr>
			<tr>
				<th>기간 : </th><td><input type="text" name="project_period" id="project_period" placeholder="200101" width="20" height="20">~<input type="text" name="project_period" id="project_period" placeholder="200101" width="20" height="20"></td>
			</tr>
			<tr>
				<th>고객사 : </th><td><input type="text" name="project_cliente" id="project_cliente" placeholder="고객사" width="20" height="20"><input type="text" name="project_cliente" id="project_cliente" placeholder="근무사를 입력하세요" width="20" height="20"></td>
			</tr>
			<tr>
				<th>프로젝트 상세설명 : </th><td><textarea name="project_ex" id="project_ex" placeholder="프로젝트 상세설명을 상사하게 적어주시면 감사합니다" ></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록하기" ></td>
			</tr>
		</table>
		
	</form>
	<c:import url="../default/footer.jsp"/>
</body>
</html>