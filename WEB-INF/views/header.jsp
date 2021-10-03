<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String fId = (String)session.getAttribute("fId");
     	
    /*  String fId = "null";
 	
 	if(session != null){
   		fId =(String)session.getAttribute("fId"); // user 유저일땐 안보여요
 		
 	} */
     
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!--제이쿼리 ui js-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- 카카오 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	function kakaoLogout() {
		Kakao.init('12834938b9d60b4b8bc5becd102451f4');
		Kakao.isInitialized();
		console.log(Kakao.isInitialized());	
		
		if (!Kakao.Auth.getAccessToken()) {
			  console.log('Not logged in.');
			  //alert('Not logged in.');
			  return;
			}
			Kakao.Auth.logout(function() {
			  console.log(Kakao.Auth.getAccessToken());
			  
			  var accessToken = Kakao.Auth.getAccessToken();
				Kakao.Auth.setAccessToken(accessToken);
				alert(accessToken);
			});
	}
</script>
	
	<!-- 추가 CSS 및 CDN, API 사용하시는 분들은 위에 껴주시고 코드는 아래에 작성부탁드려요 -->
	<!-- 각자 JS 스크립트는 아래 ~ /head 사이에 작성 해주세요.  -->
	

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
                                       <!--  <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="#">QnA</a>
                                            <a class="dropdown-item" href="#">FAQ</a>
                                            <a class="dropdown-item" href="#">기타</a>
                                        </div> -->
                                    </li>
                                   <!--  <li class="nav-item">
                                        <a class="nav-link" href="contact.html">고객센터</a>
                                    </li> -->
                                </ul>
                            </div>
                            <a href="airIndex.jsp" class="btn_1 d-none d-lg-block">예약하다</a>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- 헤드파트 끝-->
    </body>
    </html>