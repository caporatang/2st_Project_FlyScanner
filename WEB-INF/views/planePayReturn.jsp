<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/planeBook3.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">


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
	
	// 기내식 클릭시 text 변경
	
	var text2 = (${planePayReturn.total} + 30000);
	$(".choice").click(function() {
		alert("기내식을 선택하셨습니다. 결제금액에 3만원이 추가됩니다.")
		$('.lastP').text(text2 + '원');
		$('.price').text(text2);
		$('.price').attr('value', text2);
		$('#total').attr('value', text2);
		
	})
	
	$(".notChoice").click(function() {
		alert("기내식을 선택하지 않으셨습니다.")
		$('.lastP').text(${planePayReturn.total} + '원');
		$('.price').text(${planePayReturn.total});
		$('#total').attr('value', ${planePayReturn.total});
	})
	
	
	// 모두 동의시에만 버튼 결제버튼 활성화
	$('#b1').click(function(e){
	if(!($("input[value='Y']:checked").length == 4 )) {
		alert("모든 약관에 동의 하셔야 결제가 가능합니다.")
			e.preventDefault();
	}
	})
	
	//예약자와 동일 버튼 클릭시, 입력항목의 val값을 가져와서 아래 항목에 적용
	$('#chkSame').click(function() {
		$('#kNameSame').attr('value', $('#kName').val())
		$('#telSame').attr('value', $('#tel').val())
		$('#emailSame').attr('value', $('#email').val())
		$('#birthSame').attr('value', $('#birth').val())
		
	})
})
	


</script>

</head>
<body>
<!-- 헤더 start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 헤더 end -->
	
