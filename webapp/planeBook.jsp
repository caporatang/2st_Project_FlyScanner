<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	//String id = request.getParameter("id");
	String id =(String)session.getAttribute("fId");
	String ticketNo = request.getParameter("ticketNo");
	int ticketPrice = Integer.parseInt(request.getParameter("ticketPrice"));
	String ticketSt = request.getParameter("ticketSt");
	String ticketSp = request.getParameter("ticketSp");
	String stDate = request.getParameter("stDate");
	String spDate = request.getParameter("spDate");
	int people = Integer.parseInt(request.getParameter("people"));
	
	int total = ticketPrice * people;
	
	String stm = stDate.substring(0, 10);
	String sth = stDate.substring(12, 16);
	
	String spm = spDate.substring(0, 10);
	String sph = spDate.substring(12, 16);
	
	// 예약번호생성
		SimpleDateFormat sdf2 = new SimpleDateFormat("HHmmss");
	    Date day = new Date();
	    String no1 = sdf2.format(day);
	    System.out.println(no1 + "@@@ 예약번호앞@@@");
	 			// 0-9를 제외한 문자 제거
		String no2 = ticketNo.replaceAll("[^0-9]", ""); 
	 			// 예약번호 = 현재시간 + 티켓No의 일부
		String planeBookNo = "P" + no1 +"b" + no2;
		System.out.println(no2 + "추출!@@@예약번호@@완료" );
	    System.out.println(planeBookNo+ "예약번호@@완료" );
	%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/planeBook.css">

