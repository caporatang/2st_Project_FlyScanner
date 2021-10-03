<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/hotelBook2.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">


<%-- 쿠폰이 있을시 --%> 
$(function() {
	if ('${hotelPayReturn.coupon}' == 1 ) {
		$(".couponChoice").show();
	} else {
		$(".couponChoice").hide();
		
	}
})
	
$(document).ready(function() {
	//모든 약관에 동의 버튼 클릭시, 각 항목의 class agree 에 해당하는 input checked
	$('#checkedAll').click(function() {
		if ($('#checkedAll').prop("checked")) {
			$('.agree').prop("checked", true);
		} else {
			$('.agree').prop("checked", false);
		}
	})
	//동의항목 클릭시, input이 value값 Y 를 가지는 개수와 class agree의 개수가 동일할시 전체 동의도 같이 checked
	$(".agree").click(function() {
		if ($("input[value='Y']:checked").length == $('.agree').length) {
			$('#checkedAll').prop("checked", true);
		} else {
			$('#checkedAll').prop("checked", false);
		}
	})
	//비동의항목 하나라도 클릭 시, 전체 동의 버튼 checked 해제
	$(".no").click(function() {
		if ($(".no").length > 0) {
			$('#checkedAll').prop("checked", false);
		} 
	})
	
	// 할인 클릭시 text 변경
	var text1 = '${hotelPayReturn.total}' / 10;
	var text2 = '${hotelPayReturn.total}' * 0.9;
	$(".choice").click(function() {
		alert("할인 10%가 적용됩니다.")
		$('.disCount').text(text1);
		$('.lastP').text(text2 + '원');
	})
	
	$(".notChoice").click(function() {
		alert("할인을 미적용합니다.")
		$('.disCount').text('0원');
		$('.lastP').text('${hotelPayReturn.total}' + '원');
	})
	
	
	// 모두 동의시에만 버튼 결제버튼 활성화
	$('a[href="testpay.jsp"]').click(function(e){
	if(!($("input[value='Y']:checked").length == 4 )) {
		alert("모든 약관에 동의 하셔야 결제가 가능합니다.")
			e.preventDefault();
	}
	})
})
	
</script>

</head>
<body>
<!-- 헤더 start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 헤더 end -->
	<div id="container" style="height: 900px;">
		<div class="inr">
			<!---->
			<div id="contents" class="contents fontCtrl">
				<div class="text_wrap big">
					<strong class="tit">예약하기</strong>
				</div>
				<div class="ly_wrap pay_info">
					<div class="inr">
						<div class="checkbox_group">
							<div class="text_wrap mid check">
								<strong class="tit">약관동의</strong> <span class="right_cont"><span
									class="form_holder check"><input type="checkbox"
										id="checkedAll" class="inpt_checkbox"> <label
										for="checkedAll" class="label_checkbox">모든 약관에 동의합니다.</label></span></span>
							</div>
							<div class="js_acc clearfix line">
								<div class="inr">
									<div class="holder">
										<a href="#acc_con1" class="header"></a> <span class="option">
											예약취소 및 환불정책 안내 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="checkHTL" id="checkHTL01" value="Y" class="agree">
												<label for="checkHTL01" class="label_checkbox">동의합니다</label></span>
											<span class="form_holder radio"><input type="radio"
												name="checkHTL" id="checkHTL02" value="N" class="no">
												<label for="checkHTL02" class="label_checkbox">동의하지
													않습니다</label></span>
										</div>
									</div>
								</div>
								<div class="inr">
									<div class="holder">
										<a href="#acc_con2" class="header"></a> <span class="option">
											호텔 예약 주의사항 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="checkHRA" id="checkHRA01" value="Y" class="agree">
												<label for="checkHRA01" class="label_checkbox">동의합니다</label></span>
											<span class="form_holder radio"><input type="radio"
												name="checkHRA" id="checkHRA02" value="N" class="no">
												<label for="checkHRA02" class="label_checkbox">동의하지
													않습니다</label></span>
										</div>
									</div>

								</div>
								<div class="inr">
									<div class="holder">
										<a href="#acc_con3" class="header"></a> <span class="option">
											개인정보 수집 및 이용 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="checkPIC" id="checkPIC01" value="Y" class="agree">
												<label for="checkPIC01" class="label_checkbox">동의합니다</label></span>
											<span class="form_holder radio"><input type="radio"
												name="checkPIC" id="checkPIC02" value="N" class="no">
												<label for="checkPIC02" class="label_checkbox">동의하지
													않습니다</label></span>
										</div>
									</div>

								</div>
								<div class="inr">
									<div class="holder">
										<a href="#acc_con4" class="header"></a> <span class="option">
											개인정보 제3자 제공 동의 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="checkPIP" id="checkPIP01" value="Y" class="agree">
												<label for="checkPIP01" class="label_checkbox">동의합니다</label></span>
											<span class="form_holder radio"><input type="radio"
												name="checkPIP" id="checkPIP02" value="N" class="no">
												<label for="checkPIP02" class="label_checkbox">동의하지
													않습니다</label></span>
										</div>
									</div>

								</div>
							</div>

						</div>

