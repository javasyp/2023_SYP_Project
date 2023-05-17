
// 지도를 표시할 div
var mapContainer = document.getElementById('map');
		
var mapOptions = {
	center: new kakao.maps.LatLng(33.450701, 126.570667),	// 지도의 중심 좌표
	level: 2	// 지도의 확대 레벨
};

// 지도 생성
var map = new kakao.maps.Map(mapContainer, mapOptions);

// 마커 생성
var marker = new kakao.maps.Marker({
    position: mapOptions.center
});

// 마커가 지도 위에 표시되도록 설정
marker.setMap(map);

// 인포윈도우에 표출될 내용 (HTML 문자열이나 document element가 가능)
var iwContent = '<div style="padding:5px;">현재 위치</div>';

// 인포윈도우 생성
var infoWindow = new kakao.maps.InfoWindow({
    position : mapOptions.center,
    content : iwContent
});
  
// 마커 위에 인포윈도우를 표시 (두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시)
infoWindow.open(map, marker);

// HTML5의 geolocation으로 사용할 수 있는지 확인
if (navigator.geolocation) {
	// GeoLocation을 이용하여 현재 위치 얻기
	navigator.geolocation.getCurrentPosition(function(position) {
		var lat = position.coords.latitude;		// 위도
		var lng = position.coords.longitude;	// 경도
		// 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
		var locPosition = new kakao.maps.LatLng(lat, lng);
		
		iwContent = '<div style="padding:5px;">현재 위치</div>';
		
		// 마커 위치 설정
		marker.setPosition(locPosition);
		// 인포윈도우 위치 설정
		infoWindow.setPosition(locPosition);
		// 지도 중심 좌표를 현재 위치로 변경
		map.setCenter(locPosition);
	});
} else {
	var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567);
	map.setCenter(locPosition);
}