<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	session.getAttribute("fId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<h1>로그 아웃 성공!</h1>
세션값 : <%= session.getAttribute("fId") %> <br>

<a href="main.jsp">홈으로</a>
</body>
</html>