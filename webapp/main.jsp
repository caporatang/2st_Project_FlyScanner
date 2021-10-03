<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String fId = (String)session.getAttribute("fId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
</head>
<body>

	<%if(fId == null){ %>
<!-- 	<a href="member_join_backup.jsp">회원가입</a> 비암호화 루트 -->
	<a href="member_join.jsp">회원가입</a>
	<a href="member_login.jsp">로그인</a>
	<%} %>
	
	<%if(fId != null){ %>
	<a href="member_myPage.jsp">mypage</a>
	<a href="logout.member" id="logout" onclick="kakaoLogout()">로그아웃</a> <br>
	아이디 : <%= fId %> 
	<%} %>
</body>
</html>