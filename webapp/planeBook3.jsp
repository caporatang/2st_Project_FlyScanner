<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/planeBook3.css">
</head>
<body>
	<div id="container">
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
												class="inpt_text w250"> <!----></td>
											<th>생년월일</th>
											<td><input type="text" placeholder="법정 생년월일(ex.1998115)"
												class="inpt_text w250"> <!----></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="text"
												placeholder="이메일 주소(ex.sample@gmail.com)"
												class="inpt_text w250"> <!----></td>
											<th>휴대폰 번호</th>
											<td><input type="text"
												placeholder="휴대폰번호(ex.01012345678)" class="inpt_text w250">
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
												placeholder="한글이름(ex.윤정훈)" class="inpt_text w250"> <!----></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td><input type="text" placeholder="법정 생년월일(ex.1998115)"
												class="inpt_text w250"> <!----></td>
											<th>성별</th>
											<td><div class="form_wrap">
													<span class="form_holder radio"><input type="radio"
														name="genderM1" id="genderM1" value="M" class="inpt_radio">
														<label for="genderM1" class="label_radio">남성</label></span> <span
														class="form_holder radio"><input type="radio"
														name="genderF1" id="genderF1" value="F" class="inpt_radio">
														<label for="genderF1" class="label_radio">여성</label></span>
													<!---->
												</div></td>
										</tr>
										<tr>
											<th>영문 성</th>
											<td><input type="text" placeholder="영문 성(ex. YOON)"
												class="inpt_text w250"> <!----></td>
											<th>영문 이름</th>
											<td><input type="text" placeholder="영문 이름(ex. JEONGHUN)"
												class="inpt_text w250"> <!----></td>
										</tr>
										<tr>
											<th>휴대폰 번호</th>
											<td><input type="text"
												placeholder="휴대폰번호(ex.01012345678)" class="inpt_text w250">
												<!----></td>
											<th>이메일</th>
											<td><input type="text"
												placeholder="이메일 주소(ex.sample@gmail.com)"
												class="inpt_text w250"> <!----></td>
										</tr>
										<!---->
									</tbody>
								</table>
							</div>
							<!---->
							<div id="psrlistDiv2" class="text_wrap type sml">
								<strong class="tit">탑승자 정보 2 (성인)</strong>
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
												placeholder="한글이름(ex.윤정훈)" class="inpt_text w250"> <!----></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td><input type="text" placeholder="법정 생년월일(ex.1998115)"
												class="inpt_text w250"> <!----></td>
											<th>성별</th>
											<td><div class="form_wrap">
													<span class="form_holder radio"><input type="radio"
														name="genderM1" id="genderM1" value="M" class="inpt_radio">
														<label for="genderM1" class="label_radio">남성</label></span> <span
														class="form_holder radio"><input type="radio"
														name="genderF1" id="genderF1" value="F" class="inpt_radio">
														<label for="genderF1" class="label_radio">여성</label></span>
													<!---->
												</div></td>
										</tr>
										<tr>
											<th>영문 성</th>
											<td><input type="text" placeholder="영문 성(ex. YOON)"
												class="inpt_text w250"> <!----></td>
											<th>영문 이름</th>
											<td><input type="text" placeholder="영문 이름(ex. JEONGHUN)"
												class="inpt_text w250"> <!----></td>
										</tr>
										<tr>
											<th>휴대폰 번호</th>
											<td><input type="text"
												placeholder="휴대폰번호(ex.01012345678)" class="inpt_text w250">
												<!----></td>
											<th>이메일</th>
											<td><input type="text"
												placeholder="이메일 주소(ex.sample@gmail.com)"
												class="inpt_text w250"> <!----></td>
										</tr>
										<!---->
									</tbody>
								</table>
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
							
							<div class="text_wrap mid check">
								<strong class="tit">약관동의</strong> <span class="right_cont"><span
									class="form_holder check"><input type="checkbox"
										id="checkAll" class="inpt_checkbox"> <label
										for="checkAll" class="label_checkbox">모든 약관에 동의합니다.</label></span></span>
							</div>
							<div class="js_acc clearfix line">
								<div class="inr">
									<div class="holder">
										<a href="#ruleItnr" class="header"></a> <span class="option">요금규정
											안내 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="ruleItnr" id="ruleItnr_1" value="Y"
												class="inpt_checkbox"> <label for="ruleItnr_1"
												class="label_checkbox">동의합니다</label></span> <span
												class="form_holder radio"><input type="radio"
												name="ruleItnr" id="ruleItnr_2" value="N"
												class="inpt_checkbox"> <label for="ruleItnr_2"
												class="label_checkbox">동의하지 않습니다</label></span>
										</div>
									</div>
									
								</div>
								<div class="inr">
									<div class="holder">
										<a href="#rule57" class="header"></a> <span class="option">개인정보
											수집 및 이용 동의 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="rule57" id="rule57_1" value="Y" class="inpt_checkbox">
												<label for="rule57_1" class="label_checkbox">동의합니다</label></span> <span
												class="form_holder radio"><input type="radio"
												name="rule57" id="rule57_2" value="N" class="inpt_checkbox">
												<label for="rule57_2" class="label_checkbox">동의하지
													않습니다</label></span>
										</div>
									</div>
									
								</div>
								<div class="inr">
									<div class="holder">
										<a href="#rule58" class="header"></a> <span class="option">고유식별정보
											수집 및 처리 동의 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="rule58" id="rule58_1" value="Y" class="inpt_checkbox">
												<label for="rule58_1" class="label_checkbox">동의합니다</label></span> <span
												class="form_holder radio"><input type="radio"
												name="rule58" id="rule58_2" value="N" class="inpt_checkbox">
												<label for="rule58_2" class="label_checkbox">동의하지
													않습니다</label></span>
										</div>
									</div>
									
								</div>
								<div class="inr">
									<div class="holder">
										<a href="#rule59" class="header"></a> <span class="option">개인정보
											제3자 제공 동의 <span class="opt">(필수)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="rule59" id="rule59_1" value="Y" class="inpt_checkbox">
												<label for="rule59_1" class="label_checkbox">동의합니다</label></span> <span
												class="form_holder radio"><input type="radio"
												name="rule59" id="rule59_2" value="N" class="inpt_checkbox">
												<label for="rule59_2" class="label_checkbox">동의하지
													않습니다</label></span>
										</div>
									</div>
									
								</div>
								
								
							
						
							</div>
							
								<div class="text_wrap mid ">
								<strong class="tit">기내식 선택</strong>
							</div>
							<div class="js_acc clearfix line">
								<div class="inr">
									<div class="holder">
										<a href="#ruleItnr" class="header"></a> <span class="option">기내식선택
											 <span class="opt">(선택)</span>
										</span>
										<div class="right_cont">
											<span class="form_holder radio"><input type="radio"
												name="ruleItnr" id="ruleItnr_1" value="Y"
												class="inpt_checkbox"> <label for="ruleItnr_1"
												class="label_checkbox">선택합니다</label></span> <span
												class="form_holder radio"><input type="radio"
												name="ruleItnr" id="ruleItnr_2" value="N"
												class="inpt_checkbox"> <label for="ruleItnr_2"
												class="label_checkbox">선택하지 않습니다</label></span>
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
					</div>
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
									<strong class="price">2,196,000<span>원</span></strong>
									<div class="mileage_save">
										<p class="txt">유류할증료/제세공과금 포함</p>
										<!---->
									</div>
								</div>
								<div class="info_area">
									<div class="info">
										<strong class="tit">총 상품금액</strong> <span>2,196,000원</span>
									</div>
								</div>
								<!---->
								<!---->
							</div>
							<!---->
						</div>
						<div class="text_wrap mt10">
							<p class="ml20 mr10">스카이스캐너는 개별 항공권 단독 판매에 대하여 통신판매중개자로서 통신판매의
								당사자가 아니며 해당 상품의 거래정보 및 거래 등에 대해 책임을 지지 않습니다.</p>
						</div>
						<div class="btn_wrap">
							<a href="#none" class="btn big pink full">예약하기</a> 
						</div>
					</div>
				</div>
				<!---->
			</div>
		</div>
	</div>
</body>
</html>