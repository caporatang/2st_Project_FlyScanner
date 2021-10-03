<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
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
		<h1>FAQ 수정</h1>
		<hr color="gray">
	</div>
	<table>
		<tr>
			<td>카테고리를 선택하세요.
				<form action="faqUpdate.faq">
					<input type="hidden" name="fNo" value="${faqList.fNo}"> <select
						name="fKind" style="width: 400px">
						<option value="${faqList.fKind}" selected="selected">${faqList.fKind}</option>
					</select><br>
			</td>
		</tr>
		<tr>
			<td>
				<h3>제목</h3> <input name="fTitle" size=52 value="${faqList.fTitle}"><br>
			</td>
		</tr>
		<tr>
			<td>
				<h3>내용</h3> <textarea rows="20" cols="50" name="fContent">${faqList.fContent}</textarea><br>
				<button class="button">FAQ 수정하기</button>
			</td>
		</tr>
		</form>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>