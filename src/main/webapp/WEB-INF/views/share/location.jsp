<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<%@include file="../common/navheader.jsp"%>
		<div class="row">
			<div class="col-sm-2" >
				<%@include file="../common/navleft.jsp" %>
			</div>
			<div class="col-sm-10">
				<div class="row">
					<div class="page-header">
						<h1>학교 위치</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div id="map" style="height:600px;"></div>
					</div>
					<div class="com-sm-6">
						<div class="row">
							<h1>중앙 HTA</h1>
							<p class="h3">&nbsp주소&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 서울특별시 종로구 율곡로10길 105</p>
							<p class="h3">&nbsp전화&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 070-8240-3211</p>
						</div>
						
					</div>
				</div>
			</div>
					
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf9a1c5f19ed1880b95f9ec92125fac4&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 1 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('서울 종로구 율곡로10길 105 디아망 4층 401호', function(result, status) {
	// 교통정보 추가
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">중앙 HTA</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
</script>
</html>