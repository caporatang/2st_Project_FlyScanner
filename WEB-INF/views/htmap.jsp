<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
// 	    String hid = request.getParameter("hid");
// 	    double htlat = Double.parseDouble(request.getParameter("htlat"));
// 	    double htlong = Double.parseDouble(request.getParameter("htlong"));
	    String htlat = request.getParameter("htlat");
	    String htlong = request.getParameter("htlong");
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// function initMap(){
		
// 	var htlatVal = parseFloat($('#htlatVal').val());
// 	var htlongVal = parseFloat($('#htlongVal').val());
// // 		alert(htlatVal) //값 잘 찍힘
// // 		alert(htlongVal)
// 	var x = {lat: htlatVal, lng: htlongVal}
// 	var map = new google.maps.Map(document.getElementById("map"),
// 			{
// 				center : x,
// 				zoom : 15
// 			});
// 	var marker = new google.maps.Marker({
// 		position: x,
// 		map: map
// 	})
// }
	
function initMap(){
		
	var htlatVal = parseFloat($('#htlatVal').val());
	var htlongVal = parseFloat($('#htlongVal').val());
// 		alert(htlatVal) //값 잘 찍힘
// 		alert(htlongVal)
	
	var map = new google.maps.Map(document.getElementById("map"),
			{
				center : {lat: htlatVal, lng: htlongVal},
				zoom : 15
			});
	var marker = new google.maps.Marker({
		position: {lat: htlatVal, lng: htlongVal},
		map: map
	})
}


</script>
</head>
<body>
	<div id="map">지도!!!!</div>
	
<!-- 지도 api -->
	<script async defer 
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOCH5vwJeydNckCLeabheWlRpsSj49efU&callback=initMap">
	</script>

<!--     <script -->
<!--       src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOCH5vwJeydNckCLeabheWlRpsSj49efU&callback=initMap&v=weekly" -->
<!--       async -->
<!--     ></script> -->

<!--     <script -->
<!--       src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOCH5vwJeydNckCLeabheWlRpsSj49efU&callback=initMap&libraries=&v=weekly" -->
<!--       async -->
<!--     ></script> -->

	<input type="hidden" id="htlatVal" value=<%= htlat %>>
	<input type="hidden" id="htlongVal" value=<%= htlong %>>
</body>
</html>