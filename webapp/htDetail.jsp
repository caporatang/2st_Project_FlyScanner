<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//mainlist.jsp에서 a태그로 hid를 받아옴
    	//key.jsp에서 a태그로 hid, image, 유저입력(in, out, stdnum, guestnum) 받아옴
    	String hid = request.getParameter("hid");
    	String himage = request.getParameter("himage");
    	String checkin = request.getParameter("checkin");
    	String checkout = request.getParameter("checkout");
//     	String stdnum = request.getParameter("stdnum");
    	String guestnum = request.getParameter("guestnum");
    	String htlat = request.getParameter("htlat");
    	String htlong = request.getParameter("htlong");
    	//out.print(himage); //${list2[0]}은...미국뉴욕1.jpg
    	//out.print(hid); //값 옴!!
//     	out.print(htlat + "/"); //값 옴!!
//     	out.print(htlong); //값 옴!!

    %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Flyscanner</title>
    <!-- 플라이스캐너 로고   -->
    <link rel="icon" href="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/flaticon.css">
	<link rel="stylesheet" href="resources/css/animate.css">
	<link rel="stylesheet" href="resources/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/gijgo.min.css">
    <link rel="stylesheet" href="resources/css/nice-select.css">
	<!--제이쿼리 ui css-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--제이쿼리 js-->
	<script src=“https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js”></script>
	<!--제이쿼리 ui js-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- 카카오 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<!-- datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	function kakaoLogout() {
		Kakao.init('12834938b9d60b4b8bc5becd102451f4');
		Kakao.isInitialized();
		console.log(Kakao.isInitialized());	
		
		if (!Kakao.Auth.getAccessToken()) {
			  console.log('Not logged in.');
			  alert('Not logged in.');
			  return;
			}
			Kakao.Auth.logout(function() {
			  console.log(Kakao.Auth.getAccessToken());
			  
			  var accessToken = Kakao.Auth.getAccessToken();
				Kakao.Auth.setAccessToken(accessToken);
				alert(accessToken);
			});
	}
</script>
<script type="text/javascript">
$(function() {
	
	//ajax 통신 전후 로딩 이미지 띄우기
	$('#loading').hide() //최초 진입 시 로딩 영역 div를 숨김
	.ajaxStart(function() { // ajax 통신 시작 직후 실행됨 (로딩바 show)
	      $('#loading').show();
	})
	.ajaxStop(function() { // ajax 응답 완료 후 성공여부 관계없이 실행됨 (로딩바 hide)
	       $('#loading').hide();
	});
	
	//1개 가져오기-상세페이지
	$.ajax({
		url : "search.hotel",
		data : {
			hid : $('#hidVal').val(),
			//test(9/20) 유저 입력
			checkin : $('#checkinVal').val(),
			checkout : $('#checkoutVal').val(),
// 			stdnum : $('#stdnumVal').val(),
			guestnum : $('#guestnumVal').val(),
			htlat : $('#htlatVal').val(),
			htlong : $('#htlongVal').val()
		},
		success : function(bag) { //url이 가상주소일 때 bag은 views의 결과
			//alert('성공@@@@')
			$('#result').html(bag)

		},
		error : function() {
			alert('실패@@@@')
		}
		
	})// ajax

})//$

</script>

<!-- 로딩 영역 css -->
<style type="text/css">
	div#loading {
	        text-align: center;
	        padding-top: 70px;
	        background: #FFFFF0;
	        opacity: alpha*0.6; /* alpha:투명도. 0.0(완전투명)~1.0(완전 불투명) */
	}
</style>

</head>
<body>
<!-- 헤더 영역 -->
<jsp:include page="header.jsp"></jsp:include>

<!-- 로딩 영역 -->
<div id="loading">
	<img src="resources/img/hotel/loading.gif" />
</div>

<!-- 전체 요소 가운데 정렬 -->
<div align="center" style="margin-bottom: 100px">
	
	<!-- 이미지 -->
	<div>
		<table style="width: 100%; height: 250px">
			<tr>
				<td align="center">
					<img src="resources/img/hotel/<%= himage %>" style="width: 550px; height: 300px;">
				</td>
				<td align="center">
					<img src="resources/img/hotel/<%= hid %>_1.jpg" style="width: 550px; height: 300px;">
				</td>
				<td align="center">
					<img src="resources/img/hotel/<%= hid %>_2.jpg" style="width: 550px; height: 300px;">
				</td>
			</tr>
		</table>
	</div>
	<!-- ajax 호출 결과 붙일 곳 -->
	<div id="result" align="center" style="margin-top: 50px; height: auto"></div>
	
	<!-- 스크립트로 넘길 값들 -->	
	<input type="hidden" id="hidVal" value=<%= hid %>>
	<input type="hidden" id="checkinVal" value=<%= checkin %>>
	<input type="hidden" id="checkoutVal" value=<%= checkout %>>
	<input type="hidden" id="guestnumVal" value=<%= guestnum %>>
	<input type="hidden" id="htlatVal" value=<%= htlat %>>
	<input type="hidden" id="htlongVal" value=<%= htlong %>>

</div>

<!-- 푸터 영역 -->
<jsp:include page="footer.jsp"></jsp:include>   
</body>
</html>