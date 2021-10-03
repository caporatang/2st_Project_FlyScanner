<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
	$(function() {
		$('#bt1').click(function() {
				var IMP = window.IMP; // 생략 가능
				IMP.init("iamport");
				IMP.certification({ // param
		              merchant_uid: "ORD20180131-0000011", // 주문 번호
		              m_redirect_url : "member_mypage.jsp", // 모바일환경에서 popup:false(기본값) 인 경우 필수, 예: https://www.myservice.com/payments/complete/mobile
		              popup : false // PC환경에서는 popup 파라메터가 무시되고 항상 true 로 적용됨
		            }, 
		            function (rsp) { // callback
		               if (rsp.success) { // 인증 성공 시
		                  alert("인증성공!");
		                   location.href="index.jsp"
		       
		                 } else {
		                   alert("인증에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		                 }
			})//ajax
		})//click
	})//func
</script>
</head>
<body>

<button id="bt1">인증하기</button>
</body>
</html>