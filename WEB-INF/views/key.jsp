<%@page import="com.fly.pro2.DTO.HotelDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//test 검색결과 없을 때 테이블 로우 없애기...div id="table"부분을 없애고 싶은데 안 되네...
// $(function() {
// 	if ($('#table').val() == null) {
// 		$('#table').hide();
// 	}	
// })
</script>
</head>
<body>
<!-- model.속성으로 지정한 것은 $로 쓸 수 있다. -->
<%-- 전체 프린트: ${list}<br> --%>
<%-- 키워드의 이미지 프린트: ${list2} --%>

<!-- 검색 결과 개수 표시 -->
<!-- position: absolute;를 줬는데 듀얼에서 확인하기 -->
<div align="left" style="margin-left: 220px; margin-bottom: 10px; font-weight: bold">
	검색한 조건 내 호텔 ${list.size()}곳을 찾았습니다.
</div>

<div id="table">
<table border=1>
	<tr bgcolor="#0A82FF" align="center" style="color: white; height: 50px">
<!-- 		<td width="100">사업자번호</td> -->
		<td width="300">이미지</td>
		<td width="200">호텔명</td>
		<td width="150">평점</td>
		<td width="200">주소</td>
		<td width="150">스탠다드 가격</td>
		<td width="150">스탠다드 객실수</td>
		<td width="100">객실 선택</td>
	</tr>
<!-- line3에 jstl을 넣어서 자바 문법을 태그로 쓸 수 있다! -->
<%-- items=리스트가 받아올 배열명, var=for문 내에서 사용할 변수, varStatus=상태용 변수 --%>
<!-- status는 for문이 돌아가는 상태 체크. status.index는 0부터의 순서(0,1,2..로 나오는듯) -->
<c:forEach items="${list}" var="bag" varStatus="status">
	<tr align="center">
		<td width="100"><img src="resources/img/hotel/${list2[status.index]}" width="300" height="150"></td>
			<!-- jstl에서 변수를 2개 이상 사용하고싶을 때 -->
		<td width="100">${bag.hname}</td>
		<td width="150">
		<%
			HotelDTO dto = (HotelDTO)pageContext.getAttribute("bag"); //pageContext: jsp의 내장객체
			String hid = dto.getHid();
			//out.print(hid);
			char c = hid.charAt(11);
			int c2 = Integer.parseInt(String.valueOf(c));
		%>
			<% for (int i = 0; i < c2; i++) { %>
				<img src="resources/img/hotel/star.jpg" width="20" height="20">
			<% } %>
		</td>
		<td width="100">${bag.hregion}</td>
		<td width="100">${bag.stdprice}</td>
		<td width="100">${bag.stdnum}</td>
		<td width="100">
<%-- 			<a href="htDetail.jsp?hid=${bag.hid}"> --%>
			<a href="htDetail.jsp?hid=${bag.hid}&himage=${list2[status.index]}&checkin=${checkin}&checkout=${checkout}
				&stdnum=${stdnum}&guestnum=${guestnum}&htlat=${bag.htlat}&htlong=${bag.htlong}">
				<button style="background: #FE5C24; color: white; border:none; padding: 5px">객실 선택</button>
			</a>
		</td>
	</tr>
</c:forEach>
</table>
</div>
<%-- ${list2}<br> --%>
<%-- ${list2[status.index]}<br> --%>
</body>
</html>