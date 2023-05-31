<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

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
	<form action="../ggiriMember/writeSave">
		<table >
			<tr>
				<th>자기소개 : </th><td><input type="text" placeholder="한줄로 자기소개 해주세요!" maxlength="20"></td>
			</tr>
			
			<tr>
				<th>프로젝트 수행이력</th>
			</tr>
			<tr>
				<th>프로젝트명 : </th><td><input type="text" placeholder="프로젝트명을 입력하세요" width="20" height="20"></td>
			</tr>
			<tr>
				<th>기간 : </th><td><input type="text" placeholder="200101" width="20" height="20">~<input type="text" placeholder="200101" width="20" height="20"></td>
			</tr>
			<tr>
				<th>고객사 : </th><td><input type="text" placeholder="고객사" width="20" height="20"><input type="text" placeholder="근무사를 입력하세요" width="20" height="20"></td>
			</tr>
			<tr>
				<th>프로젝트 상세설명 : </th><td><textarea  placeholder="프로젝트 상세설명을 상사하게 적어주시면 감사합니다" ></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록하기"></td>
			</tr>
		</table>
		
	</form>
	<c:import url="../default/footer.jsp"/>
</body>
</html>