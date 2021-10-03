<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String fId = (String)session.getAttribute("fId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 카카오 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 아임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
$(function() {
	$('#btC').click(function() {
		var num11 = prompt('인증할 전화번호를 입력하세요.', '');	//prompt 대신 input으로 대체가능.
		// "ORD20180131-0000011"
			var IMP = window.IMP; // 생략 가능
			IMP.init("iamport");
			IMP.certification({ // param
	              merchant_uid: "ORD20180131-0000011" , // 인증 id 필요 x 
	              m_redirect_url : "member_info.member?id=" + "<%= fId %>" , // 성공시 이동 페이지
	              popup : false // PC환경에서는 popup 파라메터가 무시되고 항상 true 로 적용됨
	            }, 
	            function (rsp) { // callback
	               if (rsp.success) { // 인증 성공 시
	                  	alert("인증에 성공하셨습니다!");
	               		location.href= "number_confirm.member?id="+ "<%= fId %>"+ "&tel=" + num11; //Controller 이동 + id, 전화번호 넘김
	                 } else {
	                   alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	                 }
		})//ajax
	})//click
})//func
	
</script>

<!-- function -->
<script type="text/javascript">
function unlink() {		// 카카오톡 계정연동 삭제
	Kakao.init('12834938b9d60b4b8bc5becd102451f4'); //API 인증키
	Kakao.isInitialized();
	var accessToken = Kakao.Auth.getAccessToken();
	Kakao.Auth.setAccessToken(accessToken);			// Token 값 세팅.
	
	Kakao.API.request({					// 카카오 서버에 요청.
		url: '/v1/user/unlink',			// 연동 삭제 요청
		success: function(response) {	
			console.log(response);	
			callbackFunction(); // 성공시 서버 처리 함수
		},
		fail: function(error){
			alert('탈퇴처리가 실패했습니다. \n관리자에게 문의 바랍니다.');
			console.log(error);
		}
	});								
}
</script>
<script type="text/javascript">
	$(function() {
		$('#del').click(function() {
			var check = prompt('회원탈퇴를 하시려면 "delete"를 입력하세요','');
				if (check === "delete") { // delete 입력시
					$.ajax({
						url: "deleteM.member", // request 맵핑 주소
						data: {Id: '<%= session.getAttribute("fId") %>'} , // 세션 ID 값 전달. 
			 			success: function(data) {	// DB데이터 삭제 완료시
							if (data == 1) {
								alert('회원탈퇴가 성공적으로 이루어졌습니다.');
								location.href = "index.jsp"; 
							} else{
								alert('오류가 발생했습니다 다시도해주세요.');
							}//else
						}//success
			 		})//ajax
				} else {
					alert('입력값이 틀렸습니다!');
				}
		})
	})//func
</script>
<!-- CSS -->
<style type="text/css">
	table {
		 border-top: 1px solid #444444;
    	border-collapse: collapse;
		width: 650px;
	}
	th, td {
    border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
    font-size: 18px;
  }
  th:first-child, td:first-child {
    border-left: none;
  }

</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 헤더 end -->

<div align="center" style="height: auto; margin-top: 90px; margin-left: 370px; margin-right: 370px;">
<h2>회원 정보</h2>
<hr>
	<table>
		<tr align="center" style="width: 200px; height: 80px;">
			<th>아이디</th> <td colspan="2">${bag.id}</td>
		</tr>
		<tr align="center" style="width: 200px; height: 80px;">
			<th>이메일</th> <td colspan="2">${bag.email}</td>
		</tr><tr align="center" style="width: 200px; height: 80px;">
			<th>이름</th> <td colspan="2">${bag.kname}</td>
		</tr><tr align="center" style="width: 200px; height: 80px;">
			<th>영문이름</th> <td colspan="2">${bag.enamef} ${bag.enamel}</td>
		</tr><tr align="center" style="width: 200px; height: 80px;">
			<th>성별</th> <td colspan="2"> ${bag.gender}</td>
		</tr><tr align="center" style="width: 200px; height: 80px;">
			<th>생일</th> <td colspan="2">${bag.birth}</td>
		</tr><tr align="center" style="width: 20px; height: 80px;">
			<th>연락처</th> <td>${bag.tel}  </td> <td style="width: 20%">	<a href="#" style="font-size: 14px;"><button id="btC">연락처 본인 인증</button> </a></td>
		</tr><tr align="center" style="width: 200px; height: 80px;">
			<th>출신국가</th> <td colspan="2">${bag.country}</td>
		</tr>
	</table>
	<form action="member_info_u.member">
		<input type="hidden" name="id" id="id" value="${bag.id}">
		<button>회원정보 변경하기</button>
	</form>
	<!-- 버튼 -->
	<button name="del" id="del" onclick="unlink()" style="color: red;">회원탈퇴</button>
	<a href="member_myPage.jsp"> <button>뒤로가기</button></a>
	
	</div>
	<!-- footer  -->
		<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer end -->
	
</body>
</html>