<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript">
	var CONTEXT_PATH = "${CONTEXT_PATH}";
	var RESOURCES_PATH = "${RESOURCES_PATH}";
</script>
<link href="/resources/css/common.css" rel='stylesheet' />
<link href="/resources/css/loginmodal.css" rel='stylesheet' />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</svg>

</head>

<body>
	<div class='wrap'>
		<div class="sidebar_wrap">
			<tiles:insertAttribute name="sidebar" />
		</div>
		<div class="header_wrap fixed-top">
			<tiles:insertAttribute name="header" />
		</div>
		<div class='content_wrap'>
			<tiles:insertAttribute name="content" />
		</div>
		<div class="footer_wrap">
			<tiles:insertAttribute name="footer" />
		</div>
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
									<form action="/success" method="post">
										<div class="text-center">
											<h4 class="brand" style="font-size: 35px; font-weight: bold;">;Movit</h4>
											<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  											<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
											<h4 class="logintext" style="font-size: 30px; font-weight: bold;">
													LOGIN
											</h4>
											<div class="form-group">
												<input type="text" name="user_id" class="form-style" placeholder="Your ID" id="logemail" autocomplete="off">
												
											</div>
											<div class="form-group mt-2">
												<input type="password" name="password" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
												
											</div>
											<br>
											<button type="submit" class="btnlogin">Login</button>
											<%-- <a href="${pass}/login/ok" class="btnlogin" type="submit">Login</a> --%>

											<p class="idpassfind text-center">
												<a class="link" id="idpassview">ID/Password찾기</a>
											</p>
											<p class="regtext ">
												<a href="${pass}/user/agree" class="link">아직 회원이 아니십니까?</a>
											</p>

											<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=1ae5e64fdf23e2e6840b736262379606&redirect_uri=http://localhost:9005/kakaologin&response_type=code">

												<img src="/resources/image/kakaologin.png" style="height: 50px; width: 130px;">
											</a>
											<!-- 네이버 로그인 버튼 생성 위치 -->
											<a href="/naver">
												<img src="/resources/image/naverlogin.png" style="height: 50px; width: 130px;" >
											</a>


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
											<div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
												<input type="radio" class="custom-control-input" id="search_1" name="search_chk1"  onclick="search_check(1)" checked="checked">
												<label class="custom-control-label font-weight-bold text-white" for="search_1" style="font-size: 18px; font-weight: bold;">아이디 찾기</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" class="custom-control-input" id="search_2"  name="search_chk2" onclick="search_check(2)">
												<label class="custom-control-label font-weight-bold text-white" for="search_2"style="font-size: 18px; font-weight: bold;">비밀번호 찾기</label>
											</div>
										</div>
										<div id="searchId">
											<div class="form-group">
											<br><br>
												<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
 												<path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z" />
  												<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
													</svg>
													<br><br>
												<h4 class="logintext" style="font-weight:bold;">
													 아이디 찾기
												</h4>
												<br>		
												<input type="text" name="inputname" class="form-style" placeholder="Your Name" id="inputname" autocomplete="off">
												
											</div>
											<div class="form-group mt-2">
												<input type="email" name="inputemail" class="form-style" placeholder="Your Email" id="inputemail" autocomplete="off">
												
											</div>
											<br><br>
											<button id="searchBtn" type="button" onclick="idSearch_click()" class="btnlogin" value="check">ID 찾기</button>
											&nbsp;&nbsp;&nbsp;
											<a class="btn btn-danger btn-block" id="Idfindviewclose" style="text-decoration: none; border-radius: 20px;">로그인하러가기</a>
										</div>


										<div id="searchPass" style="display: none;">
											<div class="section text-center">
											<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
 											 <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z" />
											</svg>
											<br><br>
												<h4 class="logintext" style="font-weight:bold;">
													 비밀번호 찾기
												</h4>
												<div class="form-group">
													<input type="text" name="inputId" class="form-style" placeholder="Your ID" id="inputId" autocomplete="off">
													
												</div>
												<div class="form-group mt-2">
													<input type="email" name="inputemail2" class="form-style" placeholder="Your Email" id="inputemail2" autocomplete="off">
													
												</div>
												<div class="form-group mt-2">
													<div class="mail_check_input_box" id="mail_check_input_box_false">
														<input class="form-style" id="certi" type="text" name="certi" title="인증번호 입력" placeholder="인증번호 입력"disabled required />
													</div>
													<br>
													<button type="button" class="btn btn-outline-danger btn-sm px-3" id="emailChkpass" class="doubleChk">
														&nbsp;인증번호 보내기
													</button>
													&nbsp;
													<button type="button" class="btn btn-outline-info btn-sm px-3" id="emailChk2" class="doubleChk">
														&nbsp;확인
													</button>
													&nbsp;<br>
													<input type="hidden" id="emailDoubleChk" />
													<span class="point successEmailChk" style="color: red;">이메일 입력후 인증번호 보내기를 해주십시오.</span>
													<input type="hidden" id="emailDoubleChk" />
													<div class="check_font" id="email_check"></div>
													<br>


												</div>
											</div>
											<button type="button" class="btnlogin" id="searchBtn2" onclick="passwordSerch_click()">Password 찾기</button>
											<a class="btn btn-danger btn-block" id="passfindviewclose" style="text-decoration: none; border-radius: 20px;">로그인하러가기</a>
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
						<h5 class="modal-title" id="Idtitle" style="color: white;">ID 찾기</h5>
						<a class="btn-close" id="Idresultviewclose" aria-label="Close" style="color: white;"></a>
					</div>
					<h4>
						<b style="color: white;">ID 찾기 안내</b>
					</h4>
					<br>
					<h2 id="id_value" style="color: white;"></h2>
					<br> 
			<div id="pwSearch_chk" style="display:none;">
					<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
						<b style="color: white;" >비밀번호 찾기</b>
					</button>
				</div>
				<div id="idSearch_chk" style="display:none;">
					<button type="button" id="IdreSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
						<b style="color: white;" >ID 찾기</b>
					</button>
				</div>
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
						<a class="btn-close" id="passlogins" aria-label="Close" style="color: white; border: white;"></a>
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
						<h5 class="modal-title" id="Idtitle" style="color: white;">정보 입력 오류</h5>
						<a class="btn-close" id="passloginA" aria-label="Close" style="color: white; border: white;"></a>
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
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script type="text/javascript">
		//로그인 모달 창

		$(".loginview").click(function() {
			$("#loginview").modal();
		});

		//로그인 실패시
		let loginfail = "${loginfail}";
		if (loginfail == "1") {
			alert("로그인 실패! 아이디/패스워드를 다시 확인해주세요.");
		}
		//카카오 처음 로그인시 회원가입



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
		function kakaologout() {

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
				$("input:radio[id='search_2']").prop("checked", false);
				document.getElementById("searchPass").style.display = "none";
				document.getElementById("searchId").style.display = "";
				$("input:radio[id='search_1']").prop("checked", true);
				
			

			} if(num== '2') {
				$("input:radio[id='search_1']").prop("checked", false);
				document.getElementById("searchId").style.display = "none";
				document.getElementById("searchPass").style.display = "";
				$("input:radio[id='search_2']").prop("checked", true);
				
			
			}
		} 
		
		// 아이디 찾기 실패시 id찾기로 이동
		$("#IdreSearch_btn").click(function() {
			$('#Idfindview').show();
			$('#Idresultview').hide();
			search_check(1);

		});
		
		//아이디 찾기 완료후 비밀번호찾기로 이동 
		$("#pwSearch_btn").click(function() {
			$('#Idfindview').show();
			$('#Idresultview').hide();
			search_check(2);
			


		});
		///이메일 인증 발송
		var code = "code";
		$("#emailChkpass")
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
		 if (event.target == $('#Idresultview').get(0)) {	
		 				}
			if (event.target == $('.modal').get(0)) {
			}
			 if (event.target == $('#Idfindview').get(0)) {	
				}
			 if (event.target == $('#Idpassview').get(0)) {	
				}
		});
		//아이디 패스워드 찾기 모달 창 띄우기
		$('#idpassview').click(function() {
			$('#loginview').hide();
			$('#Idfindview').show();

		});
		//아이디 찾기 모달 창 띄우기
		$('#Idfindviewclose').click(function() {
			$('#loginview').show();
			$('#Idfindview').hide();
		});
		// 아이디 찾기 결과 모달 창 띄우기
		$('#Idresultviewclose').click(function() {
			$('#Idresultview').hide();
			$('#passresultview').hide();
		});
		// 패스워드 찾기 결과 모달 창 띄우기
		$('#passfindviewclose').click(function() {
			$('#Idfindview').hide();
			$('#loginview').show();
		});
		//패스워드 찾기 후 x버튼 창끄고 로그인화면띄우기
		$('#passlogins').click(function() {
			$('#passresultview').hide();
			$('#loginview').show();
		});
		//모달 종료후 로그인창
		$('#passloginA').click(function() {
			$('#passusercheck').hide();
			$('#loginview').show();
		});

		
		var findchk="";
		// 이름과 이메일 값 받고 출력하는 ajax 
		var info = "";
		var idSearch_click = function() {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/userSearch?name="
						+ $('#inputname').val() + "&email="
						+ $('#inputemail').val(),
				success : function(data) {
					if (data == 0) {
						$('#id_value').text("회원 정보를 확인해주세요!");
						document.getElementById("idSearch_chk").style.display="";
						document.getElementById("pwSearch_chk").style.display="none";
					} else {
						info = "ID:" + data;
						$('#id_value').text(info);
						document.getElementById("pwSearch_chk").style.display="";
						document.getElementById("idSearch_chk").style.display="none";
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
		
		//naver 로그인.
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "wmxTFuijyRLQbSXlc64_",
			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl : "http://localhost:9005/naverlogin",
			// 본인의 callBack url로 수정하세요.

		// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		});
		naverLogin.init();
	</script>
</body>

</html>