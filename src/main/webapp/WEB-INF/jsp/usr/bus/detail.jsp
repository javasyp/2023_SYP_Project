<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="버스 시간표 상세" />
<%@ include file="../common/head.jspf"%>
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
}
</style>

<section class="notice">
  <div class="page-title">
        <div class="container">
			<h3>${bus.busRoute }</h3>
			${bus.departure1 } ~ ${bus.departure2 }
			
			${bus.dayType }
			${bus.company }
			${bus.interval }
			${bus.oneWay }
			
			${bus.serviceDate }
			
            
        </div>
    </div>
</section>

<section class="mt-8">
	<div class="flex justify-center">
		<div class="table-box-type-1">
			<table border="1">
				<colgroup>
					<col width="70" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
					<col width="50" />
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th colspan="2">1</th>
						<th colspan="2">2</th>
						<th colspan="2">3</th>
						<th colspan="2">4</th>
						<th colspan="2">5</th>
						<th colspan="2">6</th>
						<th colspan="2">7</th>
						<th colspan="2">8</th>
						<th colspan="2">9</th>
						<th colspan="2">10</th>
					</tr>
				</thead>
	
				<tbody>
					<c:forEach var="bustime" items="${bustime }">
						<tr style="width:100px;">
							<td>${bustime.line }</td>
							<td>${bustime.startingPoint1_1 }</td>
							<td>${bustime.startingPoint1_2 }</td>
							<td>${bustime.startingPoint2_1 }</td>
							<td>${bustime.startingPoint2_2 }</td>
							<td>${bustime.startingPoint3_1 }</td>
							<td>${bustime.startingPoint3_2 }</td>
							<td>${bustime.startingPoint4_1 }</td>
							<td>${bustime.startingPoint4_2 }</td>
							<td>${bustime.startingPoint5_1 }</td>
							<td>${bustime.startingPoint5_2 }</td>
							<td>${bustime.startingPoint6_1 }</td>
							<td>${bustime.startingPoint6_2 }</td>
							<td>${bustime.startingPoint7_1 }</td>
							<td>${bustime.startingPoint7_2 }</td>
							<td>${bustime.startingPoint8_1 }</td>
							<td>${bustime.startingPoint8_2 }</td>
							<td>${bustime.startingPoint9_1 }</td>
							<td>${bustime.startingPoint9_2 }</td>
							<td>${bustime.startingPoint10_1 }</td>
							<td>${bustime.startingPoint10_2 }</td>
						</tr>
					</c:forEach>
				</tbody>
	
			</table>
		</div>
	</div>
</section>


<!-- 실제 지도를 그리는 Javascript API 및 API KEY -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d23dfbb54da6b8556eb211bbec3d38fb"></script>

<!-- 지도 영역 -->
<div id="map" style="width:1000px; height:300px;"></div>

<script>
//버스 정류장 위치
const API_KEY = 'eiQD4XKpClaaaS5Yhfgc%2BDN6XT5FJz5u6v%2BLikgsmIMQU773QzDwXMwYPXdhxJEICgsIa9Xgem%2BZk3x64GR6wQ%3D%3D';

var Lalocation;
var Lolocation;

async function getData() {
	const url = 'http://192.168.0.51/api/rest/busposinfo/getBusPosByRtid?busRouteId=30300001&serviceKey='
			+ API_KEY;
	const response = await fetch(url);
	const data = await response.json();
	
	// TODO : 위도 경도 데이터 가져오기
	Lalocation = data.body[0].latitude;
	Lolocation = data.body[0].longitude;

	console.log("data", data);
}

var apiKey = 'eiQD4XKpClaaaS5Yhfgc%2BDN6XT5FJz5u6v%2BLikgsmIMQU773QzDwXMwYPXdhxJEICgsIa9Xgem%2BZk3x64GR6wQ%3D%3D';
var busRouteUrl = 'http://apis.data.go.kr/1613000/BusSttnInfoInqireService/getSttnNoList?serviceKey=eiQD4XKpClaaaS5Yhfgc%2BDN6XT5FJz5u6v%2BLikgsmIMQU773QzDwXMwYPXdhxJEICgsIa9Xgem%2BZk3x64GR6wQ%3D%3D'
		+ '&cityCode=25&nodeNm=전통시장&nodeNo=44810&numOfRows=10&pageNo=1&_type=xml';



// Ajax 요청을 통해 버스 노선 정보를 가져옵니다.
$.ajax({
  url: busRouteUrl,
  type: 'GET',
  data: {
    busRouteId: '노선_아이디' // 대전 버스 노선의 고유 식별자
  },
  dataType: 'xml',
  success: function(response) {
    // 응답 데이터를 파싱하여 필요한 정보를 추출하고, 해당 정보를 HTML 페이지에 표시합니다.
  },
  error: function(error) {
    console.log(error);
  }
});


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
		center: new kakao.maps.LatLng(36.3504119, 127.3845475), // 지도의 중심좌표 (대전시청)
		level: 3 // 지도의 확대 레벨 
	};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


//선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
var linePath = [
    new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
    new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
    new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
];

// 지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
    path: linePath, // 선을 구성하는 좌표배열 입니다
    strokeWeight: 5, // 선의 두께 입니다
    strokeColor: '#FFAE00', // 선의 색깔입니다
    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    strokeStyle: 'solid' // 선의 스타일입니다
});

// 지도에 선을 표시합니다 
polyline.setMap(map);  

</script>


<%@ include file="../common/foot.jspf"%>