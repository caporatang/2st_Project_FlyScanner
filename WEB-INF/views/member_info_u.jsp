<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
    	String fId = (String)session.getAttribute("fId");
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function back() {
		  window.history.back();
	}

</script>
<!-- css -->
<style type="text/css">
	.in1 {
		display: inline-block;
		width: 80%;
		padding: 0.375rem 0.75rem;
		border: 0.0625rem solid #b2b2bf;
		border-radius: 0.25rem;
		color: black;
	}
	
	
</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤더 end -->

<div id="d1" align="left" style="height: 800px; margin-top: 90px; margin-left: 800px; margin-right: 370px; ">

<h2>회원 정보 수정</h2>
<hr>
	<form action="update.member">
		이메일* <br>
		<input class="in1" type="text" name="email" id="email" placeholder="사용가능한 이메일을 입력하세요." value="${bag.email}" readonly> <br>
			<div id="error" style="color: red;"></div>
	
	아이디*<br>
		<input class="in1" type="text" name="id" id="id" value="${bag.id}" readonly>
			<div id="errorId" style="color: red;"></div>
	이름* <br>
		<input class="in1" type="text" name="kname" id="kname" placeholder="한글 이름을 입력하세요." value="${bag.kname}"> <br>
			<div id="errorNa" style="color: red;"></div>
	
	영문이름
	성(First Name)    <br>
	<input type="text" name="enamef" id="enamef" class="in1" value="${bag.enamef}">   <br>
	 
	 이름(Last Name) <br>
	<input type="text" name="enamel" id="enamel" class="in1" value="${bag.enamel}"> <br>	
	
		
	성별 <br>
		<label> <input type="radio" name="gender" value="male">남성</label> 
		<label> <input type="radio" name="gender" value="female">여성</label> <br>
	
	생일 <br>
		<input type="date" name="birth"> <br>
	
	핸드폰 번호* <br>
				<!-- 국가번호  -->
		<!-- <select name="Tel" id="Tel">
			<option value="82" selected >+82(대한민국)</option>		
		<option value="1">+1(미국)</option>
		<option value="81">+81(일본)</option>
		<option value="86">+86(중국)</option>
		<option value="61">+61(호주)</option>
		<option value="1">+1(캐나다)</option>
		</select> -->
				<!-- 번호 -->
		<input class="in1" type="text" name="tel" id="tel" maxlength="14" value="${bag.tel}"> <br>  

	국가 <br>
		<select id="country" name="country">
		<option value="">=====국가=====</option>
		<option value="Republic Of Korea">대한민국</option>
		<option value="Usa">미국</option>
		<option value="Japan">일본</option>
		<option value="China">중국</option>
		<option value="Australia">호주</option>
		<option value="Canada">캐나다</option>
	</select> <br>
		<input type="hidden" name="coupon" id="coupon" value="0"> 
		
		<div align="center">			
		<a href="member_myPage.jsp"><button>취소하기</button></a>
		<button  >저장하기</button>
		</div>
	</form>
	</div>
	<!-- footer  -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
	
</body>
</html>

	