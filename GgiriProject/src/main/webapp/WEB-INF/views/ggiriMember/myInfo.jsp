<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
<style type="text/css">
table {
	width: 1000px;
	margin: 0 auto;
	font-family: 'IBM Plex Sans KR', sans-serif;
}
table th {
	text-align: center;
}
table th,td {
	border-bottom: 2px solid gray;
	padding: 20px 0 20px 0;
}

table td {
	padding: 5px 0 7px 8px;
	text-align: center;
	width: 700px;
}
.wrap {
	width: 1200px;
	margin: auto;
}
input[type=button] {
	background-color: #B2CCFF;
    color: black;
    border: none;
    width: 145px;
    height: 50px;
    font-size: 18px;     
    border-radius: 9999px;
    font-family: 'IBM Plex Sans KR', sans-serif;
    cursor: pointer;
}
input[type=button]:hover {
    background-color: #EBF7FF;
    transition: 0.5s;
}
.but {
    display: flex;
    justify-content: center;
}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<h1>내 정보 ✌︎ </h1>
		<table>
				<c:if test="${naverMember != null }">
					<tr>
						<th> 이름 </th>
						<td>
							${naverMember.name }
						</td>
					</tr>
					<tr>
						<th> 아이디 </th>
						<td>
							${naverMember.id }
						</td>
					</tr>
					<tr>
						<th> 생년월일 </th>
						<td>
							${naverMember.birth }
						</td>
					</tr>
					<tr>
						<th> 성별 </th>
						<td>
							${naverMember.gender }
						</td>
					</tr>
					<tr>
						<th> E-mail </th>
						<td>
							${naverMember.email }
						</td>
					</tr>
					<tr>
						<th> Tel </th>
						<td>
							${naverMember.tel }
						</td>
					</tr>
					<tr>
						<th> 주소 </th>
						<td>
							${naverMember.addr }
						</td>
					</tr>
				</c:if>
				<c:if test="${ggiriSnsInfo != null }">
					<tr>
						<th> 이름 </th>
						<td>
							${ggiriSnsInfo.name }
						</td>
					</tr>
					<tr>
						<th> 아이디 </th>
						<td>
							${ggiriSnsInfo.id }
						</td>
					</tr>
					<tr>
						<th> 생년월일 </th>
						<td>
							<c:if test="${ggiriSnsInfo.pwd == null }">
								** sns 로그인 사용자 입니다 ** 수정이 필요하시면 내정보 수정을 해주세요.
							</c:if>
							${ggiriSnsInfo.pwd}
						</td>
					</tr>
					<tr>
						<th> 성별 </th>
						<td>
							<c:if test="${ggiriSnsInfo.pwd == null }">
								** sns 로그인 사용자 입니다 ** 수정이 필요하시면 내정보 수정을 해주세요.
							</c:if>
							${ggiriSnsInfo.pwd}
						</td>
					</tr>
					<tr>
						<th> E-mail </th>
						<td>
							${ggiriSnsInfo.email }
						</td>
					</tr>
					<tr>
						<th> Tel </th>
						<td>
							<c:if test="${ggiriSnsInfo.pwd == null }">
								** sns 로그인 사용자 입니다 ** 수정이 필요하시면 내정보 수정을 해주세요.
							</c:if>
							${ggiriSnsInfo.pwd}
						</td>
					</tr>
					<tr>
						<th> 주소 </th>
						<td>
							<c:if test="${ggiriSnsInfo.pwd == null }">
								** sns 로그인 사용자 입니다 ** 수정이 필요하시면 내정보 수정을 해주세요.
							</c:if>
							${ggiriSnsInfo.pwd}
						</td>
					</tr>
				</c:if>
				<c:if test="${ggiriMemberInfo != null }">
					<tr>
						<th> 이름 </th>
						<td>
							${ggiriMemberInfo.name }
						</td>
					</tr>
					<tr>
						<th> 아이디 </th>
						<td>
							${ggiriMemberInfo.id }
						</td>
					</tr>
					<tr>
						<th> 생년월일 </th>
						<td>
							${ggiriMemberInfo.birth }
						</td>
					</tr>
					<tr>
						<th> 성별 </th>
						<td>
							${ggiriMemberInfo.gender }
						</td>
					</tr>
					<tr>
						<th> E-mail </th>
						<td>
							${ggiriMemberInfo.email }
						</td>
					</tr>
					<tr>
						<th> Tel </th>
						<td>
							${ggiriMemberInfo.tel }
						</td>
					</tr>
					<tr>
						<th> 주소 </th>
						<td>
							${ggiriMemberInfo.addr }
						</td>
					</tr>
				</c:if>
			</table><br>
			<div class="but">
				<input type="button" value="정보 수정" onclick="location.href='../ggiriMember/modifyMyInfo'">
			</div>
		</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>