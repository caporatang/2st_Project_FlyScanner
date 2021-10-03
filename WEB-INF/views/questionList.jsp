<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="questionList" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String fId = (String)session.getAttribute("fId"); 
if(fId == null) {
	fId = "null";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역 확인하기</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>


</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	 <div align="center">
	<h1>문의 내역</h1>
	<hr>
	<table class="type09">
		<thead>
			<tr>
				<th width="100">문의 번호</th>
				<th width="550">문의 제목</th>
				<th width="95">문의 날짜</th>
			</tr>
		</thead>
		<questionList:forEach items="${questionList}" var="board">
			<tbody>
				<tr>
					<th scope="row">${board.qno}</th>
					<questionList:choose>
						<questionList:when test="${board.fk_seq == 0}">
							<td height="30px;" id="title"><a href="questionInfo?qno=${board.qno}">${board.qtitle}</a></td>
						</questionList:when>

						<questionList:otherwise>
							<td style="padding-left: 20px;" height="30px;">
							<a href="questionInfo?qno=${board.qno}">ㄴ[답변]${board.qtitle}</a></td>
						</questionList:otherwise>
					</questionList:choose>
					<td style="text-align: center;">${board.qdate}</td>
				</tr>
			</tbody>
		</questionList:forEach>
	</table>
	</div>
		<%
		if (fId.equals("admin")) {
		%>
	<div align="center">		
	<jsp:include page="chart.jsp"></jsp:include>
	</div>
	<%} %>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
