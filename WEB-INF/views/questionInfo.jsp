<%@page import="com.fly.pro2.DTO.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="questionList" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//session.setAttribute("fId", "admin");// 합칠때 삭제
String fId = (String) session.getAttribute("fId"); // admin 버튼 구현
/* session.setAttribute("fId", "fId");// 합칠때 삭제
String fId =(String)session.getAttribute("fId"); // user 유저일땐 안보여요 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	margin-right: auto;
	margin-left: auto;
}
th {
	width: 100px;
	text-align: center;
	height: 50px;
}
td{
	width: 400px;
	padding-left: 50px;
}
</style>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		$('#questionDelete').click(function() {
			var qid = "${questionList.qid}"; 
			if ( qid == "<%= fId %>") {
				
			deleteCheck = confirm('문의를 삭제 하시겠습니까?') 
			if (deleteCheck) {
			$.ajax({
				url : "questionDelete", 
				data : { 
					qno : ${questionList.qno}
				},
				success : function(result) {
					if (result == 1 ) {
						alert('문의가 삭제 되었습니다.')
						location.href = "questionList"
					}else {
						alert ('다시 시도 해주세요.')
					}
				}// success function end
			}) //ajax end
			}else {
				alert('삭제를 취소 합니다')
			}
		}else {
			alert('삭제 권한이 없습니다');
		} //if else
			})// button questionDelete end
			
			
			// 수정권한
			$('#questionUpdateRead').click(function() {
				var qid = "${questionList.qid}";
				if ( qid != "<%= fId %>") {
					alert('수정권한이 없습니다.');
					return false;
				}else{
					$('#id1').submit();
				} //if else
			})// click
	})//jquery start end
</script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
	<div align="center">
		<h1>문의</h1>
	</div>
	<hr>
	<table border=10px><!-- border=30px -->
		<tr>
			<th>제목</th>
			<td>${questionList.qtitle}</td>
		</tr>

		<tr>
			<th>작성 날짜</th>
			<td>${questionList.qdate}</td>
		</tr>

		<tr>
			<th>문의 종류</th>
			<td>${questionList.qkind}</td>
		</tr>

		<tr>
			<th style="text-align:center;" colspan="2">문의 내용</th>
		</tr>
		<tr>
			<td style="text-align:center;" width="100px;" colspan="2" height="150px;">
							${questionList.qcontent}</td>
		</tr>
		
		<tr>
			<td style="text-align:center;" height="100px;">
			<%-- <% 
				if (fId.equals() {
			%> --%>
				<form action="questionUpdateRead.question" id="id1">
				<input type="hidden" name="qno" value="${questionList.qno}">
				<button id="questionUpdateRead" class="button" >수정</button>
				</form>
				<button id="questionDelete" class="button">삭제</button>
			</td>
			<%-- <% } %> --%>

			<td style="text-align:center;" >
				<%
				if (fId.equals("admin")) {
				%> <a href="AnswerForm?fk_seq=${questionList.qno}">
					<button class="button" >답변</button></a>
			 <%}%>
			</td>
		</tr>
	</table>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>