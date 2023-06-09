<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myInfo</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
	<br>
		<h1 id="title">내정보</h1>
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
			<div style="border: 1px solid gray; border-radius: 20px; width: 130px; height: 30px; text-align: center; padding-top: 10px; background: orange;">
				<a href="/root/ggiriMember/modifyMyInfo" style="text-decoration: none; font-weight: bold; color: white;">내 정보 수정</a>
			</div>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>