<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String fId = (String)session.getAttribute("fId");
    %>
<!doctype html>
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
    <link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/flaticon.css">
	<link rel="stylesheet" href="resources/css/animate.css">
	<link rel="stylesheet" href="resources/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
	<link rel="stylesheet" href="resources/css/themify-icons.css">
	<link rel="stylesheet" href="resources/css/magnific-popup.css">
    <link rel="stylesheet" href="resources/css/gijgo.min.css">
    <link rel="stylesheet" href="resources/css/nice-select.css">
	<!--제이쿼리 ui css-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!--제이쿼리 js-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!--제이쿼리 ui js-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- 카카오 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	function kakaoLogout() {							// 카카오 서버에 요청하는 logout function.
		Kakao.init('12834938b9d60b4b8bc5becd102451f4'); // API 인증키
		Kakao.isInitialized();							// API 초기화
		console.log(Kakao.isInitialized());				
		
		if (!Kakao.Auth.getAccessToken()) {				// 토큰이 발급되지 않았다면 --> 로그인x 
			  console.log('Not logged in.');			
			  //alert('Not logged in.');					// 로그인 하지않았다는 메세지 출력
			  return;
			}
			Kakao.Auth.logout(function() {				// 토큰값이 있을때 카카오에 요청 fucntion
			  console.log(Kakao.Auth.getAccessToken());
			  
			  var accessToken = Kakao.Auth.getAccessToken();  // 토큰값을 변수에 저장.
				Kakao.Auth.setAccessToken(accessToken); 	  
				console.log(accessToken);					  // 로그아웃이 되었는지 Console을 통해 확인
				alert(accessToken);								
			});
	}