<form action="planePay2.do">
	<div id="container" style="height: 900px;">
		<div class="inr">
			<!---->
			<div id="contents" class="contents fontCtrl">
				<div class="text_wrap big">
					<strong class="tit">예약하기</strong>
				</div>
				<div class="ly_wrap pay_info">
					<div class="inr">
						<div class="cont_unit">
							<div id="reservationInfo" class="text_wrap mid">
								<strong class="tit">예약자 정보</strong>
							</div>
							<div class="tbl">
								<table class="type2">
									<colgroup>
										<col style="width: 17%;">
										<col>
										<col style="width: 17%;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>이름</th>
											<td><input type="text" placeholder="한글이름(ex.윤정훈)"
												class="inpt_text w250" id= "kName" name="kName" value=""> <!----></td>
											<th>생년월일</th>
											<td><input type="text" placeholder="법정 생년월일(ex.1998115)"
												class="inpt_text w250" id="birth"name="birth" > <!----></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="text"
												placeholder="이메일 주소(ex.sample@gmail.com)"
												class="inpt_text w250" id="email" name="email" > <!----></td>
											<th>휴대폰 번호</th>
											<td><input type="text"
												placeholder="휴대폰번호(ex.01012345678)" class="inpt_text w250" id="tel" name="tel" >
												<!----></td>
										</tr>
										<!---->
									</tbody>
								</table>
							</div>
							<div class="text_wrap mid">
								<strong class="tit">탑승자 정보</strong>
							</div>
							<div id="psrlistDiv1" class="text_wrap type sml">
								<strong class="tit">탑승자 정보 1 (성인)</strong>
								<div class="right_cont">
									<span class="form_holder check"><input type="checkbox"
										id="chkSame"> <label for="chkSame"
										class="label_checkbox">예약자와 동일</label></span>
								</div>
							</div>
							<div class="tbl">
								<table class="type2">
									<colgroup>
										<col style="width: 17%;">
										<col>
										<col style="width: 17%;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th>성명(한글)</th>
											<td colspan="3"><input type="text"
												placeholder="한글이름(ex.윤정훈)" class="inpt_text w250" id="kNameSame" > <!----></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td><input type="text" placeholder="법정 생년월일(ex.1998115)"
												class="inpt_text w250" id="birthSame" > <!----></td>
											<th>성별</th>
											<td><div class="form_wrap">
																		<span class="form_holder radio"><input
																			type="radio" value="M" name="gender" id="genderM1"
																			class="inpt_radio"> <label for="genderM1"
																			class="label_radio">남성</label></span> <span
																			class="form_holder radio"><input type="radio"
																			value="F" name="gender" id="genderW1"
																			class="inpt_radio"> <label for="genderW1"
																			class="label_radio">여성</label></span>
																		<!---->
																	</div></td>
										</tr>
										<tr>
											<th>영문 성</th>
											<td><input type="text" placeholder="영문 성(ex. YOON)"
												class="inpt_text w250" name="eFirth"> <!----></td>
											<th>영문 이름</th>
											<td><input type="text" placeholder="영문 이름(ex. JEONGHUN)"
												class="inpt_text w250" name="eLast" > <!----></td>
										</tr>
										<tr>
											<th>휴대폰 번호</th>
											<td><input type="text"
												placeholder="휴대폰번호(ex.01012345678)" class="inpt_text w250" id="telSame">
												<!----></td>
											<th>이메일</th>
											<td><input type="text"
												placeholder="이메일 주소(ex.sample@gmail.com)"
												class="inpt_text w250" id="emailSame"> <!----></td>
										</tr>
										<!---->
									</tbody>
								</table>
						
							<input type="hidden" name="ticketNo"  value="${planePayReturn.ticketNo}">
							<input type="hidden" name="ticketSt"  value="${planePayReturn.ticketSt}">
							<input type="hidden" name="ticketSp"  value="${planePayReturn.ticketSp}">
							<input type="hidden" name="stDate"  value="${planePayReturn.stDate}">
							<input type="hidden" name="spDate"  value="${planePayReturn.spDate}">
							<input type="hidden" name="people"  value="${planePayReturn.people}">
							<input type="hidden" name="total" value="${planePayReturn.total}">
							<input type="hidden" name="id"  value="${planePayReturn.id}">
							<input type="hidden" name="planeBookNo"  value="${planePayReturn.planeBookNo}">
							
							</div>
							<!---->
							<div>
								<ul class="list_bul billiard mt20">
									<li>여권상 영문이름과 다른경우 탑승이 불가하며, 예약 후에는 영문이름 변경이 불가하오니 실제
										탑승하실분의 여권상 동일한 영문 성/이름,성별을<br>정확히 입력해 주시기 바립니다. (영문 성/이름
										입력시 띄어쓰기나 "-"표시 없이 영문스펠링만 정확히 입력해 주십시오)
									</li>
									<!---->
									<li>등록하신 여권번호/국적/생년월일/여권만료일은 변경사항이 있는 경우 출국 72시간 전까지 재등록이
										가능합니다.</li>
								</ul>
							</div>
							
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
											항공권 예약 주의사항 <span class="opt">(필수)</span>
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
										기내식선택 <span class="opt">(선택)</span>
									</span>
									<div class="right_cont">
										<span class="form_holder radio"><input type="radio"
											name="checkHTM" id="checkHTM01" value="A" class="choice">
											<label for="checkHTM01" class="label_checkbox">기내식을 선택합니다</label></span> <span
											class="form_holder radio"><input type="radio"
											name="checkHTM" id="checkHTM02" value="B" class="notChoice">
											<label for="checkHTM02" class="label_checkbox">기내식선택하지 않습니다
										</label></span>
									</div>
								</div>
							</div>
						</div>
</div>
														
							<!---->
							<!---->
							<!---->
							<!---->
							<!---->
						</div>
						<div></div>
						<!---->
						<!---->
						<div class="inr right" style="right: auto; left: 0px;">
						<div class="text_wrap mid">
							<strong class="tit">상품결제정보</strong>
						</div>
						<div class="js_acc multi filter_wrap">
							<div class="pay_area">
								<div class="info_area total">
									<div class="info">
										<strong class="tit">결제예정금액</strong>
									</div>
									<strong class="price">${planePayReturn.total}<span>원</span></strong>
									<div class="mileage_save">
										<p class="txt">유류할증료/제세공과금 포함</p>
										<!---->
									</div>
								</div>
								<div class="info_area">
									<div class="info">
										<strong class="tit">총 상품금액</strong> <span class="lastP">${planePayReturn.total}원</span>
									</div>
								</div>
								<!---->
								<!---->
							</div>
							<!---->
						</div>
						<div class="text_wrap mt10">
							<p class="ml20 mr10">스카이스캐너는 개별 항공권 단독 판매에 대하여 통신판매중개자로서
								통신판매의 당사자가 아니며 해당 상품의 거래정보 및 거래 등에 대해 책임을 지지 않습니다.</p>
						</div>
						
						<div class="btn_wrap">
							<button id= "b1" onclick="btnClick()"  class="btn big pink full">예약하기</button>
						</div>
					
					</div>
					</div>
					
				</div>
				<!---->
			</div>
		</div>
	</form>
	<!-- footer start -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- footer end -->
</body>
</html>