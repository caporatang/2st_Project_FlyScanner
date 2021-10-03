<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		//로그인 세션
		String fId = (String)session.getAttribute("fId");
		if(fId == null) {
			fId = "null";			
		}
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
	<!-- 채연 -->
	<!-- datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- main dropdown menu -->
	<link rel="stylesheet" href="resources/css/htmain.css">
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
	//input을 datepicker로 선언
	$("#datepicker_in").datepicker(
		{
			dateFormat : 'yy-mm-dd', //달력 날짜 형태
			showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			showMonthAfterYear : true, // 월- 년 순서가아닌 년도 - 월 순서
			changeYear : true, //option값 년 선택 가능
			changeMonth : true, //option값  월 선택 가능                
			yearSuffix : "년", //달력의 년도 부분 뒤 텍스트
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], //달력의 월 부분 텍스트
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], //달력의 월 부분 Tooltip
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], //달력의 요일 텍스트
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ], //달력의 요일 Tooltip
			minDate : "-5Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			maxDate : "+5y", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
			yearRange : "2021:2023",
			minDate : 0, //과거 날짜를 선택하지 못하도록 비활성화
			onSelect : function(selected) {
				$("#datepicker_out").datepicker("option", "minDate",
						selected)
				}
		});
	$("#datepicker_out").datepicker(
		{
			dateFormat : 'yy-mm-dd', //달력 날짜 형태
			showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			showMonthAfterYear : true, // 월- 년 순서가아닌 년도 - 월 순서
			changeYear : true, //option값 년 선택 가능
			changeMonth : true, //option값  월 선택 가능                
			yearSuffix : "년", //달력의 년도 부분 뒤 텍스트
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], //달력의 월 부분 텍스트
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ], //달력의 월 부분 Tooltip
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], //달력의 요일 텍스트
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ], //달력의 요일 Tooltip
			minDate : "-5Y", //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			maxDate : "+5y", //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
			yearRange : "2021:2023",
			minDate : 0, //과거 날짜를 선택하지 못하도록 비활성화
			onSelect : function(selected) {
				$("#datepicker_in").datepicker("option", "maxDate",
						selected)
			}
		});
	//초기값을 오늘 날짜로 설정
	$('#datepicker_in').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	$('#datepicker_out').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

// 	//ajax 통신 전후 로딩 이미지 띄우기 (여기 아직 지우지 말기. 합쳐보고 로딩부분 이상하면 이거 수정에 쓸 것)
// 	$('#loading').hide() //최초 진입 시 로딩 영역 div를 숨김
// 	.ajaxStart(function() { // ajax 통신 시작 직후 실행됨 (로딩바 show)
// 	      $('#loading').show();
// 	})
// 	.ajaxStop(function() { // ajax 응답 완료 후 성공여부 관계없이 실행됨 (로딩바 hide)
// 	       $('#loading').hide();
// 	});
	
	//호텔탭 메인 리스트업
		$('#loading').show();
		$.ajax({
			url : "mainlist.hotel",
			data : {
				checkin : $('#datepicker_in').val(),
				checkout : $('#datepicker_out').val(),
				stdnum : $('#rcount').val(), //얘내 둘은 메인이 켜지며 ajax가 실행되자마자 mainlist에 보내지는거임.
				guestnum : $('#gcount').val() //그래서 자꾸 1, 1이 가는거...여기 데이터를 실으면 안됨. 그럼 어디??
											//mainlist.jsp에서 객실선택 버튼을 누를 때 새 ajax가 실행되어야...
			},
			success : function(list) {
				if (list) {
					$('#loading').hide();
				}
				//alert('성공@@@@')
				$('#result').html(list)
			},
			error : function() {
				alert('실패@@@@')
			}
			
		})//ajax
		
	//(안 쓸 것!)메인에서는 검색 버튼을 안 거치기 때문에 카운트 완료 버튼 클릭 시 반영돤 stdnum, guestnum을 전송하게끔 했다.
// 		$('#choose').click(function() {
// 			$.ajax({
// 				url : "mainlist.hotel",
// 				data : {
// 					checkin : $('#datepicker_in').val(),
// 					checkout : $('#datepicker_out').val(),
// 					stdnum : $('#rcount').val(),
// 					guestnum : $('#gcount').val()
// 				},
// 				success : function(list) {
// 					if (list) {
// 						$('#loading').hide();
// 					}
// 					//alert('성공@@@@')
// 					$('#result').html(list)
// 				},
// 				error : function() {
// 					alert('실패@@@@')
// 				}
				