</script>
	<!-- 추천기능 -->
	<script type="text/javascript">
		$(function() {
			$.ajax({
				url: 'index.main',
				type: 'POST',
				dataType: 'json',
				success: function(data) {
					//이름
					hname1 = data[0].hname;
					hname2 = data[1].hname;
					hname3 = data[2].hname;
					hname4 = data[3].hname;
					//지역
					hregion1 = data[0].hregion;
					hregion2 = data[1].hregion;
					hregion3 = data[2].hregion;
					hregion4 = data[3].hregion;
					//가격
					price1 = data[0].stdprice;
					price2 = data[1].stdprice;
					price3 = data[2].stdprice;
					price4 = data[3].stdprice;
					//사진
					img1 = data[0].hid;
					img2 = data[1].hid;
					img3 = data[2].hid;
					img4 = data[3].hid;
					// 주소
					move1 = data[0].hid;
					move2 = data[1].hid;
					move3 = data[2].hid;
					move4 = data[3].hid;
					// 체크인
					ch1 = data[0].checkin;
					ch2 = data[1].checkin;
					ch3 = data[2].checkin;
					ch4 = data[3].checkin;
					//체크아웃
					cho1 = data[0].checkout;
					cho2 = data[1].checkout;
					cho3 = data[2].checkout;
					cho4 = data[3].checkout;
					// std num
					std1 = data[0].stdnum;
					std2 = data[1].stdnum;
					std3 = data[2].stdnum;
					std4 = data[3].stdnum;
					gu1 =  data[0].guestnum;
					gu2 =  data[1].guestnum;
					gu3 =  data[2].guestnum;
					gu4 =  data[3].guestnum;
					ht1 =  data[0].htlat;
					ht2 =  data[1].htlat;
					ht3 =  data[2].htlat;
					ht4 =  data[3].htlat;
					hl1 =  data[0].htlong;
					hl2 =  data[1].htlong;
					hl3 =  data[2].htlong;
					hl4 =  data[3].htlong;
					
					// html 
					$('#hName1').html(hname1); 
					$('#hName2').html(hname2); 
					$('#hName3').html(hname3); 
					$('#hName4').html(hname4);
					
					$('#hregion1').html(hregion1); 
					$('#hregion2').html(hregion2); 
					$('#hregion3').html(hregion3); 
					$('#hregion4').html(hregion4); 

					$('#price1').html(price1 + 'KRW~'); 
					$('#price2').html(price2 + 'KRW~'); 
					$('#price3').html(price3 + 'KRW~'); 
					$('#price4').html(price4 + 'KRW~'); 
					
					$('#img1').attr("src","resources/img/hotel/"+ img1 +".jpg");
					$('#img2').attr("src","resources/img/hotel/"+ img2 +".jpg");
					$('#img3').attr("src","resources/img/hotel/"+ img3 +".jpg");
					$('#img4').attr("src","resources/img/hotel/"+ img4 +".jpg");
					
					// 클릭시 이동
					$('#move1').attr("href","htDetail.jsp?hid=" + move1 + "&himage="+ img1 +".jpg&checkin="+ch1 +"&checkout="+ cho1 +
							"&stdnum="+ std1 + "&guestnum=" + gu1 + "&htlat="+ ht1 +"&htlong=" + hl1);
					//2
					$('#move2').attr("href","htDetail.jsp?hid=" + move2 + "&himage="+ img2 +".jpg&checkin="+ch2 +"&checkout="+ cho2 +
							"&stdnum="+ std2 + "&guestnum=" + gu2 + "&htlat="+ ht2 +"&htlong=" + hl2);
					//3
					$('#move3').attr("href","htDetail.jsp?hid=" + move3 + "&himage="+ img3 +".jpg&checkin="+ch3 +"&checkout="+ cho3 +
							"&stdnum="+ std3 + "&guestnum=" + gu3 + "&htlat="+ ht3 +"&htlong=" + hl3);
					//4
					$('#move4').attr("href","htDetail.jsp?hid=" + move4 + "&himage="+ img4 +".jpg&checkin="+ch4 +"&checkout="+ cho4 +
							"&stdnum="+ std4 + "&guestnum=" + gu4 + "&htlat="+ ht4 +"&htlong=" + hl4);
					/* $.each(data, function(idx, val) {
						console.log(idx + " " + val.hname);
						$('#hName1').html(val.hname); 
						$('#hName2').html(idx + val.hname); 
					}); */
				}
				
			})//ajax
			
			
			$.ajax({
				url: 'index2.main',
				type: 'POST',
				dataType: 'json',
				success: function(data) {
					// 티켓 행선지
					$('#air1').html(data[0].ticketst +' -> '+ data[0].ticketsp);
					$('#air2').html(data[1].ticketst +' -> '+ data[1].ticketsp);
					$('#air3').html(data[2].ticketst +' -> '+ data[2].ticketsp);
					// 티켓 지역
					$('#c1').html(data[0].ticketsp);
					$('#c2').html(data[1].ticketsp);
					$('#c3').html(data[2].ticketsp);
					// 티켓 가격
					$('#airP1').html(data[0].ticketprice + 'KRW ~');
					$('#airP2').html(data[1].ticketprice + 'KRW ~');
					$('#airP3').html(data[2].ticketprice + 'KRW ~');

					//1번
					if (data[0].ticketsp == '일본') {
						$('#airImg1').attr("src","resources/img/air/japan.png");
					}else if (data[0].ticketsp == '대한민국') {
						$('#airImg1').attr("src","resources/img/air/korea.jpg");
					}
					//2번
					if (data[1].ticketsp == '일본') {
						$('#airImg2').attr("src","resources/img/air/japan.png");
					}else if (data[1].ticketsp == '대한민국') {
						$('#airImg2').attr("src","resources/img/air/korea.jpg");
					}
					//3번
					if (data[2].ticketsp == '일본') {
						$('#airImg3').attr("src","resources/img/air/japan.png");
					}else if (data[2].ticketsp == '대한민국') {
						$('#airImg3').attr("src","resources/img/air/korea.jpg");
					}
					
				} //success
				
				
				
				
			})//ajax
			
		})	//func
	
	</script>
	</head>

