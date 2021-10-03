<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
	<script type="text/javascript">
		Kakao.init('12834938b9d60b4b8bc5becd102451f4');	// API 인증키
		Kakao.isInitialized();							// API를 초기화 후 사용해야함.
		console.log(Kakao.isInitialized());	
		
		function kakaoLogin() {	// 카카오 로그인 function
			 Kakao.Auth.login({	// 카카오 API 변수.
				 scope:'account_email, gender, birthday, profile_nickname', // 카카오에 요청할 DATA
				 success: function(authObj) {	
					console.log(authObj);
						Kakao.API.request({	// 로그인후 사용하기위해 카카오 서버에 요청
							url: '/v2/user/me',
							success: res =>{
								// 토큰 등록 : 토큰 등록을해야 scope에서 요청한 DATA를 불러올수 있음.
								var accessToken = Kakao.Auth.getAccessToken(); // 토큰
								Kakao.Auth.setAccessToken(accessToken);	// 토큰값으로 서버에 접근권한 요청.
								
								const email = res.kakao_account.email;
								const gender = res.kakao_account.gender;
								const birth = res.kakao_account.birthday;
								console.log(email);
								console.log(gender);
								console.log(birth);
								
								$('#kemail').val(email);	// scope로 요청한 DATA 를 input(hidden)에 
								$('#kgender').val(gender);	// value 값으로 지정
								$('#kbirth').val(birth);
								
								$('#kakaosubmit').submit();	//소셜 로그인시 회원등록 여부 판단을 위해 별도 submit
								// 테스트용 
								/* $('#token-result').append(email + '<br>');
								$('#token-result').append(gender  + '<br>');
								$('#token-result').append(birth + '<br>'); */
							}//success
							
						})//request
				}//success
			 })
		}//kakaoLogin
	</script>
	<!-- 사이트 로그인 -->
<script type="text/javascript">
	$(function() {
		$('#logBt1').click(function() {	// 로그인 버튼 Click시 Event
			if ($('#id').val() == '') {	// 입력폼 공백 체크
					alert('아이디를 입력하세요.');
					$('#id').focus();
					return false;
			}else if ($('#pw').val() == '') {	// 입력폼 공백 체크
					alert('패스워드를 입력하세요.');
					$('#pw').focus();
					return false;
			}else{
				$.ajax({						// ajax
					url: "sLogin.member",   	// RequestMapping 주소
					data: {
						Id :  $('#id').val(),	// 전송 데이터는 입력한 id,pw 값
						Pw :  $('#pw').val(),
					},
					success: function(data) {	
						if (data == 0) {		// 로그인 실패시
								console.log(data);
								alert('아이디 혹은 패스워드가 틀렸습니다!');
							}else{				// 로그인 성공시 main 페이지 이동
								location.href = "index.jsp";
							}
						} //success end 
					}) //ajax
			}//else	
		})//click
					// "loginCheck.member", -> 비암호화시 사용할 맵핑주소   
 					/* $('#loginForm').submit();  */
	})//func ready
</script>
<style type="text/css">
	.in1 {
		display: inline-block;
		width: 80%;
		padding: 0.375rem 0.75rem;
		border: 0.0625rem solid #b2b2bf;
		border-radius: 0.25rem;
		color: black;
	}

.t1{
	font-weight: bold;
	font-size: 20px;
}

</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤더 end -->

<div align="center" style="height: 600px; margin-top: 90px;">

<table style="width: 350px;">
	<tr>
		<td class="t1"> 아이디 </td> 
	</tr>
	<tr>
		<td> <input type="text" name="id" id="id" class="in1" ></td> 
	</tr>
	<tr>
		<td class="t1"> 패스워드 </td> 
	</tr> 
	<tr>
		<td> <input type="password" name="pw" id="pw" class="in1"> </td>
	</tr>
</table>
				<!-- 카카오 로그인 버튼(이미지) -->
		<a id="custom-login-btn" href="javascript:kakaoLogin()">
			<img src="resources/img/kakao_login_medium_narrow.png" />
		</a>
						<!-- 사이트 로그인 버튼 -->
 		<button id="logBt1" name="logBt1" style="width: 160px; height: 40px;">로그인</button>
	<form action="kakaoLogin.member" id="kakaosubmit">
		<input type="hidden" id="kemail" name="email" value="">
		<input type="hidden" id="kgender" name="gender" value="">
		<input type="hidden" id="kbirth" name="birth" value="">
	</form>
	
<hr style="width: 500px;">	
<a href="member_join.jsp">회원가입</a>
	
	
</div>
	
	
	<!-- footer  -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
</body>
</html>