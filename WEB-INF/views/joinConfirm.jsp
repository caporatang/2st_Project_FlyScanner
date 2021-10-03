<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤더 end -->

<div align="center" style="height: 500px;">

<h3>환영합니다!</h3>
<h2>회원가입이 완료되었습니다</h2>
<button><a href="index.jsp">홈으로</a></button> <button><a href="member_login.jsp">로그인</a></button>
</div>


<!-- footer  -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
</body>
</html>