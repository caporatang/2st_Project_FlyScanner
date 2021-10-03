<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
			String emailK = (String)request.getAttribute("kakaoEmail");    
			String gender = (String)request.getAttribute("kakaoGender");    
			String birth = (String)request.getAttribute("kakaoBirth");    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 회원가입 창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 공백체크  -->

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
<!-- 카카오 회원가입 기능처리 -->
<script type="text/javascript">
$(function() {
	
	var idx = false;

	/*  취소 버튼 메서드 */
function cancelCheck() {
	location.href = "http://localhost:8889/pro2/main.jsp"
};

	/* 회원가입 버튼  */
$('#submit').click(function() {
	
	if ($('#email').val() == "") {
		alert('email 확인');
		$('#email').focus();
		return false;
	}else if(!email.value.includes('@')){
		alert('올바른 e-mail 형식이 아닙니다!');
		return false;
	}
	else if ($('#id').val() == "") {
		alert('id 확인');
		$('#id').focus();
		return false;
	}
	//패스워드 공백 & 두개가 같은지 
	else if ($('#pw').val() == "" ) {
		alert('패스워드 확인');
		$('#pw').focus();
		return false;
	}
	else if ($('#pw').val() !== $('#pw1').val()) {
		alert('패스워드가 다릅니다!');
		$('#pw1').focus();
		errorPw1.innerHTML = '비밀번호가 틀렸습니다.';
		return false;
	}
	else if ($('#kname').val() == "") {
		alert('이름 확인');
		$('#kname').focus();
		return false;
	}
	else if ($('#tel').val() == "") {
		alert('핸드폰 번호 확인');
		$('#tel').focus();
		return false;
	};
	// 중복체크 체크여부
	if (idx == false) {
		alert('아이디 중복체크를 해주세요!');
		idx = false;
		return false;
	}else if(idx = true){
		$('#form1').submit();
	}; 
})//click


	/* 중복체크 버튼 */
$('#bt1').click(function() {
	ch = $('#id').val();
	if (!ch == "" && ch.length > 3 && ch.length < 22) {
		Id1 = $('#id').val();
		$.ajax({
			url: "idcheck.member",   
			data: {
				Id :  $('#id').val()
			},
			success: function(data) {
				if (data == 0) {
						console.log(data);
						alert('사용가능한 아이디 입니다!');
						idx = true;
					}else if(data == 1){
						alert('사용불가능한 아이디 입니다.');
						idx = false;
					} 			
				} //success end 
			}) //ajax
	}else if (ch == "") {
		alert('아이디를 입력해주세요.');
	}else if( 3 >= ch.length || ch.length > 21){
		alert('아이디는 4~20자 입력가능합니다.');
	}
})//click

})// func


</script>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤더 end -->


<div align="left" style="height: 800px; margin-top: 90px; margin-left: 800px; margin-right: 370px;">
<h2>추가 회원정보 입력</h2>
<hr style="width: 80%;" align="left">

<form action="sInsert.member" name="form1" id="form1">
이메일* <br>
		<input type="text" name="email" id="email" value="<%= emailK %>" readonly class="in1" > <br>
			<div id="error" style="color: red;"></div>
	
	아이디*<br>
		<input type="text" name="id" id="id" class="in1">
			<div id="errorId" style="color: red;"></div>
		<!-- 중복체크 버튼 -->
			<input type="button" id="bt1" name="bt1"  value="중복체크"> <br>
		
	비밀번호* <br>
		<input type="text" name="pw" id="pw" class="in1"> <br>
			<div id="errorPw" style="color: red;"></div>
	비밀번호 확인* <br>
		<input type="text" name="pw1" id="pw1" class="in1"> <br>
			<div id="errorPw1" style="color: red;"></div>	
		
	영문이름
	성(First Name)    <br>
	<input type="text" name="enamef" id="enamef" class="in1">   <br>
	 
	 이름(Last Name) <br>
	<input type="text" name="enamel" id="enamel" class="in1"> <br>	
	
	이름* <br>
		<input type="text" name="kname" id="kname" placeholder="한글 이름을 입력하세요." class="in1"> <br>
			<div id="errorNa" style="color: red;"></div>
		
	성별 <br>
		<input type="text" id="gender" name="gender" value="<%= gender %>" class="in1" readonly>
		 <br>
	
	생일 <br>
		<%-- <input type="text" id="birth" name="birth" value="<%= birth %>" readonly class="in1"> <br> --%>
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
		<input type="text" name="tel" id="tel" maxlength="14" class="in1" > <br>  

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
<button id="submit" name="submit">회원정보 수정</button>
</form>
</div>
	<!-- footer  -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->


<script type="text/javascript">
	/* 공백 체크 & 올바른값 체크 */
	// 이메일
	email.onblur = function() {
		if (email.value == "") {
			email.classList.add('invalid');
			error.innerHTML = "필수항목 입니다.";
		}else if (!email.value.includes('@')) {
			email.classList.add('invalid');
			error.innerHTML = "올바른 이메일 주소를 입력하세요.";
		};
	};
	email.onfocus = function() {
		if (this.classList.contains('invalid')) {
			this.classList.remove('invalid');
			error.innerHTML = "";
		}
	};
	//아이디
	id.onblur = function() {
		if (id.value == "") {
			id.classList.add('invalidId');
			errorId.innerHTML = '필수항목 입니다.';
		};
	}
	id.onfocus = function() {
		if (this.classList.contains('invalidId')) {
			this.classList.remove('invalidId');
			errorId.innerHTML = "";
	};
	};
	//비밀번호
	pw.onblur = function() {
		if (pw.value == "") {
			pw.classList.add('invalidPw');
			errorPw.innerHTML = '필수항목 입니다.';
		};
	}
	pw.onfocus = function() {
		if (this.classList.contains('invalidPw')) {
			this.classList.remove('invalidPw');
			errorPw.innerHTML = "";
	};
	};
	pw1.onblur = function() {
		if (pw1.value == "") {
			pw1.classList.add('invalidPw1');
			errorPw1.innerHTML = '필수항목 입니다.';
		};
	}
	pw1.onfocus = function() {
		if (this.classList.contains('invalidPw1')) {
			this.classList.remove('invalidPw1');
			errorPw1.innerHTML = "";
	};
	};
	//이름
	kname.onblur = function() {
		if (kname.value == "") {
			kname.classList.add('invalidName');
			errorNa.innerHTML = '필수항목 입니다.';
		};
	}
	kname.onfocus = function() {
		if (this.classList.contains('invalidName')) {
			this.classList.remove('invalidName');
			errorNa.innerHTML = "";
	};
	};
</script>
</body>
</html>