</head>
<body>
<!-- 헤더 start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 헤더 end -->
	<div id="container" style="height: 900px;">
		<div class="inr">
			<div id="contents" class="contents">
				<div class="text_wrap big">
					<strong class="tit">예약하기</strong>
				</div>
				<div class="ly_wrap pay_info book_step1">
					<div class="inr">
						<div class="text_wrap big mb0 mt40">
							<strong class="tit"><span class="icn air to">가는
									항공편</span>
								<div class="route_detail">
									<div class="route">
										<strong><%= ticketSt %></strong> <span class="move_arrow">편도</span> <strong>
										<%= ticketSp %>	</strong>
									</div>
								</div></strong>
						</div>
						<div class="flight_list">
							<ul>
								<li><div class="row">
										<div class="cell air">
											<p class="air_name">
												<img
													src="https://image.hanatour.com/usr/static/im	g/airline/KL.png"
													title="" data-src="" alt="">KLM
											</p>
											<p class="txt"><%= ticketNo %></p>
											<!---->
										</div>
										<div class="cell type">
											<div class="item_course">
												<div class="time">
													<span class="date"><%=stDate.substring(0, 10)%></span><%=stDate.substring(12, 16)%>  <span
														class="city"><em>인천 국제공항 - 터미널 1</em></span>
												</div>
												<div class="move_arrow">
													<p class="wait">
														<span class="tooltip text">경유 1회 <span
															class="tooltiptext"><span>도하 국제공항 경유 2시간 5분</span></span></span>
													</p>
													<p class="load">19시간 30분</p>
												</div>
												<div class="time">
													<span class="date"><%=spDate.substring(0, 10)%></span> <%=spDate.substring(12, 16)%>
													<!---->
													<span class="city"><em>히드로 공항 - 터미널 5</em></span>
												</div>
											</div>
										</div>
										<div class="cell seat">
											<p>성인<%= people %></p>
											<p>일반석</p>
										</div>
										<div class="cell luggage">
											<p>수하물 포함</p>
											<p>25kg</p>
										</div>
									</div></li>
							</ul>
						</div>
						
						
						<ul class="list_bul billiard">
							<li>유류할증료/제세공과금은 항공사 사정 및 환율변동에 의해 매일 변경되며 발권 당일 환율에 따라
								적용됩니다.</li>
							<li>여행사 발권대행 수수료는 항공료에 포함되며, 항공권 예약,상담,발권 업무의 서비스를 탑승자에게
								제공하고 서비스의 대가로 받는 취급수수료입니다.</li>
							<li>신용카드 결제 시 발권대행 수수료 금액은 항공권 결제 후 플라이스캐너로 별도 승인됩니다.</li>
							<li>발권대행 수수료는&nbsp;<em>10,000원</em>이 적용됩니다.(1인 기준)
							</li>
							<li>결제된 발권대행 수수료는 환불 되지 않습니다.</li>
						</ul>
						<div class="box_group">
							<div class="text_wrap sml mt0">
								<strong class="tit">유의사항</strong>
							</div>
							<ul class="list_bul disc gr">
								<li>출국 전 경유 및 목적지 국적의 비자 필요 여부를 반드시 직접 확인하여 출국 시 문제가 되지 않도록
									비자를 준비하셔야 합니다.&nbsp;비자 미소지로 출국 또는 해당 국적의 입국이 거절될 경우 발생하는 문제 및
									그에 따른 발생 비용이나 항공권 환불수수료는 당사에서 책임지지 않습니다.</li>
								<li>편도 여정으로 항공권을 구입하실 경우, 입국 국적의 비자를 반드시 소지하셔야 합니다. 비자를
									소지하지 않는 경우에는 해당국적으로의 출국이 거부될 수 있습니다. (일부 국적은 복편의 항공권을 소지하지 않으면
									탑승수속이 거절될 수 있으니 유의하시기 바랍니다.)</li>
								<li>무비자 입국이 가능한 나라도 편도 항공권으로 입국은 불가하니, 해당 국적 대사관을 통해 입국 조건을
									미리 확인하시기 바랍니다.<br>유류할증료/제세공과금은 항공사 사정 및 환율변동에 의해 매일 변경되며
									발권 당일 환율에 따라 적용됩니다.
								</li>
								<li>항공권 취소수수료는 항공사마다 규정이 상이하므로, 해당운임의 요금규정을 반드시 확인하시기 바랍니다.</li>
								<li>환불소요기간은 항공사와의 확인 및 보고 절차 이외에 고객님의 결제방법(현금/카드)으로 인해 접수된
									날짜로부터 30~50일정도 소요됩니다.<br>(항공사, 카드사별로 상이함)
								</li>
								<li>환불이 가능한 항공권일 경우 요금규정에 기재되어 있는 항공권 취소수수료 외에 항공업무대행수수료는
									별도로 부과됩니다.</li>
								<li>천재지변으로 인한 결항으로 탑승을 못하셨을 경우 환불절차는 별도로 담당자에게 요청하셔야 합니다.</li>
								<li>탑승이 완료된 항공권은 소급환불 및 카드 변경이 불가합니다.</li>
							</ul>
						</div>
						<div class="btn_wrap">
						<form action="planeBook2.do">
			<button  class="btn big pink">다음단계</button>
					<input type="hidden" name="ticketNo"  value="<%= ticketNo %>">
					<input type="hidden" name="ticketSt"  value="<%= ticketSt %>">
					<input type="hidden" name="ticketSp"  value="<%= ticketSp %>">
					<input type="hidden" name="stDate"  value="<%= stDate %>">
					<input type="hidden" name="spDate"  value="<%= spDate %>">
					<input type="hidden" name="people"  value="<%= people %>">
					<input type="hidden" name="total"  value="<%= total %>">
					<input type="hidden" name="id"  value="<%= id %>">
					<input type="hidden" name="planeBookNo"  value="<%= planeBookNo %>">
					<input type="hidden" name="stm"  value="<%= stm %>">
					<input type="hidden" name="sth"  value="<%= sth %>">
					<input type="hidden" name="spm"  value="<%= spm %>">
					<input type="hidden" name="sph"  value="<%= sph %>">
					
	
	
			</form>
			
						</div>
					</div>
					<div class="inr right" style="right: auto; left: 0px;">
						<div class="text_wrap mid">
							<strong class="tit">상품 결제 정보</strong>
						</div>
						<div class="js_acc multi filter_wrap">
							<div class="pay_area lineb">
								<div class="info_area total">
									<div class="info">
										<strong class="tit">결제예정금액</strong>
									</div>
									<strong class="price"><%= total %><span>원</span></strong>
									<div class="mileage_save">
										<p class="txt">유류할증료/제세공과금 포함</p>
										<!---->
									</div>
								</div>
								<div class="info_area">
									<div class="info">
										<strong class="tit">총 상품금액</strong> <span><%= total %>원</span>
									</div>
								</div>
							</div>
						</div>

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