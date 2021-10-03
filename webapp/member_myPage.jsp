<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String fId = (String)session.getAttribute("fId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- fontawesome 아이콘 -->
<script src="https://kit.fontawesome.com/ed304f677f.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	<%--  $(function() {
		
		$('#bt1').click(function() {
	 		$.ajax({
				url: "member_info.member",
				data: {Id: '<%= fId %>'} , 
	 			success: function(data) {
					if (data == 1) {
						console.log('불러오기 성공');	
					} 
	 				
				}//success
	 		})//ajax
		})//click
	})//func  --%>
	<%-- function submit1() {
		$.ajax({
			url: "member_info.member",
			data: {Id: '<%= fId %>'} , 
 			success: function(data) {
				if (data == 1) {
					console.log('불러오기 성공');
					location.href = "member_info";
				} 
			}//success
 		})//ajax
	} --%>
</script>
<script type="text/javascript">

$(document).ready(function() {
$('#bt2').click(function() {
	window.open('bookSearch.jsp', 'bookSearchPop', 'width=950, height=950, left=800, top=600, resizable = yes');	
})
})

function c1() {
	window.open('bookSearch.jsp', 'bookSearchPop', 'width=950, height=950, left=800, top=600, resizable = yes');
}


</script>
<style type="text/css">
	.t1{
		font-size: 20px;
	}

	.line {
		border-bottom: 1px solid gray;
		
		/* border-bottom-color: gray; */
	}
	.icon {
		font-size: 27px;	
	}
	
</style>
</head>
<body>
	<!-- 헤더 start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 헤더 end -->

	<div align="center" style="margin-left: 370px; margin-right: 370px; margin-top: 20px;">
		<h2>MyPage</h2>	
	</div>
	
	<!-- center part  -->
	<div align="center" style="height: 700px; margin-top: 90px; margin-left: 370px; margin-right: 370px;">
		<h3><%= fId %> 님 환영합니다!</h3>

	<table style="width: 30%; height: 35%;" border="0"  >
		<tr style="width: 20%; height: 30%">
			<td class="icon"><i class="far fa-user"></i></td>
			<td class="line">
				<a href="member_info.member?id=<%= fId %>" class="t1" >회원 정보</a>
			 </td>
			 
			<td class="line"> <form action="member_info.member">
					<input type="hidden" name="id" id="id" value="<%= fId %>">
				 <button id="bt1">조회</button>
			  </form>  
			 </td>
		</tr>
		
		<tr style="width: 60%; height: 30%;">
			<td class="icon"> <i class="fas fa-receipt"></i> </td>
			<td class="line"> <a href="#" class="t1" onclick="c1()">예약 조회</a> </td>
			<td class="line"> <button id="bt2">조회</button>	</td>
		</tr>
		
		<tr style="width: 20%; height: 30%;">
			<td class="icon"><i class="far fa-bell"></i></td>
			<td class="line"> <a href="questionList" class="t1">문의사항 조회</a> </td>
			<td class="line"> 
			<form action="questionList">
			<button>조회</button> </form></td>
		</tr>
	</table>
	<div style="margin-top: 20px;">
		<button><a href="logout.member">로그아웃</a></button> 
		<a href="index.jsp">
		<button>main 페이지로</button>
		</a>
	</div>	
		</div>
		<!-- center part end -->
		
		
		<!-- footer start -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- footer end -->
</body>
</html>