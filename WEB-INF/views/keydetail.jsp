<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>검색된 호텔 정보입니다.</h1>
<hr>
<a href="key">
	<button>게시판 전체 목록으로 가기!</button>
</a><br>
<!-- dto.getId() -->
<!-- jsp는 $ mapper에서는 # -->
검색된 id: ${dto.id} <br>
검색된 title: ${dto.title} <br>
검색된 content: ${dto.content} <br>
검색된 writer: ${dto.writer} <br>
<hr color="red">
${list2}
</body>
</html>