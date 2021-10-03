<%@page import="java.util.Date"%>
<%@page import="com.fly.pro2.DTO.HotelDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	    //뭐지........이게 여기서 get으로 어케 가져오는거지???? detail에서 a태그로 보내지도 않았는데???
	    //webbapp의 jsp간의 값전달은 스크립트릿으로 해도 ok..라배웠는데 이건 webbapp와 views 간인데? 이거도 되나봄
    	
	    //평점
	    String hid = request.getParameter("hid");
		char c = hid.charAt(11);
		int c2 = Integer.parseInt(String.valueOf(c));
		//지도에 넣을 위도 경도 값
		String htlat = request.getParameter("htlat");
	    String htlong = request.getParameter("htlong");
		
		//로그인 세션
		//String fId = (String)session.getAttribute("fId");
		//String fId = "test"; //유저 test로 로그인 되어있으면 정훈씨 파트로, null이면(로그인 안 했으면) 이동x
		
		String fId = (String)session.getAttribute("fId"); 
		if(fId == null) {
			fId = "null";
		}
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//로그인(세션) 체크
function reserv() {
	if($('#fId').val() == "null"){
		alert('로그인 후 이용해주세요.')
		return false;
	}
}

//구글맵 api
function initMap(){
	var htlatVal = parseFloat($('#htlatVal').val()); //NaN이 떠서 float로 바꿔줌
	var htlongVal = parseFloat($('#htlongVal').val());
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
<%-- 출력: ${bag}, ${bag.hid} --%>

<!-- 전체 div -->
<div style="margin: 0 auto;">

   <!-- 호텔명, 평점, 주소 영역 div -->
      <div style="width: 900px;">
         <div style="width: 900px; font-size: 50px; display: inline;">${bag.hname}</div>
         <div style="display: inline-block">
         <% for (int i = 0; i < c2 ; i++) { %>
            <img src="resources/img/hotel/star.jpg" width="20" height="20">
         <% } %>
         </div><br>
         <div style="width: 900px;"><img src="resources/img/hotel/gps.png" width="20" height="20">${bag.hregion}</div>
      </div>

   <!-- 지도 영역 -->
   <div id="map" style="width: 900px; height: 400px; margin-right: 40px;"></div>
	<!-- 지도 api -->
	<script async defer 
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOCH5vwJeydNckCLeabheWlRpsSj49efU&callback=initMap">
	</script>
	
	<!-- 내용 div -->
	<div style="background: white; height: auto; margin-right: 60px">
		<!-- 체크인아웃,투숙기간,인원 div -->
		<div style="background: white; margin-top: 20px">
			<table border="1">
				<tr bgcolor="#0A82FF" style="color: white">
					<td colspan="3">검색한 정보</td>
				</tr>
				<tr>
					<td width="300">체크인 날짜<br><font style="font-weight: bold">${checkin}</font><br>15:00부터</td>
					<td width="300">체크아웃 날짜<br><font style="font-weight: bold">${checkout}</font><br>${diffDays}박 선택</td>
					<td width="300">투숙객<br>성인 ${guestnum}명</td>
				</tr>
			</table>
		</div>
		<!-- 표 div -->
		<div style="background: white; margin-top: 20px">
			<table border="1">
				<tr>
					<td bgcolor="#0A82FF" style="color: white" colspan="2">성인 ${guestnum}명</td>
				</tr>
				<tr>
					<td width="450">스탠다드룸 x ${minStdnum}개 필요!
					<br><font style="font-weight: bold; color: red;">남은 객실 단 ${bag.stdnum}개</font></td>
					<td width="450">
						총가격<br><font style="font-weight: bold">${diffDays * bag.stdprice * minStdnum}원</font>
					</td>
				</tr>
			</table>
		</div><!-- 표 div end -->
	</div><!-- 내용 div end -->
</div><!-- 전체 div end -->


	<!-- 검색 영역 (구현 예정. 9/24 PM 5) -->
	<!-- 검색창 -->


	<!-- 버튼 영역 -->
	<!-- hotelbook.jsp로 값 전송 & 로그인 체크 -->
	<div style="margin-top: 20px">
		<a
			href="hotelBook.jsp?hId=${bag.hid}&hName=${bag.hname}&hRegion=${bag.hregion}&checkIn=${checkin}
		&checkOut=${checkout}&guestNum=${guestnum}&roomSort=${bag.roomsort}
		&standPrice=${diffDays * bag.stdprice * minStdnum}&stdNum=${minStdnum}&id=<%= fId %>" onclick="return reserv()">
			<button class="button">예약하기</button>
		</a>
		
	<!-- 이 버튼 누르면 update로 stdnum 수 변경하게(9/23) -->
	<!-- minStdnum이 아니라 유저가 최종 결정한 객실수여야함. -->
	<%-- <a href="stdupdate.hotel?hid=${bag.hid}&stdnum=${minStdnum}">	
		<button class="button">잔여객실 -${minStdnum}개</button>
	</a> --%>
	</div>
	
	<!-- 스크립트로 넘길 값들 -->	
	<input type="hidden" id="fId" value=<%= fId %>>
	<input type="hidden" id="htlatVal" value=<%= htlat %>>
	<input type="hidden" id="htlongVal" value=<%= htlong %>>
	
</body>
</html>