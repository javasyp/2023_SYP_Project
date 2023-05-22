<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAP" />
<%@ include file="../common/head.jspf"%>

<!-- 실제 지도를 그리는 Javascript API 및 API KEY -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d23dfbb54da6b8556eb211bbec3d38fb"></script>

<!-- 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d23dfbb54da6b8556eb211bbec3d38fb&libraries=LIBRARY"></script>
	
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d23dfbb54da6b8556eb211bbec3d38fb&libraries=services"></script>

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d23dfbb54da6b8556eb211bbec3d38fb&libraries=services,clusterer,drawing"></script>

<section class="notice">
  <div class="page-title">
        <div class="container">
			<h3>지도</h3>
        </div>
    </div>
</section>

	<!-- 지도 영역 -->
	<div id="map" style="width:1000px; height:500px;"></div>

<script>
	
	// 카카오 지도
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
    		center: new kakao.maps.LatLng(36.3504119, 127.3845475), // 지도의 중심좌표 (대전시청)
    		level: 3 // 지도의 확대 레벨 
		};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 현재 위치
	function getLocation() {
	    return new Promise((resolve, reject) => {
	        if (navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(
	                function (position) {
	                    const lat = position.coords.latitude;
	                    const lon = position.coords.longitude;
	                    resolve({ lat, lon });
	                    
	                    var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			            message = '<div style="padding:5px;">현재 위치 위도:' + lat + '경도: ' + lon + '</div>'; // 인포윈도우에 표시될 내용입니다
			        
				        // 마커와 인포윈도우를 표시합니다
				        displayMarker(locPosition, message);
	                },
	                function (error) {
	                    reject(error);
	                }
	            );
	        } else {
	            reject("Geolocation is not supported by this browser.");
	        }
	    });
	}
	
	// 버스 정보 가져오기
	function getBuses(lat, lon) {
		var apiKey = 'eiQD4XKpClaaaS5Yhfgc%2BDN6XT5FJz5u6v%2BLikgsmIMQU773QzDwXMwYPXdhxJEICgsIa9Xgem%2BZk3x64GR6wQ%3D%3D';
		
		var url = 'http://apis.data.go.kr/1613000/BusSttnInfoInqireService/getCrdntPrxmtSttnList?serviceKey='
				+ apiKey + '&gpsLati=' + lat + '&gpsLong=' + lon;
		
		// Ajax 요청을 통해 버스 노선 정보를 가져옵니다.
		$.ajax({
		  url: url,
		  type: 'GET',
		  data: {
			  numOfRows: '20',
			  pageNo: '1',
			  _type: 'xml'
		  },
		  dataType: 'xml',
		  success: function(response) {
		    // 응답 데이터를 파싱하여 필요한 정보를 추출하고, 해당 정보를 HTML 페이지에 표시합니다.
		    // XML 응답 데이터를 파싱합니다.
	        const xmlDoc = response;
		    
	    	// 필요한 정보를 추출하여 HTML 요소를 동적으로 생성하고 화면에 추가합니다.
	        const items = xmlDoc.getElementsByTagName('item');
	        const containerElement = document.getElementById('xml-container'); // HTML에 해당하는 컨테이너 요소를 선택합니다.
	
	        for (let i = 0; i < items.length; i++) {
	            const item = items[i];
	            const cityCode = item.getElementsByTagName('citycode')[0].textContent;
	            const gpslati = item.getElementsByTagName('gpslati')[0].textContent;
	            const gpslong = item.getElementsByTagName('gpslong')[0].textContent;
	            const nodeid = item.getElementsByTagName('nodeid')[0].textContent;
	            const nodenm = item.getElementsByTagName('nodenm')[0].textContent;
	            const nodeno = item.getElementsByTagName('nodeno')[0].textContent;

	            // 필요한 정보를 가지고 HTML 요소를 동적으로 생성하고 화면에 추가합니다.
	            const itemElement = document.createElement('div');
	            itemElement.innerHTML = `
	                <p>City Code: ${cityCode}</p>
	                <p>GPS Latitude: ${gpslati}</p>
	                <p>GPS Longitude: ${gpslong}</p>
	                <p>Node ID: ${nodeid}</p>
	                <p>Node Name: ${nodenm}</p>
	                <p>Node No: ${nodeno}</p>
	                <hr>
	            `;
	            containerElement.appendChild(itemElement);
	        }
		  },
		  error: function(error) {
		    console.log(error);
		  }
		});
	}

	// 사용 예시
	getLocation()
	    .then((position) => {
	        const { lat, lon } = position;
	        console.log("위도:", lat, "경도:", lon);
		    // 위치 정보를 사용하여 API 호출
		    return getBuses(lat, lon);
	    })
	    .catch((error) => {
	        console.error("위치 정보를 가져오는 중 오류가 발생했습니다:", error);
	    });
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '카카오', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	    },
	    {
	        title: '생태연못', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        title: '텃밭', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        title: '근린공원',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	
	// 현재 위치 가져오기
	function getLocation1() {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        lat = position.coords.latitude; // 위도
		        lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">현재 위치 위도:' + lat + '경도: ' + lon + '</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(36.3504119, 127.3845475),    
		        message = '현재 위치를 알 수 없습니다.';
		        
		    displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
    	function displayMarker(locPosition, message) {

    	    // 마커를 생성합니다
    	    var marker = new kakao.maps.Marker({  
    	        map: map, 
    	        position: locPosition
    	    }); 
    	    
    	    var iwContent = message, // 인포윈도우에 표시할 내용
    	        iwRemoveable = true;

    	    // 인포윈도우를 생성합니다
    	    var infowindow = new kakao.maps.InfoWindow({
    	        content : iwContent,
    	        removable : iwRemoveable
    	    });
    	    
    	    // 인포윈도우를 마커위에 표시합니다 
    	    infowindow.open(map, marker);
    	    
    	    // 지도 중심좌표를 접속위치로 변경합니다
    	    map.setCenter(locPosition);      
    	}
		
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;

	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}
	
	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 교통 정보 표시 및 해제
	var trafficInform = false;
	const tiText = document.getElementById('tiText');
	
	$(document).on('click', '#result', function() {
	    if (tiText.innerText === '교통 정보 표시') {
	    	tiText.innerText = '교통 정보 해제';
	    } else tiText.innerText = '교통 정보 표시';
	    
	    if (trafficInform == false) {
	    	// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
			trafficInform = true;
	    } else {
	    	// 아래 코드는 위에서 추가한 교통정보 지도타입을 제거합니다
	    	map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
	    	trafficInform = false;
	    }
	});
	
	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng;
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('result');
	    resultDiv.innerHTML = message;
	    
	 	// 지도 중심을 이동 시킵니다
	    map.setCenter(latlng);
	    
	});
	
	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
	    var roadmapControl = document.getElementById('btnRoadmap');
	    var skyviewControl = document.getElementById('btnSkyview'); 
	    if (maptype === 'roadmap') {
	        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
	        roadmapControl.className = 'selected_btn';
	        skyviewControl.className = 'btn';
	    } else {
	        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
	        skyviewControl.className = 'selected_btn';
	        roadmapControl.className = 'btn';
	    }
	}

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	    map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	    map.setLevel(map.getLevel() + 1);
	}
	
	
</script>
	

	<button id="trafficInform()"><span id="tiText">교통 정보 표시</span></button>
	<p id="result"></p>
	<div id="xml-container"></div>
	
<%@ include file="../common/foot.jspf"%>