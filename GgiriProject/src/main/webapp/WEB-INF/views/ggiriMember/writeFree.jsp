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
#map {
    width: 400px;
    height: 300px;
}
.map_wrap,
.map_wrap * {
  margin: 0;
  padding: 0;
  font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
  font-size: 12px;
}
.map_wrap a,
.map_wrap a:hover,
.map_wrap a:active {
  color: #000;
  text-decoration: none;
}
.map_wrap {
  position: relative;
  width: 80%;
  height: 200px;
}
#menu_wrap {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  width: 250px;
  margin: 10px 0 30px 10px;
  padding: 5px;
  overflow-y: auto;
  background: rgba(255, 255, 255, 0.7);
  z-index: 1;
  font-size: 12px;
  border-radius: 10px;
}
.bg_white {
  background: #fff;
}
#menu_wrap hr {
  display: block;
  height: 1px;
  border: 0;
  border-top: 2px solid #5f5f5f;
  margin: 3px 0;
}
#menu_wrap .option {
  text-align: center;
}
#menu_wrap .option p {
  margin: 10px 0;
}
#menu_wrap .option button {
  margin-left: 5px;
}
#placesList li {
  list-style: none;
}
#placesList .item {
  position: relative;
  border-bottom: 1px solid #888;
  overflow: hidden;
  cursor: pointer;
  min-height: 65px;
}
#placesList .item span {
  display: block;
  margin-top: 4px;
}
#placesList .item h5,
#placesList .item .info {
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
}
#placesList .item .info {
  padding: 10px 0 10px 55px;
}
#placesList .info .gray {
  color: #8a8a8a;
}
#placesList .info .jibun {
  padding-left: 26px;
  background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
    no-repeat;
}
#placesList .info .tel {
  color: #009900;
}
#placesList .item .markerbg {
  float: left;
  position: absolute;
  width: 36px;
  height: 37px;
  margin: 10px 0 0 10px;
  background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
    no-repeat;
}
#placesList .item .marker_1 {
  background-position: 0 -10px;
}
#placesList .item .marker_2 {
  background-position: 0 -56px;
}
#placesList .item .marker_3 {
  background-position: 0 -102px;
}
#placesList .item .marker_4 {
  background-position: 0 -148px;
}
#placesList .item .marker_5 {
  background-position: 0 -194px;
}
#placesList .item .marker_6 {
  background-position: 0 -240px;
}
#placesList .item .marker_7 {
  background-position: 0 -286px;
}
#placesList .item .marker_8 {
  background-position: 0 -332px;
}
#placesList .item .marker_9 {
  background-position: 0 -378px;
}
#placesList .item .marker_10 {
  background-position: 0 -423px;
}
#placesList .item .marker_11 {
  background-position: 0 -470px;
}
#placesList .item .marker_12 {
  background-position: 0 -516px;
}
#placesList .item .marker_13 {
  background-position: 0 -562px;
}
#placesList .item .marker_14 {
  background-position: 0 -608px;
}
#placesList .item .marker_15 {
  background-position: 0 -654px;
}
#pagination {
  margin: 10px auto;
  text-align: center;
}
#pagination a {
  display: inline-block;
  margin-right: 10px;
}
#pagination .on {
  font-weight: bold;
  cursor: default;
  color: #777;
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
				<th>근무 가능한 장소 : </th><td><div id="here"></div></td>
			</tr>
			</table>
			</form>
			
		<div class="map_wrap">
        <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    
	        <div id="menu_wrap" class="bg_white">
	            <div class="option">
	                <div>
	                    <form class="form">
	                        키워드 : <input type="text" value="" id="keyword" size="15"> 
	                        <button type="submit">검색하기</button> 
	                    </form>
	                </div>
	                
	            </div>
	            <hr>
	            <ul id="placesList"></ul>
	            <div id="pagination"></div>
	        </div>
 	    </div>
 	    
		<div id="map" style="width:300px;height:150px;"></div>
   
		<!-- kakao API -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6eae4143fc932ba5e777b9fb5cd5fd48&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			
			// 마커를 담을 배열입니다
			var markers = [];
			let presentPosition;
			 
			/////////////////지도의 중심을 현재 위치로 변경///////////////////////
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨 
			    }; 
			 
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon) // geolocation으로 얻어온 좌표
			        presentPosition=locPosition;
			 
			        map.setCenter(locPosition);   
			            
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 
			    
			    var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567)
			    alert('현재 위치를 찾을 수 없습니다!');
			}
			 
			////////////////////장소 검색/////////////////////////////
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();  
			 
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			 
			const searchForm = document.querySelector('.form');
			searchForm.addEventListener('submit', function(e){
			    e.preventDefault();
			    // 키워드로 장소를 검색합니다
			    searchPlaces();
			})
			 
			 
			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {
			    var keyword = document.getElementById('keyword').value;
			 
			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    }
			 
			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB); 
			}
			 
			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				
			    if (status === kakao.maps.services.Status.OK) {
			 
			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);
			        
			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);
			 
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			 
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
			 
			    } else if (status === kakao.maps.services.Status.ERROR) {
			 
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
			 
			    }
			}
			 
			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
			 	
			    var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    hereEl = document.getElementById('here'), // Added this line
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
			    
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);
			 
			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    for ( var i=0; i<places.length; i++ ) {
			 
			        const lon = places[i].x;
			        const lat = places[i].y;
			 
			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i), 
			            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
			 
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);
			 
			        // 마커와 검색결과 항목에 mouseover 했을때
			        // 해당 장소에 인포윈도우에 장소명을 표시합니다
			        // mouseout 했을 때는 인포윈도우를 닫습니다
			        (function(marker, title) {
			            kakao.maps.event.addListener(marker, 'mouseover', function() {
			                displayInfowindow(marker, title);
			            });
			 
			            kakao.maps.event.addListener(marker, 'mouseout', function() {
			                infowindow.close();
			            });
			 
			            itemEl.onmouseover =  function () {
			                displayInfowindow(marker, title);
			            };
			 
			            itemEl.onmouseout =  function () {
			                infowindow.close();
			            };
			        })(marker, places[i].place_name);
			 
			        (function(marker, title) {
						$("#here").empty();
			            let html = "";

			            
			            // 결과값을 미리 생성
			            searchDetailAddrFromCoords(presentPosition, function(result, status) {
			                if (status === kakao.maps.services.Status.OK) {
			                    let detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
			                    let addr = result[0].road_address.address_name;
			                   
			                }
			               
			            });
			            
			            kakao.maps.event.addListener(marker, 'click', function() {
			                searchDetailAddrFromCoords(presentPosition, function(result, status) {
			                    if (status === kakao.maps.services.Status.OK) {
			                        let detailAddr = !!result[0].road_address ? result[0].road_address.address_name : result[0].address.address_name;
			                        location.href = "https://map.kakao.com/?sName=" + detailAddr + "&eName=" + title;
			                        html += "<input type='text' value='" + title + '>";
					                // 결과값을 #here 요소에 추가
					                hereEl.innerHTML += html;
			                    }   
			                });
			            });
			        })(marker, places[i].place_name);
			        fragment.appendChild(itemEl);
			    }
			 
			    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;
			 
			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}
			 
			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {
			
			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h5>' + places.place_name + '</h5>';
			 
			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span>' +
			                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
			    } else {
			        itemStr += '    <span>' +  places.address_name  + '</span>'; 
			    }
			                 
			      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			                '</div>';           
			 
			    el.innerHTML = itemStr;
			    el.className = 'item';
			   
			    return el;
			}
			 
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });
			 
			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
			 
			    return marker;
			}
			 
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
			 
			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			        i; 
			 
			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild (paginationEl.lastChild);
			    }
			 
			    for (i=1; i<=pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;
			 
			        if (i===pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function(i) {
			                return function() {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }
			 
			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}
			 
			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
			    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
			 
			    infowindow.setContent(content);
			    infowindow.open(map, marker);
			}
			 
			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
			 
			// 좌표 -> 주소
			var geocoder = new kakao.maps.services.Geocoder();
			function searchDetailAddrFromCoords(coords, callback) {
			    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
			}
		  
		</script>
		
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>