<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<c:set var="pass" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/5d8badcf1a.js"
	crossorigin="anonymous"></script>
	<title>MOVIT, 무빗</title>
	<!--  카카오 스크립트-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!--  네이버 스크립트-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	

<style>

* {
	margin: 0;
	padding: 0;
}

#wrap {
	/* font-size: 20px; */
	color: #fff;
	text-align: center;
}

/* #header {height: 70px;}
        #banner {height: 450px; background: #4dd0e1;} */
/* #contents {height: 950px;} */
/* #footer {height: 220px;} */

/*레이아웃*/
#header_wrap {
	/* line-height: 100px; */
	height: 60px;
	background-color: rgba(0, 0, 0, 0.2);
}

#banner_wrap {
	height: 900px;
	/* line-height: 800px; */
	background: #111;
}

#nav_wrap {
	height: 150px;
	background: #fff;
	position: relative;
}

#event_wrap {
	height: 480px;
	/* line-height: 480px; */
	background: #303842;
}

#theater_wrap {
	height: 200px;
	/* line-height: 200px; */
	background: #fff;
}

#notice_wrap {
	height: 300px;
	/* line-height: 380px; */
	background: #fff;
}

#sns_wrap {
	height: 300px;
	/* line-height: 380px; */
	background: #fff;
}

#footer_wrap {
	height: 160px;
	/* line-height: 160px; */
	background: #999;
}

/*컨테이너*/
.header_container {
	width: 1500px;
	height: inherit;
	margin: 0 auto;
	overflow: hidden;
}

.menuBtn {
	float: left;
	margin-top: 7px;
	padding-left: 200px;
}

.logo {
	font-size: 40px;
	font-weight: bold;
	margin-left: 70px;
}

.loginBtn {
	margin-right: 200px;
	margin-top: 15px;
	float: right;
}

.loginBtn a {
	text-decoration: none;
	color: rgb(184, 184, 184);
}

.loginBtn a:hover {
	text-decoration: none;
	color: white;
}

.banner_container {
	width: 1500px;
	height: inherit;
	margin: 0 auto;
	position: relative;
}

.movie_card_wrap {
	position: absolute;
	top: 500px;
	left: 174px;
}

.movie_card {
	display: inline-block;
	margin-right: 50px;
}

.movie_card .fourth {
	margin-right: 0px;
}

.movie_card .poster {
	width: 245px;
	height: 352px;
	border-radius: 7px;
}

.nav_container {
	position: absolute;
	width: 1500px;
	height: inherit;
	color: black;
	top: -20px;
	left: 300px;
	/* overflow: hidden; */
	/* text-align: center; */
}

.nav_container .icon_wrap {
	margin-right: 150px;
	display: inline-block;
}

.nav_container .icon_wrap i span {
	font-size: 20px;
}

.nav_container i:last-child {
	margin-right: 0px;
}

.nav_icon_sm {
	font-size: 90px;
	font-weight: normal;
}

.nav_icon_lg {
	font-size: 70px;
	font-weight: normal;
}

.event_container {
	width: 1500px;
	height: inherit;
	margin: 0 auto;
}

.theater_container {
	width: 1500px;
	height: inherit;
	margin: 0 auto;
	color: #111;
}

.notice_container {
	width: 1500px;
	height: inherit;
	margin: 0 auto;
	color: #111;
}

.sns_container {
	width: 1500px;
	height: inherit;
	margin: 0 auto;
	color: #111;
}

