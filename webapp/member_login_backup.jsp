<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
		Kakao.init('12834938b9d60b4b8bc5becd102451f4');
		console.log(Kakao.isInitialized());	
	</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('#logBt1').click(function() {
			if ($('#id').val() == '') {
					alert('아이디를 입력하세요.');
					$('#id').focus();
					return false;
			}else if ($('#pw').val() == '') {
					alert('패스워드를 입력하세요.');
					$('#pw').focus();
					return false;
			}else{
				$.ajax({
					url: "sLogin.member",   
					data: {
						Id :  $('#id').val(),
						Pw :  $('#pw').val(),
					},
					success: function(data) {
						if (data == 0) {
								console.log(data);
								alert('아이디 혹은 패스워드가 틀렸습니다!');
							}else{
								location.href = "main.jsp";
							}
						} //success end 
					}) //ajax
			
			}//else	
		})//click
					// "loginCheck.member", -> 비암호화시 사용할 맵핑주소   
 					/* $('#loginForm').submit();  */
	})//func ready
</script>
</head>
<body>


아이디 : <input type="text" name="id" id="id" > <br>
패스워드 : <input type="text" name="pw" id="pw"> <br>

<button id="logBt1" name="logBt1" >로그인</button> <br>
<a href="member_join.jsp">회원가입</a>

<!-- 카카오 로그인 -->
<a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="resources/img/kakao_login_medium.png"
    width="100"
  />
</a>
<script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.login({
      success: function(authObj) {
        alert(JSON.stringify(authObj))
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    })
  }
</script>
</body>
</html>