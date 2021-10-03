<%@page import="com.fly.pro2.DTO.HotelBookDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/hotelPayS.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">



// div 영역 프린트하기
var win=null;
function print(printThis)
{
	  win = window.open();
	  self.focus();
	  win.document.open();
	  win.document.write('<html><head><title>예약 확인 프린트하기</title>');
	  win.document.write('<link rel="stylesheet" href="resources/css/hotelPayS.css">');
	  win.document.write('</head><body>');
	  win.document.write(printThis);
	  win.document.write('</body></html>');
	  win.document.close();
	  win.print();
	  win.close();
}

function del() {
	win.close();
}
	
</script>
</head>
<body class="chrome" data-n-head="class" style="">
			
			<div id="container" >
			<div id="printDiv">
					<div class="inr">
						<!---->
						<div id="contents" class="contents fontCtrl">
							<div class="text_wrap big">
								<strong class="tit">예약 확인하기</strong>
							</div>
								<div class="ly_wrap pay_info">
									<div class="inr">
										<div class="text_wrap mid">
											<strong class="tit">${hotelPayS.hName}</strong>
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
															<td>${hotelPayS.hRegion}</td>
														</tr>
														<tr>
															<th>체크인/체크아웃</th>
															<td><div class="item_course">
																	${hotelPayS.checkIn} / ${hotelPayS.checkOut} <span class="divider_dot"></span>
																</div></td>
														</tr>
														<tr>
															<th>객실1 정보</th>
															<td>${hotelPayS.roomSort} <span
																class="divider_dot"><span>성인${hotelPayS.guestNum}</span> <!----></span></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="text_wrap mid">
												<strong class="tit">예약번호(${hotelPayS.hotelBookNo})</strong>
											</div>
											<div>
												<div class="tbl">
													<div class="text_wrap type sml">
														<strong class="tit">객실 1<span class="divider_dot"></span><em>성인
															${hotelPayS.guestNum}</em></strong>
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
																	class="inpt_text w250" id = "kName" name= "kName" value="${hotelPayS.kName}" readonly>
																	<!----></td>
															</tr>
															<tr>
																<th>생년월일</th>
																<td><input type="text"
																	 class="inpt_text w250" id = "birth" value="${hotelPayS.birth}" readonly> <!----></td>
																<th>성별</th>
																<td><input type="text"
																	 class="inpt_text w250" id = "gender" value="${hotelPayS.gender}" readonly> <!----></td>
																	
															</tr>
															<tr>
																<th>영문 성</th>
																<td><input type="text"
																	class="inpt_text w250" id = "eFirth"  name= "eFirth" value="${hotelPayS.eFirth}" readonly> <!----></td>
																<th>영문 이름</th>
																<td><input type="text"
																	class="inpt_text w250" id = "eLast"  name= "eLast" value="${hotelPayS.eLast}" readonly>
																	<!----></td>
															</tr>
															<tr>
																<th>휴대폰 번호</th>
																<td><input type="text"
																	class="inpt_text w250" id = "tel"  name= "tel" value="${hotelPayS.tel}" readonly> <!----></td>
																<th>이메일</th>
																<td><input type="text"
																	class="inpt_text w250" id = "email"  name= "email" value="${hotelPayS.email}" readonly> <!----></td>
															</tr>
														</tbody>
														
													</table>
													
													
												</div>
											</div>
											<!---->
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