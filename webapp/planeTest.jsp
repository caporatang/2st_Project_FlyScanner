

<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  
    String start = "2021-09-06 13:00:05";
    String end = "2021-09-12 15:00:05";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date sDate = sdf.parse(start);		
    Date eDate = sdf.parse(end);
    
    long ddd = eDate.getTime() - sDate.getTime();
    long difDate = ddd / (24 * 60 * 60 * 1000);
    
   // System.out.print(difDate);
    
   System.out.print(start.substring(0, 4));
   
   String no1 = start.replaceAll("[^\\d]", ""); 
   System.out.print(no1+ "@@@@@@ 숫자나누기 !!!!@@");
   String no2 = no1.substring(5, 8);
   System.out.print(no2 + "@@@@@ 나눈숫자 @@@@");	   
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="planeBook.do" >
아이디 : <input name="id" value="aaaaa">
항공권번호 : <input name="ticketNo" value="koreng001">
항공권가격  : <input name="ticketPrice" value="60000">
출발지역 :<input name="ticketSt" value="한국">
도착지역 :<input name="ticketSp" value="영국">
출발날짜 :<input name="stDate" value="2021-09-06 13:00:05">
도착날짜 :<input name="spDate" value="2021-09-08 13:00:05" >
인원수 <input name="people" value="2">



	
	<button>예약하러가기</button></form>
	
	날짜차이 <%= difDate %>
	 글자나누기<%=start.substring(0, 10)%>, 글자나누기2<%=start.substring(12, 16)%>
</body>
</html>