<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>airport weather search</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- fontawesome 아이콘 -->
<script src="https://kit.fontawesome.com/ed304f677f.js" crossorigin="anonymous"></script>
		<!-- 페이지 호출시 처음 호출되는 API -->
<script type="text/javascript">
$(function() {
	  
	$.ajax({
		// API에 서울의 날씨정보 요청 + APP인증키 
		url: 'http://api.openweathermap.org/data/2.5/weather?q=' + 'seoul' + '&appid=e076b9e39e183952d0c027c9d001e115&units=metric'
				,
		dataType: "json",	// json 타입으로 정보를 가져옴.
		type: "GET",		// GET : 정보를 받는것.
		async: "false",		// 비동기식 --> 동기식 전환 ajax 기능
		success: function(resp) {
			
			console.log(resp);
			console.log("현재온도 : "+ (resp.main.temp) );
            console.log("현재습도 : "+ resp.main.humidity);
            console.log("날씨 : "+ resp.weather[0].main );
            console.log("상세날씨설명 : "+ resp.weather[0].description );
            console.log("날씨 이미지 : "+ resp.weather[0].icon);
            console.log("바람   : "+ resp.wind.speed );
            console.log("나라   : "+ resp.sys.country );
            console.log("도시이름  : "+ resp.name );
            console.log("구름  : "+ (resp.clouds.all) + "%" );   
           // alert(resp.main.temp);
    
			// 결과 html 전송
			// API에서 지원하는 아이콘을 변수에저장.
            var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
			
			//body 부분에 출력할 내용 
 			$("#icon").attr("src", imgURL); //이미지(변수에 저장한 값.)
 			$('#name').html(resp.name +'  ' + resp.sys.country); //도시 + 국가
 			$('#temp').html(resp.main.temp + '°C'); // 온도
 			$('#detail').html(resp.weather[0].description); // 상세설명
 			$('#wet').html(resp.main.humidity + "%"); // 습도
 			$('#cloud').html((resp.clouds.all) + "%"); // 구름
 			$('#wind').html((resp.wind.speed) + "m/s"); // 바람
 				// 도시검색명 --> Google map 위도경도 입력. 
 				$.ajax({
 					url: 'https://maps.googleapis.com/maps/api/geocode/json?address='+ 'seoul' + '&key=AIzaSyBd2psTOAmADCNJdNwoOY5n9I7-168Ywac',
 					datatype: "json",
 					async: "false",
 					success: function(data) {
						/* map_lat = data.results[0]['geometry']['location']['lat'];
						map_lng = data.results[0]['geometry']['location']['lng']; */
 						//alert(map_lat +', '+ map_lng);
						var lat1 = 37.551431315874694;
						var lng1 = 126.98855902545402;
 						$('#lat').val(lat);
 						$('#lng').val(lng);
 						initMap(lat1, lng1);
					}
 				})//ajax
		}//success
	}) //ajax
})//func

</script>
		<!-- 검색시 호출되는 API -->
<script type="text/javascript">
  $(function() {
	  
	$('#bt1').click(function() {
		var city = $('#t1').val();
		$.ajax({
			url: 'http://api.openweathermap.org/data/2.5/weather?q=' + city + '&appid=e076b9e39e183952d0c027c9d001e115&units=metric'
					,
			dataType: "json",
			type: "GET",
			async: "false",
			success: function(resp) {
				console.log(resp);
				console.log("현재온도 : "+ (resp.main.temp) );
                console.log("현재습도 : "+ resp.main.humidity);
                console.log("날씨 : "+ resp.weather[0].main );
                console.log("상세날씨설명 : "+ resp.weather[0].description );
                console.log("날씨 이미지 : "+ resp.weather[0].icon);
                console.log("바람   : "+ resp.wind.speed );
                console.log("나라   : "+ resp.sys.country );
                console.log("도시이름  : "+ resp.name );
                console.log("구름  : "+ (resp.clouds.all) + "%" );   
               // alert(resp.main.temp);
	
                var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
	 			$("#icon").attr("src", imgURL); //이미지
	 			$('#name').html(resp.name +'  ' + resp.sys.country); //도시 + 국가
	 			$('#temp').html(resp.main.temp + '°C'); // 온도
	 			$('#detail').html(resp.weather[0].description); // 상세설명
	 			$('#wet').html(resp.main.humidity + "%" ); // 습도
	 			$('#cloud').html((resp.clouds.all) + "%"); // 구름
	 			$('#wind').html((resp.wind.speed) + "m/s"); // 바람
	 			
	 			// Google Map Geocode 호출 ajax
	 			$.ajax({
 					url: 'https://maps.googleapis.com/maps/api/geocode/json?address='+ city + '&key=AIzaSyBd2psTOAmADCNJdNwoOY5n9I7-168Ywac',
 					datatype: "json",
 					success: function(data) {
 						// Google Map Geocode 호출 : 검색한 도시명의 위도, 경도를 각변수에 저장.
						lat1 = data.results[0]['geometry']['location']['lat'];
						lng1 = data.results[0]['geometry']['location']['lng'];
 						// 구글맵 Java Script function 에 위도, 경도 입력
						initMap(lat1, lng1);	
					}
 				})//ajax
			}
		}) //ajax
	}) //click
})//func
</script>
		<!-- AJAX 구버전 -->
