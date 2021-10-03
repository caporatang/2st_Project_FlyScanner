<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Flyscanner</title>
    <!-- 플라이스캐너 로고   -->
    <link rel="icon" href="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="resources/css/style.css">

	<!--달력 css  -->
	<!--제이쿼리 ui css-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--제이쿼리 js-->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!--제이쿼리 ui js-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
    <!-- 메인 배너 화면 사진 및 문구-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1> 여행 </h1>
                            <p>시작해봐요 ! 여행지로 ! 휴양지로  !</p>
                            <a href="#" class="btn_1">지금 시작 ! </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 메인배너 -->

 <!-- 예약 파트 시작-->
    <section class="booking_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="booking_menu">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                            <a class="nav-link active" id="hotel-tab" data-toggle="tab" href="#ticket" role="tab" aria-controls="hotel" aria-selected="true" href = "airIndex.jsp">항공권</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="admin-tab" data-toggle="tab"  role="tab" aria-controls="admin" aria-selected="false" href = "adminMain.jsp">관리자 페이지</a>
                        </ul>
                        
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="tiket" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                     <form action="aircreate">
                                         <div class="form-row">
                                         
                                          <div class="form_colum">
 												<input name="ticketno" class="nc_select"  placeholder= "항공권 번호" >
                                            </div>
                                            <div class="form_colum">
 												<input name="ticketprice" class="nc_select"  placeholder= "항공권 가격" >
                                            </div>
                                             <div class="form_colum">
 												<input name="ticketst" class="nc_select"  placeholder= "출발 국가" >
                                            </div>
            							    <div class="form_colum">
 												<input name="ticketsp" class="nc_select"  placeholder= "도착 국가" >
                                            </div>
                                            <div class="form_colum">
                                            </div>
                                            
                                            <hr>
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
                                          		<input type="submit" class="btn_1" value ="생성하기"  >
                                                <a href = "airList.jsp" class="btn_1" >전체목록</a>
                                        </div>
                                    </div>
                                </form>
                                
                                    <div> 
                               <hr style="border: solid 9px #2493e0;">
	                                    <div class="form_colum">
	                                <!--티켓 삭제  -->    
                                    	    <form action="airdelete">
 												<input name="ticketno" class="nc_select"  placeholder= "항공권 번호" >
 													<button>기존 항공권 삭제</button>
 											</form>
                               <hr style="border:  9px #2493e0 solid;">
 											
                                    <!--티켓 수정  -->    
                                    	    <form action="airupdate">
 												<input name="ticketno" class="nc_select"  placeholder= "항공권 번호" >
 												<input name="ticketprice" class="nc_select"  placeholder= "항공권 가격" >
 												<input name="ticketst" class="nc_select"  placeholder= "출발 국가" >
 												<input name="ticketsp" class="nc_select"  placeholder= "도착 국가" >
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
 													<button>기존 항공권 수정 </button>
 											</form>
                           			    </div>
                                    
                                    </div>
                                    
                                </div>
                            </div>
                            
                            
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </section>
    <!-- 헤더 파트 끝-->

  <jsp:include page ="footer.jsp"></jsp:include>


</body>

</html>
