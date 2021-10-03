<%@page import="com.fly.pro2.DTO.HotelBookDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	// 각 파라메터 값 받기
	
	
	//String id =(String)session.getAttribute("fId");
	String id = request.getParameter("id");
	String hId = request.getParameter("hId");
	String hName = request.getParameter("hName");
	String hRegion = request.getParameter("hRegion");
	String checkIn = request.getParameter("checkIn");
	String checkOut = request.getParameter("checkOut");
	int guestNum = Integer.parseInt(request.getParameter("guestNum"));
	String roomSort = request.getParameter("roomSort");
	int standPrice = Integer.parseInt(request.getParameter("standPrice"));
	int stdNum = Integer.parseInt(request.getParameter("stdNum"));
	
	// 날짜 차이 계산
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	    Date sDate = sdf.parse(checkIn);		
	    Date eDate = sdf.parse(checkOut);
    
	    long dif = eDate.getTime() - sDate.getTime();
	    long difDate = dif / (24 * 60 * 60 * 1000);
	    
	    System.out.print(difDate);

	// 총 금액 계산
	long total = standPrice * guestNum * difDate;
	
	// 예약번호생성
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyMMdd");
    Date day = new Date();
    String no1 = sdf2.format(day);
    System.out.println(no1 + "@@@ 예약번호앞@@@");
 			// 0-9를 제외한 문자 제거
	String no2 = hId.replaceAll("[^\\d]", ""); 
 			// 예약번호 = 현재시간 + 호텔id의 일부
	String hotelBookNo = "H" + no1 + "b" + no2.substring(4);
    System.out.println(hotelBookNo + "예약번호@@완료" );
	%>
	
	
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/hotelBook.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">




</script>
</head>
<body class="chrome" data-n-head="class" style="">
<!-- 헤더 start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 헤더 end -->
			<form id = "send" action= "hotelBook2.do">
			<div id="container" style="height: 900px;">
					<div class="inr">
						<!---->
						<div id="contents" class="contents fontCtrl">
							<div class="text_wrap big">
								<strong class="tit">예약하기</strong>
							</div>
								<div class="ly_wrap pay_info">
									<div class="inr">
										<div class="text_wrap mid">
											<strong class="tit"><%=hName%></strong>
										</div>
									<div class="tbl">
										<table class="type2">
											<colgroup>
												<col style="width: 17%;">
												<col>
											</colgroup>
												<tbody>
														<tr>
															<th>주소</th>
															<td><%= hRegion %></td>
														</tr>
														<tr>
															<th>체크인/체크아웃</th>
															<td><div class="item_course">
																	<%= checkIn %> / <%= checkOut %> <span class="divider_dot"></span><%= difDate %>박
																</div></td>
														</tr>
														<tr>
															<th>객실1 정보</th>
															<td><%= roomSort %> <span
																class="divider_dot"><span>성인<%= guestNum %></span> <!----></span></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="text_wrap mid">
												<strong class="tit">투숙자 정보</strong>
											</div>
											<div>
												<div class="tbl">
													<div class="text_wrap type sml">
														<strong class="tit">객실 1<span class="divider_dot"></span><em>성인
															<%= guestNum %></em></strong>
													</div>
													<table class="type2">
														<colgroup>
															<col style="width: 17%;">
															<col style="width: 33%;">
															<col style="width: 17%;">
															<col style="width: 33%;">
														</colgroup>
													
														<tbody>
															<tr>
																<th>성명(한글)</th>
																<td colspan="3"><input type="text"
																	placeholder="한글성명(ex. 윤정훈)" class="inpt_text w250" id = "kName" name= "kName" value="">
																	<!----></td>
															</tr>
															<tr>
																<th>생년월일</th>
																<td><input type="text"
																	placeholder="법정 생년월일(ex. 19981115)" maxlength="8"
																	class="inpt_text w250" id = "birth" name = "birth"> <!----></td>
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
																<td><input type="text" placeholder="영문 성(ex. YOOM)"
																	class="inpt_text w250" id = "eFirth"  name= "eFirth" value=""> <!----></td>
																<th>영문 이름</th>
																<td><input type="text"
																	placeholder="영문 이름(ex. JEONGHUN)" class="inpt_text w250" id = "eLast"  name= "eLast" value="">
																	<!----></td>
															</tr>
															<tr>
																<th>휴대폰 번호</th>
																<td><input type="text"
																	placeholder="휴대폰 번호(ex. 01012345678)" maxlength="11"
																	class="inpt_text w250" id = "tel"  name= "tel" value=""> <!----></td>
																<th>이메일</th>
																<td><input type="text"
																	placeholder="이메일 주소(ex. sample@gmail.com)"
																	class="inpt_text w250" id = "email"  name= "email" value=""> <!----></td>
															</tr>
														</tbody>
														
													</table>
													
													<input type="hidden" name="hName"  value="<%= hName %>">
													<input type="hidden" name="hRegion"  value="<%= hRegion %>">
													<input type="hidden" name="checkIn"  value="<%= checkIn %>">
													<input type="hidden" name="checkOut"  value="<%= checkOut %>">
													<input type="hidden" name="guestNum"  value="<%= guestNum %>">
													<input type="hidden" name="roomSort"  value="<%= roomSort %>">
													<input type="hidden" name="total"  value="<%= total %>">
													 <input type="hidden" name="coupon"  value="0"> 
													 <input type="hidden" name="hotelBookNo"  value="<%= hotelBookNo %>"> 
													 <input type="hidden" name="hId"  value="<%= hId %>"> 
													 <input type="hidden" name="id"  value="<%= id %>">
													 <input type="hidden" name="stdNum"  value="<%= stdNum %>">
													
												</div>
											</div>
											<!---->
											<div class="btn_wrap">
												<!---->
												<button  id = "b1" onclick="btnClick()" class="btn big pink" >다음단계</button>											</div>
										</div>
										<div class="inr right" style="right: auto; left: 0px;">
											<div class="text_wrap mid">
												<strong class="tit">결제 정보</strong>
											</div>
											<div class="js_acc multi filter_wrap">
												<div class="pay_area">
													<div class="info_area total">
														<div class="info">
															<strong class="tit">최종 결제 금액</strong> <span>성인 <%= guestNum %></span> <span
																class="divider_dot">아동 0</span>
														</div>
														
														<strong class="price"><%= total %><span>원</span></strong>
														
													</div>
													<div class="info_area">
														<div class="info">
															<strong class="tit">총 상품 금액</strong> <span><%= total %>원</span>
														</div>
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</form>
				<!-- footer start -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- footer end -->
</body>
</html>