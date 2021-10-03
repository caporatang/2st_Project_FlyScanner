<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
var planeBookNo = $('#no2').val();

$(document).ready(function() {
$('#b1').click(function() {
	var hotelBookNo = $('#no1').val();
	if (hotelBookNo.length == 14 && hotelBookNo.includes('H') && hotelBookNo.includes('b')) {
		$('#c1').submit();
	} else {
		$('#d1').html("예약번호가 올바르지 않습니다. 예약번호를 다시 입력해주세요")
		event.preventDefault()
	}
})
$('#b2').click(function() {
	var planeBookNo = $('#no2').val();
	if (planeBookNo.length == 11 && planeBookNo.includes('P') && planeBookNo.includes('b')) {
		alert("예약번호를 검색합니다")
	} else {
		$('#d1').html("예약번호가 올바르지 않습니다. 예약번호를 다시 입력해주세요")
		event.preventDefault()
	}
})
})

</script>
</head>
<body>
<form action="hotelPayS2.do" id="c1">
<h1>호텔예약 조회</h1>
호텔예약번호를 입력하세요<br>
<input id="no1" type="text" placeholder="예약번호(ex. H123456b7890)" maxlength="14" name="hotelBookNo">
<button id="b1">호텔예약 조회</button>
</form>
<hr>
<form action="planePayS2.do">
<h1>항공권예약 조회</h1>
항공권예약번호를 입력하세요<br>
<input id="no2" type="text" placeholder="예약번호(ex. P100617b001)" maxlength="11" name="planeBookNo">
<button id="b2">항공권예약 조회</button>
</form>
<hr>
<div id="d1" style = "color :red"></div>
</body>
</html>