<script type="text/javascript">
	/*  $(function() {
	$('#bt1').click(function() {
		
		var tt = $('#t1').val();
		
		const getJSON = function(url, callback) {
		
		const xhr = new XMLHttpRequest();
		xhr.open('get', url, true);
		xhr.responseType = 'json';
		xhr.onload = function() {
			const status = xhr.status;
			if (status == 200) {
				callback(null, xhr.response);
			}else{
				callback(status, xhr.response);
			}
		};
		xhr.send();
	};
	
	getJSON('http://api.openweathermap.org/data/2.5/weather?q=' + tt + '&appid=e076b9e39e183952d0c027c9d001e115&units=metric',
			function(err, data) {
				if (err != null) {
					alert('오류발생');
				}else{
					alert('현재온도는' + data.main.temp + '도 입니다.');
				}
			}) //getJSON
			
	}) //click
   
   
	}) //func
     */
</script>
		<!-- 구글맵 스크립트 -->
 <script>
    function initMap(lat1, lng1) {
    	//파라메터 적용
    	
    	// 파라메터 입력
        var seoul = {lat: lat1, lng: lng1 };
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 10,
          center: seoul
        });
        var marker = new google.maps.Marker({
          position: seoul,
          map: map
        });
      }
    </script>
    
		<!-- CSS -->
<style type="text/css">
#container{
 /* background-color: orange; */
 height: 550px;
}
#temp {
	font-weight: bold;
	font-size: 40px;
}
#name{
	font-size: 30px;
	font-weight: bold;
}
#detail{
	font-size: 18px;
	font-weight: bold;
}
#map {
	height: 400px;  /* The height is 400 pixels */
	width: 100%;  /* The width is the width of the web page */
}
#subIcon {
	font-size: 37px;
	color: #0c3e72;
}
#textI {
	font-weight: bold;
	font-size: 12px;
}
</style>
</head>

<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤더 end -->

<!-- main 날씨정보 start -->
<div id="container" align="center"  >
	<input id="t1" placeholder="도시이름을 작성해주세요." > <button id="bt1">검색</button>
	<h5 style="color: red;">*도시이름은 영어로 작성해주세요.</h5>
		<hr>
	
	<!-- 아이콘 & 정보 -->	
	<img alt="img" src="" id="icon" style="width: 130px;">  <!-- 날씨 이미지 -->
	<div id="temp"></div>		<!-- 기온 -->
	<div id="name"></div>		<!-- 도시 이름 -->
	<div id="detail"></div>		<!-- 상세 기후 정보 -->


<table style="width: 350px;"  >
<tr align="center">
		<td style="width: 30%">
			<i class="fas fa-cloud" id="subIcon"></i></td>	<!-- fontAwesome API CDN 아이콘 사용 (구름) -->
			
				<td style="width: 30%">	
					<i class="fas fa-umbrella" id="subIcon"></i></td> <!-- API 아이콘 : 우산 -->
					
						<td style="width: 30%">	
							<i class="fas fa-wind" id="subIcon"></i></td> <!-- API 아이콘 : 습도 -->
	</tr>	
	<tr align="center" id="textI">
							<!-- text -->
					<td style="width: 30%">				
						<div id="cloud" ></div></td>  <!-- 구름의 % -->
							
			<td style="width: 30%">
				<div id="wet" ></div></td>		<!-- 습도 % -->
					
		<td style="width: 30%">
			<div id="wind" ></div></td> 		<!-- 바람세기 m/s -->
	</tr>	
</table>
</div>
<!-- 날씨정보 end -->

<!-- 위도, 경도 : 검색값 입력용도 -->
<input type="hidden" id="lat" value="">
<input type="hidden" id="lng" value="">

	<!-- 지도 -->
<div id="map"></div>
    <!-- 지도 호출 -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBd2psTOAmADCNJdNwoOY5n9I7-168Ywac&callback=initMap">
    </script>
    
    
	<!-- footer  -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
</body>
</html>