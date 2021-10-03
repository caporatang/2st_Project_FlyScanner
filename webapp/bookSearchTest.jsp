<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(document).ready(function() {
$('#b1').click(function() {
	window.open('bookSearch.jsp', 'bookSearchPop', 'width=400, height=300, left=400, top=0, resizable = yes');	
})
})

</script>
</head>
<body>
<button id="b1">조회</button>
</body>
</html>