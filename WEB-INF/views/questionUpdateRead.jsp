<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<style>
table {
	margin-left: auto;
	margin-right: auto;
}
</style>
<title>문의를 남겨주세요.</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h1>문의하기</h1>
		<hr color="gray">
	</div>

	<table>
		<tr>
			<td>
				<form action="update.question">
					<input type="hidden" name="qno" value="${questionList.qno}"><br>

					<h3>어떤 사항에 대해 문의 하시나요 ?</h3> <br> <select name="qkind"
						style="width: 400px">
						<option value="val" selected="selected">${questionList.qkind}</option>
						<option value="reservation">예약</option>
						<option value="feedback">피드백</option>
						<option value="payment">결제</option>
						<option value="airline">항공</option>
					</select><br>
			</td>
		</tr>
		<tr>
			<td>
				<h3>제목</h3> <input name="qtitle" size=50 value=${questionList.qtitle}><br>
			</td>
		</tr>
		<tr>
			<td>
				<h3>세부 내용</h3> <textarea rows="10" cols="50" name="qcontent">${questionList.qcontent}</textarea>
				<br>
				<button class="button">문의 수정하기</button>
				</form>
			</td>
		</tr>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>