.footer_container {
	width: 1500px;
	height: inherit;
	margin: 0 auto;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

<!--
loginmodal
 
css--
>
@import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700,800,900')
	;

.modal {
	overflow-y: auto;
}

#loginview, #Idfindview, #Idresultview, #passresultview, #passusercheck
	{
	top: 15%;
}

.btnlogin {
	cursor: pointer;
	transition: all 200ms linear;
}

.btnlogin:hover {
	text-decoration: none;
}

a {
	cursor: pointer;
	transition: all 200ms linear;
}

a:hover {
	text-decoration: none;
}

.link {
	color: #c4c3ca;
}

.link:hover {
	color: #ffeba7;
}

p {
	font-weight: 500;
	font-size: 14px;
	line-height: 1.7;
}

h4 {
	font-weight: 600;
}

h6 span {
	padding: 0 20px;
	text-transform: uppercase;
	font-weight: 700;
}

.section {
	position: relative;
	width: 100%;
	display: block;
	background-color: #2a2b38;
	background-image:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/pat.svg');
	background-position: bottom center;
	background-repeat: no-repeat;
}

.sectionresultview {
	position: relative;
	width: 100%;
	display: block;
	border: blcak;
	background-color: #2a2b38;
	background-image:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/pat.svg');
	background-position: bottom center;
	background-repeat: no-repeat;
}

.loginmodal-form-wrap {
	position: relative;
	width: 440px;
	max-width: 100%;
	height: 400px;
	-webkit-transform-style: preserve-form;
	transform-style: preserve-form;
	perspective: 800px;
	margin-top: 60px;
}

.loginmodal-form-wrapper {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	-webkit-transform-style: preserve-form;
	transform-style: preserve-form;
	transition: all 600ms ease-out;
}

.loginmodal-front {
	width: 100%;
	height: 100%;
	background-color: #2a2b38;
	background-image:
		url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/pat.svg');
	background-position: bottom center;
	background-repeat: no-repeat;
	background-size: 300%;
	position: absolute;
	border-radius: 35px 35px;
	left: 0;
	top: 0;
	font-family: 'Poppins', sans-serif;
	font-weight: 300;
	font-size: 15px;
	line-height: 1.7;
	color: #c4c3ca;
}

.form-group {
	position: relative;
	display: block;
	margin: 0;
	padding: 0;
}

.form-style {
	padding: 13px 20px;
	padding-left: 55px;
	height: 48px;
	width: 100%;
	font-weight: 500;
	border-radius: 4px;
	font-size: 14px;
	line-height: 22px;
	letter-spacing: 0.5px;
	outline: none;
	color: #c4c3ca;
	background-color: #1f2029;
	border: none;
}

.form-style:focus, .form-style:active {
	border: none;
	outline: none;
	box-shadow: 0 4px 8px 0 rgba(21, 21, 21, .2);
}

.input-icon {
	position: absolute;
	top: 0;
	left: 18px;
	height: 48px;
	font-size: 24px;
	line-height: 48px;
	text-align: left;
	color: #ffeba7;
}

.form-group input:-ms-input-placeholder {
	color: #c4c3ca;
	opacity: 0.7;
}

.form-group input::-moz-placeholder {
	color: #c4c3ca;
	opacity: 0.7;
}

.form-group input:-moz-placeholder {
	color: #c4c3ca;
	opacity: 0.7;
}

.form-group input::-webkit-input-placeholder {
	color: #c4c3ca;
	opacity: 0.7;
}

.form-group input:focus:-ms-input-placeholder {
	opacity: 0;
}

.form-group input:focus::-moz-placeholder {
	opacity: 0;
}

.form-group input:focus:-moz-placeholder {
	opacity: 0;
}

.form-group input:focus::-webkit-input-placeholder {
	opacity: 0;
}

.btnlogin {
	border-radius: 20px;
	height: 44px;
	font-size: 13px;
	font-weight: 600;
	text-transform: uppercase;
	-webkit-transition: all 200ms linear;
	transition: all 200ms linear;
	padding: 0 30px;
	letter-spacing: 1px;
	display: -webkit-inline-flex;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-align-items: center;
	-moz-align-items: center;
	-ms-align-items: center;
	align-items: center;
	-webkit-justify-content: center;
	-moz-justify-content: center;
	-ms-justify-content: center;
	justify-content: center;
	-ms-flex-pack: center;
	text-align: center;
	border: none;
	background-color: #ffeba7;
	color: #102770;
	box-shadow: 0 8px 24px 0 rgba(255, 235, 167, .2);
}

.btnlogin:active, .btnlogin:focus {
	background-color: #102770;
	color: #ffeba7;
	box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
}

.btnlogin:hover {
	background-color: #102770;
	color: #ffeba7;
	box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
}
</style>
</head>

<body>
	<div id="wrap">
		<div id="contents_wrap">
			<div id="header_wrap" class=" fixed-top">
				<div class="header_container ">
					<span style="font-size: 30px; cursor: pointer" onclick="openNav()"
						class="menuBtn">&#9776;</span> <span class="logo">;Movit</span>
					<c:set var="user_id" value="${sessionScope.user_id}" />
					<c:set var="kakaoN" value="${sessionScope.kakaoN}" />


					<c:if test="${user_id==null && kakaoN==null}">
						<span class="loginBtn"> <a data-bs-toggle="modal"
							data-bs-target="#loginview">LogIn</a> <a href=${pass}/user/reg>회원가입</a>
						</span>
					</c:if>

					<c:if test="${sessionScope.user_id!=null}">
						<span class="loginBtn"> <b>${sessionScope.loginname}(${sessionScope.user_id})님</b>
							&nbsp; &nbsp; <a onclick="logout()">Logout</a>
						</span>
					</c:if>
					<c:if test="${sessionScope.kakaoN!=null}">
						<span class="loginBtn"> <b>${sessionScope.kakaoN}(${sessionScope.kakaoE})님</b>
							&nbsp; &nbsp;<a	href="https://kauth.kakao.com/oauth/logout?client_id=1ae5e64fdf23e2e6840b736262379606&logout_redirect_uri=http://localhost:9005/kakaologout"
							onclick="logouts()">Logout</a>

						</span>
					</c:if>
				</div>
			</div>
			<div id="banner_wrap">
				<div class="banner_container">
					<div id="carouselExampleControls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="img/banner-1.jpg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
								<img src="img/banner-2.jpg" class="d-block w-100" alt="...">
							</div>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleControls" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<div class="movie_card_wrap">
						<div class="movie_card first">
							<span> <img
								src="https://img.megabox.co.kr/SharedImg/2022/05/04/4OFqLBLmda67a6BPXjaXCVM5wun7FAtb_420.jpg"
								class="poster">
							</span>
						</div>
						<div class="movie_card second">
							<span> <img
								src="https://img.megabox.co.kr/SharedImg/2022/04/29/Sj4v7jaCicFTLrGgxM5D0lRsrL3kgu8g_420.jpg"
								class="poster">
							</span>
						</div>
						<div class="movie_card third">
							<span> <img
								src="https://img.megabox.co.kr/SharedImg/2022/04/06/7YDE8KC4uv7RH6F57pTYUhS7IygSxYTF_420.jpg"
								class="poster">
							</span>
						</div>
						<span class="movie_card fourth"> <span> <img
								src="https://img.megabox.co.kr/SharedImg/2022/03/25/p02Tj8NeXivFyhGgMGm3DD0kdeogGkkA_420.jpg"
								class="poster">
						</span>
					</div>
				</div>
			</div>



		</div>
		<div id="nav_wrap">
			<div class="nav_container">
				<div class="icon_wrap">
					<i class="bi bi-person nav_icon_sm"> <br>
					<span>마이페이지</span>
					</i>

				</div>
				<div class="icon_wrap">
					<i class="bi bi-gift nav_icon_lg"> <br>
					<span>이벤트</span>
					</i>

				</div>
				<div class="icon_wrap">
					<i class="bi bi-ticket-perforated nav_icon_sm"> <br>
					<span>예매하기</span>
					</i>

				</div>
				<div class="icon_wrap">
					<i class="bi bi-camera-reels nav_icon_lg"> <br>
					<span>현재 상영작</span>
					</i>

				</div>
				<div class="icon_wrap">
					<i class="bi bi-chat-left-text nav_icon_lg"> <br>
					<span>문의사항</span>
					</i>

				</div>
			</div>
		</div>
		<div id="event_wrap">
			<div class="event_container">event</div>
		</div>
		<div id="theater_wrap">
			<div class="theater_container"></div>
		</div>
		<div id="notice_wrap">
			<div class="notice_container">notice</div>
		</div>
		<div id="sns_wrap">
			<div class="sns_container">sns</div>
		</div>
	</div>
	<div id="footer_wrap">
		<div id="footer-info">
			<div class="footer_container">footer-info</div>

		</div>
	</div>
	</div>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a>
		<a href="#">Contact</a>
	</div>


	<!--로그인 창 Modal -->
	<div class="modal" id="loginview">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="section">
					<div class="loginmodal-form-wrap mx-auto">
						<div class="loginmodal-form-wrapper">
							<div class="loginmodal-front">
								<div class="center-wrap">
									<form action="success" method="post">
										<div class="text-center">
											<h4 class="brand">;Movit</h4>
											<h4 class="logintext">
												<span class="glyphicon glyphicon-lock"></span> LogIn
											</h4>
											<div class="form-group">
												<input type="text" name="user_id" class="form-style"
													placeholder="Your ID" id="logemail" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>
											<div class="form-group mt-2">
												<input type="password" name="password" class="form-style"
													placeholder="Your Password" id="logpass" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<br>
											<button type="submit" class="btnlogin">Login</button>
											<%-- <a href="${pass}/login/ok" class="btnlogin" type="submit">Login</a> --%>

											<p class="idpassfind text-center">
												<a class="link" id="idpassview">ID/Password찾기</a>
											</p>
											<p class="regtext ">
												<a href="${pass}/user/reg" class="link">아직 회원이 아니십니까?</a>
											</p>
									
												<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=1ae5e64fdf23e2e6840b736262379606&redirect_uri=http://localhost:9005/kakaologin&response_type=code">
											
												<img src="./image/kakao_login_medium_narrow.png"
												style="height: 40px">
											</a> <br> 
													<!-- 네이버 로그인 버튼 생성 위치 -->
											   <%
    String clientId = "wmxTFuijyRLQbSXlc64_";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:9005/naverlogin", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
											<br>
											<div c lass="text-center"></div>
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
	<!--  ID/ Password 찾기 모달 -->
	<div class="modal" id="Idfindview">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="section">
					<div class="loginmodal-form-wrap mx-auto">
						<div class="loginmodal-form-wrapper">
							<div class="loginmodal-front">
								<div class="center-wrap">
									<div class="section text-center">
										<div>
											<div style="margin-bottom: 10px;"
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input"
													id="search_1" name="search_total" onclick="search_check(1)"
													checked="checked"> <label
													class="custom-control-label font-weight-bold text-white"
													for="search_1">아이디 찾기</label> <input type="radio"
													class="custom-control-input" id="search_2"
													name="search_total" onclick="search_check(2)"> <label
													class="custom-control-label font-weight-bold text-white"
													for="search_2">비밀번호 찾기</label>
											</div>
										</div>
										<div id="searchId">

											<div class="form-group">
												<h4 class="logintext">
													<span class="glyphicon glyphicon-lock"></span> 아이디 찾기
												</h4>

												<input type="text" name="inputname" class="form-style"
													placeholder="Your Name" id="inputname" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>
											<div class="form-group mt-2">
												<input type="email" name="inputemail" class="form-style"
													placeholder="Your Email" id="inputemail" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<br>
											<button id="searchBtn" type="button"
												onclick="idSearch_click()" class="btnlogin" value="check">ID
												찾기</button>

											<a class="btn btn-danger btn-block" id="Idfindviewclose"
												style="text-decoration: none; border-radius: 20px;">로그인하러가기</a>
										</div>


										<div id="searchPass" style="display: none;">
											<div class="section text-center">
												<h4 class="logintext">
													<span class="glyphicon glyphicon-lock"></span> 비밀번호 찾기
												</h4>
												<div class="form-group">
													<input type="text" name="inputId" class="form-style"
														placeholder="Your Id" id="inputId" autocomplete="off">
													<i class="input-icon uil uil-at"></i>
												</div>
												<div class="form-group mt-2">
													<input type="email" name="inputemail2" class="form-style"
														placeholder="Your Email" id="inputemail2"
														autocomplete="off"> <i
														class="input-icon uil uil-lock-alt"></i>
												</div>
												<div class="form-group mt-2">
													<div class="mail_check_input_box"
														id="mail_check_input_box_false">
														<input id="certi" type="text" name="certi" title="인증번호 입력"
															disabled required />
													</div>

													<button type="button"
														class="btn btn-outline-danger btn-sm px-3" id="emailChk"
														class="doubleChk">
														<i class="fa fa-envelope"></i>&nbsp;인증번호 보내기
													</button>
													&nbsp;
													<button type="button"
														class="btn btn-outline-info btn-sm px-3" id="emailChk2"
														class="doubleChk">
														<i class="fa fa-envelope"></i>&nbsp;확인
													</button>
													&nbsp;<br> <input type="hidden" id="emailDoubleChk" />
													<span class="point successEmailChk" style="color: red;">이메일
														입력후 인증번호 보내기를 해주십시오.</span> <input type="hidden"
														id="emailDoubleChk" />
													<div class="check_font" id="email_check"></div>
													<br>


												</div>
											</div>
											<button type="button" class="btnlogin" id="searchBtn2"
												onclick="passwordSerch_click()">Password 찾기</button>
											<a class="btn btn-danger btn-block" id="passfindviewclose"
												style="text-decoration: none; border-radius: 20px;">로그인하러가기</a>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ID/찾기 모달 Modal -->
	<div class="modal" id="Idresultview">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="section text-center">
					<div class="modal-header">
						<h5 class="modal-title" id="Idtitle" style="color: white;">ID
							찾기</h5>
						<a class="btn-close" id="Idresultviewclose" aria-label="Close"
							style="color: white;"></a>
					</div>
					<h4>
						<b style="color: white;">ID 찾기 안내</b>
					</h4>
					<br>
					<h2 id="id_value" style="color: white;"></h2>
					<br>
					<button type="button" id="pwSearch_btn"
						class="btn peach-gradient btn-rounded waves-effect">
						<i class="fa fa-envelope" style="color: white;"></i><b
							style="color: white;">비밀번호 찾기</b>
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- ID/찾기 모달 Modal -->
	<div class="modal" id="passresultview">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="section text-center">
					<div class="modal-header">
						<h5 class="modal-title" id="Idtitle" style="color: white;">비밀번호찾기</h5>
						<a class="btn-close" id="passlogins" aria-label="Close"
							style="color: white; border: white;"></a>
					</div>
					<h4>
						<b style="color: white;">임시 비밀번호로 변경완료되었습니다..</b>
					</h4>
					<br>
					<h2 style="color: white;">
						이메일에서 확인 후 <br>로그인하십시오.
					</h2>
					<br>
				</div>
			</div>
		</div>
	</div>
	<!-- ID/찾기 모달 Modal -->
	<div class="modal" id="passusercheck">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="section text-center">
					<div class="modal-header">
						<h5 class="modal-title" id="Idtitle" style="color: white;">정보
							입력 오류</h5>
						<a class="btn-close" id="passloginA" aria-label="Close"
							style="color: white; border: white;"></a>
					</div>
					<h4>
						<b style="color: white;">올바른 정보 및 인증을 완료해주세요!</b>
					</h4>
					<br>
					<h2 style="color: white;">
						이메일에서 확인 후 <br>로그인하십시오.
					</h2>
					<br>
				</div>
			</div>
		</div>
	</div>




	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "400px";
			document.getElementById("main").style.marginLeft = "400px";
			document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
			document.getElementById("main").style.marginLeft = "0";
			document.body.style.backgroundColor = "white";
		}

		//로그인 화면

		$(".loginview").click(function() {
			$("#loginview").modal();
		});
		//비밀번호찾기완료후 버튼누루면 로그인화면 
		$("#pwSearch_btn").click(function() {
			$('#Idfindview').show();
			search_check(2);
			$('#Idresultview').hide();
			$("#search_2").css("check", checked);

		});

		//로그인 실패시
		let loginfail = "${loginfail}";
		if (loginfail == "1") {
			alert("로그인 실패! 아이디/패스워드를 다시 확인해주세요.");
		}

		//로그아웃 처리
		function logout() {
			$.ajax({
				type : "get",
				dataType : "json",
				url : "out",
				success : function() {

				}
			});
			window.location.reload(true);
		}
		function logouts() {

			$.ajax({
				type : "get",
				dataType : "json",
				url : "kakaologout",
				success : function() {

				}
			});
			window.location.reload(true);

		}

		//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다

		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchPass").style.display = "none";
				document.getElementById("searchId").style.display = "";
			} else {
				document.getElementById("searchId").style.display = "none";
				document.getElementById("searchPass").style.display = "";
			}
		}

		///이메일 인증 발송
		var code = "code";
		$("#emailChk")
				.click(
						function() {
							var email = $("#inputemail2").val();
							var user_id = $('#inputId').val()
							$
									.ajax({
										type : "GET",
										url : "${pageContext.request.contextPath}/usercheck?user_id="
												+ user_id + "&email=" + email,
										success : function(data) {
											if (data == 0) {
												alert("ID 또는 이메일 주소가 올바르지 않습니다.");
												$("#inputemail2").attr(
														"autofocus", true);
												$(".successEmailChk")
														.text(
																"유효한 ID와 이메일 주소를 입력해주세요.");
												$(".successEmailChk").css(
														"color", "red");
											} else {
												alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
												$("#certi").attr("disabled",
														false);
												$("#emailChk2").css("display",
														"inline-block");
												$(".successEmailChk")
														.text(
																"인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
												$(".successEmailChk").css(
														"color", "green");
												code = data;
											}
										}

									});
						});
		//이메일 인증 시스템
		$("#emailChk2").click(function() {
			if ($("#certi").val() == code) {
				$(".successEmailChk").text("인증번호가 일치합니다.");
				$(".successEmailChk").css("color", "green");
				$("#emailDoubleChk").attr('value', 'true');
				$("#certi").attr("disabled", true);

			} else if ($("#certi").val() == "") {
				$(".successEmailChk").text("인증번호를 입력하세요!.");
				$(".successEmailChk").css("color", "red");
				$("#emailDoubleChk").attr('value', 'false');
				$("#certi").attr("autofocus", true);
			} else {
				$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".successEmailChk").css("color", "red");
				$("#emailDoubleChk").attr('value', 'false');
				$("#certi").attr("autofocus", true);
			}
		});

		/////////모///달///기///능///////////
		// 1. 모달창 (ID 찾기 모달창) 
		$('#searchBtn').click(function() {
			$('#Idresultview').show();

		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			/* $('#Idresultview').hide(); */
			$('.modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			/*  				if (event.target == $('#Idresultview').get(0)) {	
			 		         }	 */
			if (event.target == $('.modal').get(0)) {
			}
		});

		$('#idpassview').click(function() {
			$('#loginview').hide();
			$('#Idfindview').show();

		});
		$('#Idfindviewclose').click(function() {
			$('#loginview').show();
			$('#Idfindview').hide();
		});
		$('#Idresultviewclose').click(function() {
			$('#Idresultview').hide();
			$('#passresultview').hide();
		});

		$('#passfindviewclose').click(function() {
			$('#Idfindview').hide();
			$('#loginview').show();
		});
		$('.btnlogin exit').click(function() {
			$('#passresultview').hide();
			$('#loginview').show();
		});
		$('#passlogins').click(function() {
			$('#passresultview').hide();
			$('#loginview').show();
		});
		$('#passloginA').click(function() {
			$('#passusercheck').hide();
			$('#loginview').show();
		});
		///////////////////////////////////////////////////////////////    			
		// 아이디 & 스토어 값 저장하기 위한 변수
		var idV = "";
		var info = "";
		// 아이디 값 받고 출력하는 ajax
		var idSearch_click = function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/userSearch?name="
						+ $('#inputname').val() + "&email="
						+ $('#inputemail').val(),
				success : function(data) {
					if (data == 0) {
						$('#id_value').text("회원 정보를 확인해주세요!");
					} else {
						info = "ID:" + data;
						$('#id_value').text(info);
						// 아이디값 별도로 저장
						idV = data;
					}
				}
			});
		}
		//패스워드 찾기
		var passwordSerch_click = function() {

			if ($("#emailDoubleChk").attr('value') == "true") {
				$
						.ajax({
							type : "POST",
							url : "${pageContext.request.contextPath}/searchPassword?user_id="
									+ $('#inputId').val()
									+ "&email="
									+ $('#inputemail2').val(),
							success : function(data) {
								$('#Idfindview').hide();
								$('#passresultview').show();
								setTimeout(function() {
									window.location.reload(true);
								}, 3000);

							}

						});

			} else {
				$('#passusercheck').show();
				setTimeout(function() {
					$('#passusercheck').hide();
				}, 2500);

			}

		}
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "wmxTFuijyRLQbSXlc64_",
			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl : "http://localhost:9005/naverlogin",
			// 본인의 callBack url로 수정하세요.
			isPopup : false,
			loginButton : {
				color : "white",
				type : 3,
				height : 30
			}
		// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		});
		naverLogin.init();
	</script>

</body>
</html>