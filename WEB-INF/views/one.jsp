<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <!--달력 css  -->
   <!--제이쿼리 ui css-->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <!--제이쿼리 js-->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <!--제이쿼리 ui js-->
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <!--달력 script  -->
   <script>
      $(function(){
         //날짜 
         $("#btn_1").click(function() {
            $("#result").empty()
            var conList = []
            var themeList = []
   
            $("input[name='continent']:checked").each(function(){
               conList.push($(this).val())
               })
               
            $("input[name='theme']:checked").each(function(){
               themeList.push($(this).val())
               })
            
            $.ajax({
               url: "menu_recommend/searching.jsp",
               data: {
                  continent: conList,
                  theme: themeList
               },
               traditional: true,
               success : function(data) {
                  list = data.split(',')
   
                  for(var i=0; i < list.length-1; i++) {
                     $("#result").append("<button id='btnCountry'>"+list[i]+"</button>&nbsp;&nbsp;")
                  }
               }
            })
         })
         
         //출발 날짜
         $("#SPDATE").datepicker({
            dateFormat: "yy-mm-dd",
            changeYear: true,
            changeMonth: true,
            minDate: 0,
            maxDate: "+10m +10w",
            onClose: function (selectedDate) {
               $("#STDATE").datepicker("option", "minDate", selectedDate);
            }
         });
         //도착날짜
         $("#STDATE").datepicker({
            dateFormat: "yy-mm-dd",
            changeYear: true,
            changeMonth: true,
            minDate: 0,
            maxDate: "+10m +10w",
            onClose: function (selectedDate) {
               $("#SPDATE").datepicker("option", "maxDate", selectedDate);
            }
         });
   
      });
   </script>
</head>
<body>
<jsp:include page ="header.jsp"></jsp:include>
<!-- 예약 파트 시작-->
    <section class="booking_part" style="margin-top: 80px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu">
								<!-- <h1>항공권</h1>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="hotel-tab" data-toggle="tab" href="#hotel" role="tab" aria-controls="hotel" aria-selected="true">항공권</a>
                            </li>
                        </ul> -->
                        
                    </div>
                </div>
                 <div class="col-lg-12">
                    <div class="booking_content" style="margin-top: 30px;">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="tiket" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                     <form action="one">
                                         <div class="form-row">
                                             <div class="form_colum">
                                      <input name="ticketst" class="nc_select"  placeholder= "출발 국가" > 
                                            </div>
                                 
                                     <div class="form_colum">
                                     <input name="ticketsp" class="nc_select"  placeholder= "도착 국가" > 
                                            </div>
                                            
                                            <div class="form_colum">
                                                <div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable">
                                                <input id="SPDATE" name="stdate" placeholder="출발 날짜" data-type="datepicker1" data-guid="4df0005c-3725-c600-3c40-f07654cc7355" data-datepicker="true" class="gj-textbox-md" role="input">
                                                <i class="gj-icon" role="right-icon"></i></div>
                                           
                                           </div>
                                            <div class="form_colum">   
                                                <div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable">
                                                <input id="STDATE"  name="spdate" placeholder="도착 날짜" data-type="datepicker2"  data-guid="f93ce276-0c6e-dc79-2d00-ff8d3cc4c980" data-datepicker="true" class="gj-textbox-md" role="input">
                                                <i class="gj-icon" role="right-icon"></i></div>
                                            </div>
                                            <div class="form_colum">
                                                <select class="nc_select" name="people">
                                                    <option selected>인원 </option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                </select>
                                            </div>
                                              <div class="form_btn">
                                           <input type="submit" class="btn_1" value ="찾기"  >
                                                <a href = "airList" class="btn_1" >전체 보기</a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </section>
    <!-- 헤더 파트 끝-->

<table border=1  align="center">
    
	<tr bgcolor="#0A82FF" align="center" style="color: white">
		<td width="100" >티켓번호</td>
		<td width="100">티켓가격</td>
		<td width="100">출발지</td>
		<td width="100">도착지</td>
		<td width="100">출발시간</td>
		<td width="100">도착시간</td>
		<td width="100">인원</td>
		<td width="100">상세페이지</td>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr align="center">
		<td width="100">${dto.ticketno}</td>
		<td width="100">${dto.ticketprice}</td>
		<td width="100">${dto.ticketst}</td>
		<td width="100">${dto.ticketsp}</td>
		<td width="100">${dto.stdate}</td>
		<td width="100">${dto.spdate}</td>
		<td width="100">${dto.people}</td>
		<td width="100">
			 <a href="planeBook.jsp?ticketNo=${dto.ticketno}&ticketPrice=${dto.ticketprice}&ticketSt=${dto.ticketst}
			 &ticketSp=${dto.ticketsp}&stDate=${dto.stdate}&spDate=${dto.spdate}&people=${dto.people}">
				<button style="background: #fe5c24;; color: white">결제하기</button>
			</a> 
	</tr>
	</c:forEach>
</table>

 <jsp:include page ="footer.jsp"></jsp:include>

</body>
</html>