// 			})//ajax
// 		})//#choose		

	//키워드 검색 후 리스트업 + ajax 로딩//test(망하면 지워~!~!)
		$('#search').click(function() {
			keyValue = $('#keyword').val()
			inValue = $('#datepicker_in').val()
			outValue = $('#datepicker_out').val()
			rValue = $('#rcount').val()
			gValue = $('#gcount').val()
			$('#loading').show();
			//검색 버튼 클릭 시 mainlist를 숨기고, 다음 ajax 호출 성공 시 보여준다.
			$('#result').hide();
				//목적지를 입력하지 않으면 ajax 통신 안 하도록 처리
				if (keyValue == '') {
					$('#loading').hide();
					$('#result').show();
				} else {	
					$.ajax({
					url : "key.hotel",
					data : {
						keyword : keyValue, //dto에 있는 변수로 키를 넣어야
						checkin : inValue,
						checkout : outValue,
						stdnum : rValue,
						guestnum : gValue
					},
					success : function(list2) {
						if (list2) {
							$('#loading').hide();
						}
						//alert('성공@@@@')
						$('#result').show();
						$('#result').html(list2)
					},
					error : function() {
						alert('실패@@@@')
					}
				})//ajax
			}//if
		})//#search
	
	}); //$ end
	
	//객실수, 투숙인원 카운트
	function rplus() { //객실수+
		$('#rminus').attr('disabled', false)
		rValue = $('#rcount').val();
		rVal = parseInt(rValue);
		if (rVal < 5) {
			$('#rcount').val(rVal + 1);
		}else if(rVal >= 5){
			$('#rplus').attr('disabled', true)
		}
		//객실은 객실수=인원일 때
		gValue = $('#gcount').val();
		gVal = parseInt(gValue);
		if (gVal == rVal && rVal < 5) {
			$('#gcount').val(gVal + 1);
			$('#rcount').val(rVal + 1);
		}
	}
	function rminus() { //객실수-
		$('#rplus').attr('disabled', false)
		rValue = $('#rcount').val();
		rVal = parseInt(rValue);
		if (rVal > 1) { //2,3,4,5...
			$('#rcount').val(rVal - 1);
		} else if(rVal == 1){
			$('#rminus').attr('disabled', true)
		}
	}
	function gplus() { //인원수+
		$('#gminus').attr('disabled', false)
		gValue = $('#gcount').val();
		gVal = parseInt(gValue);
		if (gVal < 10) {
			$('#gcount').val(gVal + 1);
		}else if(gVal >= 10){
			$('#gplus').attr('disabled', true)
		}
	}
	function gminus() { //인원수-
		$('#gplus').attr('disabled', false)
		gValue = $('#gcount').val();
		gVal = parseInt(gValue);
		if (gVal > 1) { //2,3,4,5...
			$('#gcount').val(gVal - 1);
		} else if(gVal == 1){
			$('#gminus').attr('disabled', true)
		}
	}
	function complete() {
		rValue = $('#rcount').val()
		gValue = $('#gcount').val()
		$('#g_r_count').val('성인 ' + gValue + '명, ' + rValue + "개")
		
	}
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


<!-- 전체 요소 가운데 정렬 -->
<div align="center" style="margin-bottom: 100px">

	<!-- 검색창 -->
	<div style="background: #0A82FF; color: white; padding: 10px">
		<table>
			<tr>
				<td>어디로 가시나요?</td>
				<td>체크인</td>
				<td>체크아웃</td>
				<td>투숙객 및 객실</td>
			</tr>
			<tr>
				<td><input id="keyword" placeholder="목적지를 입력하세요."></td>
				<td><input type="text" id="datepicker_in"></td>
				<td><input type="text" id="datepicker_out"></td>
<!-- 				<td><input name="count"></td> -->
				<td>
					<div class="dropdown" style="color: black">
					  <div class="dropbtn">
					  	<input id="g_r_count" value="성인 1명, 1개" width="168px" height="26.44px" readonly>
					  </div>
					  <div class="dropdown-content">
					    <div style="margin-top: 10px; margin-left: 5px">인원
					    	<div style="margin-left: 40px; display: inline">
					    	<button id="gminus" onclick="gminus()">-</button> 
					    	<input id="gcount" value="1" style="width: 30px" readonly> 
					    	<button id="gplus" onclick="gplus()">+</button></div>
					    </div>
					  	<div style="margin-left: 5px">객실
					    	<div style="margin-left: 40px; display: inline">
					    		<button id="rminus" onclick="rminus()">-</button> 
					    		<input id="rcount" value="1" style="width: 30px" readonly> 
					    		<button id="rplus" onclick="rplus()">+</button>
					    	</div>
					    </div>
					    <div align="right" style="margin-top: 10px;">
					    	<button id ="choose" onclick="complete()">완료</button>
					    </div>
					  </div>
					</div>
				</td>
			</tr>
			<tr align="right">
				<td colspan="4">
						<button id="search">투숙할 지역 검색</button>
				</td>
			</tr>
		</table>
	</div>

	<!-- 로딩 영역 -->
	<div id="loading">
		<img src="resources/img/hotel/loading.gif" />
	</div>
	
	<!-- 리스트업 될 곳 -->
	<div id="result" style="margin-top: 50px; height: auto"></div>
	
<!-- test(9/24) -->
<div align="right" style="margin-top: 10px; margin-right: 260px">
<% if(fId.equals("admin")){ %>
	<a href="htMainAd.jsp">
		<button class="button">관리자 페이지</button>
	</a>
<% } %>
</div>
</div>
<!-- 푸터 영역 -->
<jsp:include page="footer.jsp"></jsp:include>   
</body>
</html>