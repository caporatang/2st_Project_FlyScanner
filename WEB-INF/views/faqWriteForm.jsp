<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 작성</title>
<style>
table {
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h1>FAQ</h1>
	</div>
	<hr color="gray">
	<table>
		<tr>
			<td><h3>카테고리를 선택하세요.</h3>
				<form action="faqWrite">
					<select name="fKind" style="width: 400px">
						<option value="val" selected="selected">선택하세요</option>
						<option value="1">정보</option>
						<option value="2">결제</option>
						<option value="3">예약</option>
						<option value="4">검색</option>
						<option value="5">여행</option>
					</select><br>
			</td>
		</tr>
		<tr>
			<td>
				<h3>제목</h3> <input name="fTitle" size=53><br>
			</td>
		</tr>
		<tr>
			<td>
				<h3>내용</h3> <textarea rows="10" cols="50" name="fContent"></textarea><br>
				<button class="button">FAQ 남기기</button>
				</form>
			</td>
		</tr>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>