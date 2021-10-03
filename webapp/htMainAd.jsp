<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Admin 페이지</h3>
<hr>
<h4>호텔정보 등록</h4>
<form action="insert.hotel">
	사업자번호: <input name="hid"><br>
	호텔명: <input name="hname"><br>
<!-- 	이미지: <input name="himage"><br> -->
	주소: <input name="hregion"><br>
	입실 가능 일자: <input name="checkin"><br>
	퇴실 가능 일자: <input name="checkout"><br>
	수용 가능한 투숙인원: <input name="guestnum"><br>
	객실종류: <input name="roomsort"><br>
	스탠다드 가격: <input name="stdprice"><br>
	스탠다드 객실수: <input name="stdnum"><br>
	위도: <input name="htlat"><br>
	경도: <input name="htlong"><br>
	<button>호텔정보 등록</button>
	<!-- 이미지는  -->
	<input type="hidden" name="himage" value=""><br>
</form>
<hr>
<h4>호텔정보 수정</h4>
<form action="update.hotel">
	사업자번호: <input name="hid"><br>
	호텔명: <input name="hname"><br>
	주소: <input name="hregion"><br>
<!-- 	이미지: <input name="himage"><br> -->
	입실 가능 일자: <input name="checkin"><br>
	퇴실 가능 일자: <input name="checkout"><br>
	수용 가능한 투숙인원: <input name="guestnum"><br>
	객실종류: <input name="roomsort"><br>
	스탠다드 가격: <input name="stdprice"><br>
	스탠다드 객실수: <input name="stdnum"><br>
	<button>호텔정보 수정</button>
	<input type="hidden" name="himage" value=""><br>
</form>
<hr>
<h4>호텔정보 삭제</h4>
<form action="delete.hotel">
	사업자번호: <input name="hid"><br>
	<button>호텔정보 삭제</button>
</form>	
</body>
</html>