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
                            <a class="nav-link active" id="hotel-tab" data-toggle="tab" href="#hotel" role="tab" aria-controls="hotel" aria-selected="true">항공권</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" id="tricket-tab" data-toggle="tab" href="#tricket" role="tab" aria-controls="tricket" aria-selected="false">호텔</a>
                        </ul>
                        
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="booking_content">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="tiket" role="tabpanel" aria-labelledby="hotel-tab">
                                <div class="booking_form">
                                     <form action="one2">
                                         <div class="form-row">
                                             <div class="form_colum">
                                            	
 												<input name="start" class="nc_select"  placeholder= "여행지 선택" >
                                            
                                            </div>
              
                                            <div class="form_colum">
                                                <div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable">
                                                <input id="SPDATE" placeholder="출발 날짜" data-type="datepicker1" data-guid="4df0005c-3725-c600-3c40-f07654cc7355" data-datepicker="true" class="gj-textbox-md" role="input">
                                                <i class="gj-icon" role="right-icon"></i></div>
                                           
                                           </div>
                                    	  	<div class="form_colum">	
                                                <div role="wrapper" class="gj-datepicker gj-datepicker-md gj-unselectable">
                                                <input id="STDATE" placeholder="도착 날짜" data-type="datepicker2"  data-guid="f93ce276-0c6e-dc79-2d00-ff8d3cc4c980" data-datepicker="true" class="gj-textbox-md" role="input">
                                                <i class="gj-icon" role="right-icon"></i></div>
                                            </div>
                                       
                                            <div class="form_colum">
                                                <select class="nc_select" name="selectedBox">
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
                                           <input type="submit" class="btn_1" value ="찾기" name ="one2" >
                                                <a href = "air_list" class="btn_1" >전체 보기</a>
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


    <!--top place start-->
    <section class="event_part section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="event_slider owl-carousel" >
             <div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="ol-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <h5>여행지 추천</h5>
                                        <h2>오사카 - 일본</h2>
                                        <p>오사카, 교토, 고베, 나라의 인기 명소를 구석구석 알차게 즐기는 베스트셀러 여행</p>
                                        <p>날짜: <span>2021년 10월 12일</span> </p>
                                        <p>금액: <span>시작가격 : 300000 원</span> </p>
                                        <p>여행사 <span> 더조은 항공</span> </p>
                                        <a href="#" class="btn_1">상세 보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
              <div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="ol-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <h5>여행지 추천</h5>
                                        <h2>오사카 - 일본</h2>
                                        <p>오사카, 교토, 고베, 나라의 인기 명소를 구석구석 알차게 즐기는 베스트셀러 여행
                                        </p>
                                 		<p>날짜: <span>2021년 10월 12일</span> </p>
                                        <p>금액: <span>시작가격 : 300000 원</span> </p>
                                        <p>여행사 <span> 더조은 항공</span> </p>
                                        <a href="#" class="btn_1">상세 보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="single_event_slider">
                            <div class="row justify-content-end">
                                <div class="ol-lg-6 col-md-6">
                                    <div class="event_slider_content">
                                        <h5>여행지 추천</h5>
                                        <h2>오사카 - 일본</h2>
                                        <p>오사카, 교토, 고베, 나라의 인기 명소를 구석구석 알차게 즐기는 베스트셀러 여행
                                        </p>
                                        <p>날짜: <span>2021년 10월 12일</span> </p>
                                        <p>금액: <span>시작가격 : 300000 원</span> </p>
                                        <p>여행사 <span> 더조은 항공</span> </p>
                                        <a href="#" class="btn_1">상세 보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--top place end-->

    <!--::industries start::-->
    <section class="hotel_list section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>추천 패키지</h2>
                        <p>세상은 한권의 책과 같은데, 여행을 하지 않는 사람은 그 책 한 페이지만을 읽은 것과 같다.</p>
                    </div>
                </div>
            </div>
            <div class="row">
      	   <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="resources/img/ind/industries_4.jpg" alt="">
                        
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> 지중해식 레스토랑 </a></h3>
                            <p>산토리니, 그리스</p>
                            <h5>가격 <span>150,000</span></h5>
                        </div>
                    </div>
                </div>
      		
         		  <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="resources/img/ind/industries_5.jpg" alt="">
                        
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> 스위스 기차 여행</a></h3>
                            <p>제네바, 스위스</p>
                            <h5>가격 <span>1,000,000</span></h5>
                        </div>
                    </div>
                </div>
      		
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="resources/img/ind/industries_6.jpg" alt="">
                        
                        <div class="hotel_text_iner">
                            <h3> <a href="#"> 도톤보리 이자카야 </a></h3>
                            <p>오사카, 일본</p>
                            <h5>가격 <span>50,000</span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::industries end::-->
  <jsp:include page ="footer.jsp"></jsp:include>


</body>

</html>
