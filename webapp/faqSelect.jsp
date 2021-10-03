<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<style type="text/css">
table {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script>
function login() {
	alert ('로그인해야 접근 가능한 게시판입니다.')
}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h1>무엇을 도와 드릴까요?</h1>
		<h1>선택하신 항목으로 이동 됩니다.</h1>
	</div>
	<hr>
	<table>
		<tr>
			<td><a href="faqCategory.jsp"> <img
					src="resources/img/faq.png" width="500px" height="500px">
			</a></td>
			
			<!-- 관리자이거나 세션이 null이 아닌경우(유저가 로그인 한 경우)  -->
			<%if (fId.equals("admin") || !fId.equals("null")) {%>
			<td><a href="QuestionCustomer2.jsp"> <img
					src="resources/img/qna.png" width="500px" height="500px">
			</a></td>
			<%} else if (fId.equals("null")) {%> <!— 로그인을 하지 않은경우 —>
			<td><a href="#a" onclick = "login()"> 
					<img src="resources/img/qna.png" width="500px" height="500px">
			</a></td>
			<%} %>
			
			
			<!— 관리자이거나 세션이 null이 아닌경우(유저가 로그인 한 경우)  —>
			<%if (fId.equals("admin") || !fId.equals("null")) {%>
			<td><a href="questionList"> <img
					src="resources/img/qnaList.png" width="500px" height="500px">
			</a></td>
			<%
			} else if (fId.equals("null")) { /*로그인이 안된 경우 */
			%>
			<td><a href="#a" onclick = "login()"> 
				<img src="resources/img/qnaList.png" width="500px" height="500px">
			</a></td>
			<%
			}
			%>
		</tr>
		<tr>
			<td><h2>자주 묻는 질문</h2></td>
			<td><h2>1:1 문의하기</h2></td>
			<td><h2>문의 글 확인하기</h2></td>
		</tr>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>