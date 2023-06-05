<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
	margin: 0;
}
/* #modal_wrap{
	position: fixed;
	z-index: 9;
	margin: 0 auto;
	top: 0; left: 0; right: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
}
#first{
	position: fixed;
	z-index: 10;
	margin: 0 auto;
	top: 30px; left: 0; right: 0;
	width: 300px;
	height: 350px;
	background: rgba(210, 240, 250, 0.9);
} */

#id{
	margin-right: auto;
	margin-left: auto;
	background-color: blue;
	border: 1px solid black;
	width: 800px;
	height: 100px;
	text-align: center;
	padding: 50px 0 50px 0;
	font-size: 50px;
	color: white;
}
table {
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
			
			<!-- <input type="hidden" id="writeNo" name="writeNo"> -->
			<p id="id">"${info.id }"</p>
			<table>
				<tr>
					<td><b>소개 : </b>"${info.introduce }"</td>
				</tr>
				<tr>	
					<td><b>가능한 기술 : </b>"${info.skill }"</td>
				</tr>
			</table>
			<br>
			<strong>kakao 지도 시작하기</strong>
			<div id="map" style="width:500px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eae4143fc932ba5e777b9fb5cd5fd48&libraries=services"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(33.450701, 126.570667),
					level: 3
				};
		
				var map = new kakao.maps.Map(container, options);
				var positions = [
				    {
				        content: '<div>카카오</div>', 
				        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
				    },
				    {
				        content: '<div>생태연못</div>', 
				        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
				    },
				    {
				        content: '<div>텃밭</div>', 
				        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
				    },
				    {
				        content: '<div>근린공원</div>',
				        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
				    }
				];

				for (var i = 0; i < positions.length; i ++) {
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng // 마커의 위치
				    });

				    // 마커에 표시할 인포윈도우를 생성합니다 
				    var infowindow = new kakao.maps.InfoWindow({
				        content: positions[i].content // 인포윈도우에 표시할 내용
				    });

				    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
				    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}

				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
				function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				}

				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}
			</script>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>