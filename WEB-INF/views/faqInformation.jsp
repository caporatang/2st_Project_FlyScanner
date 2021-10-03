<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="faqList" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	String fId = (String)session.getAttribute("fId"); 
	if(fId == null) {
		fId = "null";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/faqInfo.css">

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h2>정보</h2>
	</div>
	<hr>
	<faqList:forEach items="${faqList}" var="faq">
		<%if ((fId == null) || (fId != null)) { %>
		<button class="accordion">${faq.fTitle}</button>
		<%} %> <!-- 로그인이 안됐거나, 관리자, 유저들도 리스트를 볼수있게 -->
		<div class="panel">
			<p>${faq.fContent}</p>
			<%
			if (fId.equals("admin")) {
			%>
			<form action="faqDelete">
				<input type="hidden" name="fNo" value="${faq.fNo}">
				<button name="faqDelete" class="button">글 삭제</button>
			</form>

			<form action="faqUpdateRead">
				<input type="hidden" name="fNo" value="${faq.fNo}">
				<button name="faqUpdateRead" class="button">글 수정</button>
				<%
				}
				%>
			</form>
		</div>
	</faqList:forEach>
	<br>
	<div style="margin-left: 30px;">
		<%
		if (fId.equals("admin")) {
		%>
		<form action="faqWriteForm">
			<button class="button">글 작성</button>
		</form>
	</div>
	<%
	}
	%>
	
	<script type="text/javascript" src="resources/js/faqInfo.js"></script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
