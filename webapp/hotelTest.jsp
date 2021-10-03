

<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  String id = "aaaaa";
    String start = "2021-09-06 13:00:05";
    String end = "2021-10-12 15:00:05";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date sDate = sdf.parse(start);		
    Date eDate = sdf.parse(end);
    
    long ddd = eDate.getTime() - sDate.getTime();
    long difDate = ddd / (24 * 60 * 60 * 1000);
    
    // 테스트
    session.setAttribute("id", id);
    
   // System.out.print(difDate);
   
   // 세션
   
   
    SimpleDateFormat sdf2 = new SimpleDateFormat("HHmmss");
   Date day = new Date();
   String no1 = sdf2.format(day);
   System.out.println(no1 + "@@@ 예약번호");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="hotelBook.do" >
아이디 : <input name="id" value="test">
호텔 아이디 : <input name="hId" value="173-65-57913">
호텔이름 : <input name="hName" value="런던호텔">
지역  : <input name="hRegion" value="영국 그레이터 런던">
체크인 :<input name="checkIn" value="2021-09-06 13:00:05">
체크아웃 :<input name="checkOut" value="2021-10-12 13:00:05">
투숙객수 :<input name="guestNum" value="2">
객실정보 :<input name="roomSort" value="스탠다드" >
객실 <input name="standPrice" value="70000">
<input name="standNum" value="5">

	<button>예약하러가기</button></form>
	
	날짜차이 <%= difDate %>
</body>
</html>