<body>
   <!-- 탑헤드-->
   <header class="main_menu">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">
                           <%if(fId != null){ %>
                            <span><%= fId %> 님 환영합니다! </span>
                            <%} %>
                            <%if(fId == null){ %>
	                            <a href="member_join.jsp">회원가입</a>
	                            <a href="member_login.jsp">로그인</a>
	                            <a href="member_weather.jsp">날씨&지도</a>
                            	<%} %>
                            <%if(fId != null){ %>
								<a href="member_myPage.jsp">mypage</a>
								<a href="logout.member" id="logout" onclick="kakaoLogout()">로그아웃</a> 
								<a href="member_weather.jsp">날씨&지도</a>
								<%} %>	
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_social_icon">
                            <a href="#"><i class="flaticon-facebook"></i></a>
                            <a href="#"><i class="flaticon-twitter"></i></a>
                            <a href="#"><i class="flaticon-skype"></i></a>
                            <a href="#"><i class="flaticon-instagram"></i></a>
                            <span><i class="flaticon-phone-call"></i>031-8888-7777</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 헤드 -->
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="index.jsp"> <img src="resources/img/logo(1).png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.jsp">홈</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="airIndex.jsp">항공권</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="htMain2.jsp">호텔</a>
                                    </li>
                                   <!--  <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            블로그
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="blog.html">블로그</a>
                                            <a class="dropdown-item" href="single-blog.html">개인 블로그</a>
                                        </div> -->
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="faqSelect.jsp" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            고객센터
                                        </a>
                                        <!-- <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="#">QnA</a>
                                            <a class="dropdown-item" href="faqInformation.jsp">FAQ</a>
                                            <a class="dropdown-item" href="QuestionCustomer2.jsp">1:1 문의하기</a>
                                        </div> -->
                                    </li>
                                   <!--  <li class="nav-item">
                                        <a class="nav-link" href="contact.html">고객센터</a>
                                    </li> -->
                                </ul>
                            </div>
                            <a href="airIndex.jsp" class="btn_1 d-none d-lg-block" id="res1">예약하다</a>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- 헤드파트 끝-->
    
    <!-- 메인 배너 화면 사진 및 문구-->
    <section class="banner_part">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-10">
                    <div class="banner_text text-center">
                        <div class="banner_text_iner">
                            <h1> Travel </h1>
                            <p>시작해봐요 ! 여행지로 ! 휴양지로  !</p>
                            <a href="#" class="btn_1">지금 떠나기 ! </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 메인배너 -->

 	<!-- 예약 파트 시작-->
    <!-- <section class="booking_part">
        <div class="container">
                    </div>
    </section> -->
    
    <!-- 헤더 파트 끝-->
  
   <!--top place start-->
    <section class="top_place section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>Top Places to visit</h2>
                        <p>Waters make fish every without firmament saw had. Morning air subdue. Our. Air very one. Whales grass is fish whales winged.</p>
                    </div>
                </div>
            </div>
            <div class="row">
               <!-- 컨트롤러 호출 -->
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img  id="img1" src="resources/img/single_place_1.png" alt="" style="width: 600px; height: 400px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#" class="place_btn" id="move1">travel</a>
                                <h3 id="hName1"></h3>
                                <p id="hregion1"></p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span id="price1"></span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img id="img2" src="resources/img/single_place_2.png" alt="" style="width: 600px; height: 400px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#" class="place_btn" id="move2">travel</a>
                                <h3 id="hName2"> </h3>
                                <p id="hregion2"></p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span id="price2"></span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img id="img3" src="resources/img/single_place_3.png" alt="" style="width: 600px; height: 400px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#" class="place_btn" id="move3">travel</a>
                                <h3 id="hName3"></h3>
                                <p id="hregion3"></p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span id="price3"></span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="single_place">
                        <img id="img4" src="resources/img/single_place_4.png" alt="" style="width: 600px; height: 400px;">
                        <div class="hover_Text d-flex align-items-end justify-content-between">
                            <div class="hover_text_iner">
                                <a href="#" class="place_btn" id="move4">travel</a>
                                <h3 id="hName4"></h3>
                                <p id="hregion4"></p>
                                <div class="place_review">
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <a href="#"><i class="fas fa-star"></i></a>
                                    <span id="price4"></span>
                                </div>
                            </div>
                            <div class="details_icon text-right">
                                <i class="ti-share"></i>
                            </div>
                        </div>
                    </div>
                </div> 
                <a href="#" class="btn_1 text-cnter">Discover more</a>
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
                        <h2>Recommended trip.
                        </h2>
                        <p>여행은 다른 문화, 다른 사람을 만나고 결국에는 자기자신을 만나는 것이다. -한비야</p>
                        <p>지금 바로 Flyscanner 와 함께 떠나보시는건 어떨까요?</p>
                    </div>
                </div>
            </div>
            <div class="row">
      	   <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img id="airImg1" src="resources/img/ind/industries_1.png" alt="" style="width: 300px; height: 250px;">
                        
                        <div class="hotel_text_iner">
                            <h3> <a href="#" id="air1"></a></h3>
                            <p id="c1"></p>
                            <h5>가격 <span id="airP1"></span></h5>
                        </div>
                    </div>
                </div>
      		
         		  <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img id="airImg2" src="resources/img/ind/industries_2.png" alt="">
                        
                        <div class="hotel_text_iner">
                            <h3> <a href="#" id="air2"></a></h3>
                            <p id="c2"></p>
                            <h5>가격 <span id="airP2"> </span></h5>
                        </div>
                    </div>
                </div>
      		
                <div class="col-lg-4 col-sm-6">
                    <div class="single_ihotel_list">
                        <img id="airImg3" src="resources/img/ind/industries_3.png" alt="">
                        
                        <div class="hotel_text_iner">
                            <h3> <a href="#" id="air3"></a></h3>
                            <p id="c3"></p>
                            <h5>가격 <span id="airP3"></span></h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::industries end::-->


    <!-- footer part start-->
    <footer class="footer-area">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-md-5">
                    <div class="single-footer-widget">
                        <h4>FOR TRAVELER</h4>
                        <ul>
                            <li><a href="airIndex.jsp">항공권</a></li>
                            <li><a href="htMain2.jsp">호텔</a></li>
                            <li><a href="member_weather.jsp">날씨</a></li>
                            <li><a href="faqSelect.jsp">고객센터</a></li>
                            <li><a href="questionList">QnA</a></li>
                            <li><a href="faqInformation">FAQ</a></li>
                            <li><a href="airIndex.jsp">여행</a></li>
                            <li><a href="#">런던, 영국</a></li>
                            <li><a href="#">도쿄, 일본</a></li>
                            <li><a href="#">서울, 대한민국</a></li>
                            <li><a href="#">뉴욕, 미국</a></li>
                            <li><a href="#">시드니, 오스트레일리아</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="single-footer-widget">
                        <h4>Subscribe Newsletter</h4>
                        <div class="form-wrap" id="mc_embed_signup">
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="form-inline">
                                <input class="form-control" name="EMAIL" placeholder="Your Email Address"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '"
                                    required="" type="email">
                                <button class="click-btn btn btn-default text-uppercase"> <i class="far fa-paper-plane"></i>
                                </button>
                                <div style="position: absolute; left: -5000px;">
                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                        type="text">
                                </div>

                                <div class="info"></div>
                            </form>
                        </div>
                        <p>Subscribe our newsletter to get update news and offers</p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="single-footer-widget footer_icon">
                        <h4>Contact Us</h4>
                        <p>서울특별시 종로구 세종로 1-58,   <br> 
                                02-3402-8888</p>
                        <span>flyscanner@spring.com</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="#" target="_blank">FlyScanner</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer part end-->

</body>

</html>
