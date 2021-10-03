<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변</title>
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
		<h1>답변하기</h1>
		<hr color="gray">
	</div>
	<table>
		<tr>
			<td>
				<form action="questionAnswer">
					<h3>제목</h3>
					<input name="qtitle" size=50 value="안녕하세요 고객님 답변드립니다."><br>
			</td>
		</tr>
		<tr>
			<td>
				<h3>세부 내용</h3> <textarea rows="10" cols="50" name="qcontent"></textarea>
				<br>
			</td>
		</tr>
		<tr>
			<td><input type="hidden" name="fk_seq" value="${fk_seq}">
				<button class="button">답변 남기기</button></td>
			</form>
		</tr>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>