<div class ="couponChoice">
						<div class="inr" >

							<div>
								<div class="text_wrap mid check">
									<strong class="tit">할인선택</strong>
								</div>
							</div>
						</div>
						<div class="js_acc clearfix line">
							<div class="inr">
								<div class="holder">
									<a href="#acc_con5" class="header"></a> <span class="option">
										쿠폰할인선택 <span class="opt">(선택)</span>
									</span>
									<div class="right_cont">
										<span class="form_holder radio"><input type="radio"
											name="checkHTM" id="checkHTM01" value="A" class="choice">
											<label for="checkHTM01" class="label_checkbox">할인적용</label></span> <span
											class="form_holder radio"><input type="radio"
											name="checkHTM" id="checkHTM02" value="B" class="notChoice">
											<label for="checkHTM02" class="label_checkbox">할인미적용
										</label></span>
									</div>
								</div>
							</div>
						</div>
</div>
						<!---->
					</div>
					<div class="inr right">
						<div class="text_wrap mid">
							<strong class="tit">결제상세내역</strong>
						</div>
						<div class="js_acc multi filter_wrap">
							<div class="pay_area">
								<div class="info_area total">
									<div class="info">
										<strong class="tit">최종 결제 금액</strong> <span>성인 2</span> <span
											class="divider_dot">아동 0</span>
									</div>

									<strong class="price mt5" > ${hotelPayReturn.total} <span>원</span></strong>

								</div>
								<div class="info_area">
									<div class="info">
										<strong class="tit">총 상품 금액</strong> <strong class="price">
											${hotelPayReturn.total} <span>원</span>
										</strong>
									</div>
								</div>
								<div class="info_area">
									<div class="info">
										<ul class="list_bul detail">
											<!---->
											<!---->

											<li><strong class="tit">할인금액</strong> <span class="disCount">0원</span></li>
										</ul>
									</div>
								</div>
								<div class="info_area">
									<div class="info">
										<strong class="tit">결제할 금액</strong> <span class="lastP">${hotelPayReturn.total}원</span>
									</div>
								</div>
							</div>
						</div>
						<form action = "hotelPay2.do">
						<div class="btn_wrap">
							<button class="btn big pink full"><span class="lastP">${hotelPayReturn.total}원</span> 결제하기</button>
							
						 	<input type="hidden" name="hName"  value="${hotelPayReturn.hName}">
							<input type="hidden" name="hRegion"  value="${hotelPayReturn.hRegion}">
							<input type="hidden" name="checkIn"  value="${hotelPayReturn.checkIn}">
							<input type="hidden" name="checkOut"  value="${hotelPayReturn.checkOut}">
							<input type="hidden" name="guestNum"  value="${hotelPayReturn.guestNum}">
							<input type="hidden" name="roomSort"  value="${hotelPayReturn.roomSort}">
							<input type="hidden" name="total"  value="${hotelPayReturn.total}">
							<input type="hidden" name="coupon"  value="${hotelPayReturn.coupon}">
							<input type="hidden" name="hotelBookNo"  value="${hotelPayReturn.hotelBookNo}"> 
							<input type="hidden" name="kName"  value="${hotelPayReturn.kName}"> 
							<input type="hidden" name="eFirth"  value="${hotelPayReturn.eFirth}"> 
							<input type="hidden" name="eLast"  value="${hotelPayReturn.eLast}"> 
							<input type="hidden" name="email"  value="${hotelPayReturn.email}"> 
							<input type="hidden" name="birth"  value="${hotelPayReturn.birth}"> 
							<input type="hidden" name="gender"  value="${hotelPayReturn.gender}"> 
							<input type="hidden" name="tel"  value="${hotelPayReturn.tel}"> 
							<input type="hidden" name="id"  value="${hotelPayReturn.id}"> 
							<input type="hidden" name="hId"  value="${hotelPayReturn.hId}"> 
																				 
							<!---->
							<!---->
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer start -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- footer end -->
</body>

</html>