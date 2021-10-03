<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String stDate = request.getParameter("stDate");
	String spDate = request.getParameter("spDate");
	System.out.println("@@@@@ 데이트@@@@" + stDate);
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/planeBookResult.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

//div 영역 프린트하기
var win=null;
function print(printThis)
{
  win = window.open();
  self.focus();
  win.document.open();
  win.document.write('<html><head><title>예약 확인 프린트하기</title>');
  win.document.write('<link rel="stylesheet" href="resources/css/planeBookResult.css">');
  win.document.write('</head><body>');
  win.document.write(printThis);
  win.document.write('</body></html>');
  win.document.close();
  win.print();
  win.close();
}

</script>

</head>
<body>
	
	
	<div id="printDiv">
	<div id="container" >

	
		<div class="inr">
			<!---->
			<div id="contents" class="contents fontCtrl">
				<div class="text_wrap big">
					<strong class="tit">예약정보 확인</strong>
				</div>
					<div class="ly_wrap pay_info book_step1">
					<div class="inr">
						<div class="text_wrap big mb0 mt40">
							<strong class="tit"><span class="icn air to">가는
									항공편</span>
								<div class="route_detail">
									<div class="route">
										<strong>${planePayS.ticketSt}</strong> <span class="move_arrow">편도</span> <strong>
										${planePayS.ticketSp}</strong>
									</div>
								</div></strong>
						</div>
						<div class="flight_list">
							<ul>
								<li><div class="row">
										<div class="cell air">
											<p class="air_name">
												<img
													src="https://image.hanatour.com/usr/static/img/airline/KL.png"
													title="" data-src="" alt="">KLM
											</p>
											<p class="txt">${planePayS.ticketNo}</p>
											<!---->
										</div>
										<div class="cell type">
											<div class="item_course">
												<div class="time">
													<span class="date">${planePayS.stm}</span>${planePayS.sth} 
													<span class="city"><em>인천 국제공항 - 터미널 1</em></span>
												</div>
												<div class="move_arrow">
													<p class="wait">
														<span class="tooltip text">경유 1회 <span
															class="tooltiptext"><span>도하 국제공항 경유 2시간 5분</span></span></span>
													</p>
													<p class="load">19시간 30분</p>
												</div>
												<div class="time">
													<span class="date">${planePayS.spm}</span> ${planePayS.sph}
													<!---->
													<span class="city"><em>히드로 공항 - 터미널 5</em></span>
												</div>
											</div>
										</div>
										<div class="cell seat">
											<p>성인${planePayS.people}</p>
											<p>일반석</p>
										</div>
										<div class="cell luggage">
											<p>수하물 포함</p>
											<p>25kg</p>
										</div>
									</div></li>
							</ul>
						</div>
					
				
				
				<div class="ly_wrap pay_info">
					<div class="inr">
						<div class="cont_unit">
							<div id="reservationInfo" class="text_wrap mid">
								<strong class="tit">예약자 정보(예약번호)</strong>
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
											<td><input type="text" 
												class="inpt_text w250" id = name readonly value="${planePayS.kName}"> <!----></td>
											<th>생년월일</th>
											<td><input type="text" 
												class="inpt_text w250" id = birth readonly value="${planePayS.birth}"> <!----></td>
										</tr>
										<tr>
											<th>성별</th>
											<td><input type="text"
												
												class="inpt_text w250" id = gender readonly value="${planePayS.gender}"> <!----></td>
											<th>이메일</th>
											<td><input type="text"
												class="inpt_text w250" id = email readonly value="${planePayS.email}">
												<!----></td>
										</tr>
										
										<tr>
											<th>영문 성</th>
											<td><input type="text"
												class="inpt_text w250" id = eFirth readonly value="${planePayS.eFirth}"> <!----></td>
											<th>영문 이름</th>
											<td><input type="text"
												 class="inpt_text w250" id = eLast readonly value="${planePayS.eLast}">
												<!----></td>
										</tr>
										<!---->
									</tbody>
								</table>
							</div>
							
					</div>
				</div>
				<!---->
			</div>
			<div class="btn_wrap">
												<!---->
												<a href="javascript:print(document.getElementById('printDiv').innerHTML)" type="button" id ="b1" onclick="btnClick()" class="btn big pink" >프린트하기</a>	
												<a href="#" type="button" id ="b2"  onclick="javascript:window.close();" class="btn big pink" >나가기</a>										
												</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>