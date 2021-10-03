<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

function faqInfo() {
	location.href = "faqInformation"
}

</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<center>
		<h1>
			스카이스캐너 정보<br>
		</h1>
		<h1>아래 항목을 클릭하면 이동합니다</h1>
		<hr>
	
		<a href="#a" onclick="faqInfo()" width="400px" height="350px"> 
		<img src="resources/img/information.png" width="400px" height="350px">
		</a>
		
		<a href="#a" width="400px" height="350px"> 
		<img src="resources/img/price.png" width="400px" height="350px">
		</a>
		<a href="#a" width="400px" height="350px"> 
		<img src="resources/img/reservation.png" width="400px" height="350px">
		</a>
		<br>
		<a href="#a" width="400px" height="350px"> 
		<img src="resources/img/search.png" width="400px" height="350px">
		</a>
		<a href="#a" width="400px" height="350px"> 
		<img src="resources/img/travel.png" width="400px" height="350px">
		</a>
		</center>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>