<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<!-- 중복체크 & 회원가입 bt -->
<script type="text/javascript">
	$(function() {
		
		var idx = false;		// 아이디 중복체크 확인 변수
	
		/*  취소 버튼 메서드 */
	function cancelCheck() {
		location.href = "http://localhost:8889/pro2/main.jsp"
	};
		/* 회원가입 버튼  */
	$('#submit').click(function() {				// 회원가입 버튼 클릭시 검증과정 후 submit 하겠다는 function
		if ($('#email').val() == "") {			// 이메일이 입력됬는지 확인 
			alert('email 확인');
			$('#email').focus();				
			return false;
		}else if(!email.value.includes('@')){	// 이메일에 @가 필수로 포함되어있는지 확인 
			alert('올바른 e-mail 형식이 아닙니다!');
			return false;
		}
		else if ($('#id').val() == "") {		// ID 입력값이 공백이면 return false;
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
		else if ($('#pw').val() !== $('#pw1').val()) { // 패스워드 입력폼1 과 입력폼2의 값이 다를떄 return false;
			alert('패스워드가 다릅니다!');
			$('#pw1').focus();
			errorPw1.innerHTML = '비밀번호가 틀렸습니다.';   // 틀렸을시 해당 입력폼 focus 및 아래에 경고 메세지 출력
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
		if (idx == false) {					// 아이디 중복체크 안했을시 조건문
			alert('아이디 중복체크를 해주세요!');
			idx = false;
			return false;
		}else if(idx = true){				// 중복체크 완료되었을때 회원가입 submit.
			$('#form1').submit();
		}; 
	})//click
	
	
		/* 아이디 중복체크 버튼 */
	$('#bt1').click(function() {
		ch = $('#id').val();				// 아이디 입력폼의 값을 ch 변수에 저장.
		if (!ch == "" && ch.length > 3 && ch.length < 22) {	// 입력값의 길이가 4이상 22미만일때 중복체크 가능.
			//Id1 = $('#id').val();
			$.ajax({						// 비동기식으로 확인만 필요하기때문에 ajax 사용
				url: "idcheck.member",   	// member 컨트롤러에 Request Mapping 주소
				data: {
					Id :  $('#id').val()	// JSON 타입으로 데이터 전송
				},
				success: function(data) {	// 검색한 id의 값은 int 타입으로 1, 0으로 data에 저장.
					if (data == 0) {		// 같은 아이디가 없을시 (data ==0)
							console.log(data);
							alert('사용가능한 아이디 입니다!');
							idx = true;		// 아이디중복확인 변수 true 
						}else if(data == 1){// 아이디 검색값이 있을때
							alert('사용불가능한 아이디 입니다.');
							idx = false;	// 아이디중복확인 변수 false (false 일시 회원가입 불가.)
						} 			
					} //success end 
				}) //ajax
		}else if (ch == "") {				// 아이디를 입력안했을때
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
<h2>회원가입</h2>
<hr>

<form action="sInsert.member" name="form1" id="form1" >
	이메일* <br>
		<input class="in1" type="text" name="email" id="email" placeholder="사용가능한 이메일을 입력하세요."  > <br>
			<div id="error" style="color: red;"></div>
	
	아이디*<br>
		<input class="in1" type="text" name="id" id="id">
			<div id="errorId" style="color: red;"></div>
		<!-- 중복체크 버튼 -->
			<input type="button" id="bt1" name="bt1"  value="중복체크"> <br>
		
	비밀번호* <br>
		<input class="in1" type="text" name="pw" id="pw"> <br>
			<div id="errorPw" style="color: red;"></div>
	비밀번호 확인* <br>
		<input class="in1" type="text" name="pw1" id="pw1"> <br>
			<div id="errorPw1" style="color: red;"></div>	
		
	영문이름
	성(First Name)    <br>
	<input type="text" name="enamef" id="enamef" class="in1">   <br>
	 
	 이름(Last Name) <br>
	<input type="text" name="enamel" id="enamel" class="in1"> <br>	
	
	이름* <br>
		<input class="in1" type="text" name="kname" id="kname" placeholder="한글 이름을 입력하세요."> <br>
			<div id="errorNa" style="color: red;"></div>
		
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
		<input class="in1" type="text" name="tel" id="tel" maxlength="14" > <br>  

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
			<button type="button" id="cancel" onclick="cancelCheck()" >취소</button> <button id="submit" name="submit" >회원가입</button>
	</form>
	</div>
	<!-- footer  -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
	<!-- 공백체크  -->
<script type="text/javascript">
	/* 공백 체크 & 올바른값 체크 */
	// 이메일
	email.onblur = function() {
		if (email.value == "") {						// 이메일 입력폼을 떠났을때 공백체크
			email.classList.add('invalid');				// 공백시 invalid 라는 클래스 추가
			error.innerHTML = "필수항목 입니다.";			// 공백시 해당메세지 출력
		}else if (!email.value.includes('@')) {			// 입력폼에 @ 포함이 안되어있을시(올바른 이메일 폼)
			email.classList.add('invalid');				// invalid 클래스 추가
			error.innerHTML = "올바른 이메일 주소를 입력하세요.";
		};
	};
	email.onfocus = function() {						// 이메일 입력폼이 선택 되었을때
		if (this.classList.contains('invalid')) {		// classList에 "invalid" 가 포함되어있을때
			this.classList.remove('invalid');			// invalid 클래스 항목 제거
			error.innerHTML = "";						// 에러메세지 제거
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
	pw.onfocus = function() {						// 입력폼 선택시
		if (this.classList.contains('invalidPw')) {	// invalidPw 가 있을떄
			this.classList.remove('invalidPw');		// invalidPw 삭제
			errorPw.innerHTML = "";					// 에러 메세지 제거
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