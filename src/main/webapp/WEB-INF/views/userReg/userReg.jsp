<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/5d8badcf1a.js" crossorigin="anonymous"></script>
<link href="/resources/css/userReg.css" rel='stylesheet' />
<c:set var="root" value="<%=request.getContextPath()%>" />
</head>
<body>
	<div class="container">
		<div class="content" style="margin-top: 5%;">
			<center>
				<h1 id="title">회원가입</h1>
				<form id=frm style="width: 80%;" class="form-inlie">
					<div>
						<center>
							<div>
								<p style="font-size: 25px;">
									;Movit 회원가입에 <br>오신걸환영합니다.
								</p>
							</div>
							<div>
								<br>
								<h4>아이디</h4>
								<div style="margin-bottom: 0px;" id="hiddenid">
									<p style="float: left;" id="msgid"></p>
								</div>
								<input type="text" name="user_id" id="user_id" class="int" placeholder="아아디" onblur="isId(this.value)" required="required">
								<input type="hidden" id="idcheck">

							</div>

							<div>
								<h4>비밀번호</h4>
								<div style="margin-bottom: 0px;" id="hiddenpass">
									<p style="float: left;" id="msgpassword"></p>
								</div>
								<input type="password" class="int" name="password" id="password" placeholder="비밀번호" onkeyup="isPassword(this.value)" required="required">
								<span class="glyphicon glyphicon-lock"></span>
								<input type="hidden" id="passcheck">
							</div>

							<div>
								<h4>비밀번호 확인</h4>
								<div style="margin-bottom: 0px;" id="hiddenpasscheck">
									<p style="float: left;" id="msgpasswordcheck"></p>
								</div>
								<input type="password" class="int" id="passwordCheck" placeholder="비밀번호 확인" onkeyup="isPasswordEqual()" required="required">
								<input type="hidden" id=passcheck1>
							</div>

							<div>
								<h4>생년월일</h4>
								<div style="margin-bottom: 0px;" id="hiddenbirthday">
									<p style="float: left;" id="msgbirthday"></p>
								</div>
								<input type="date" class="int" name="birthday" id="birthday" onblur="isBirthday(this.value)" required="required">
								<input type="hidden" id="birthdaycheck">
							</div>

							<div>
								<h4>이름</h4>
								<div style="margin-bottom: 0px;" id="hiddenname">
									<input type="hidden" id=namecheck class="chk">
									<p style="float: left;" id="msgname"></p>
								</div>
								<input type="text" name="name" class="int" name="name" id="name" placeholder="이름" onblur="isName(this.value)" required="required">
								<input type="hidden" id="namecheck">
							</div>

							<div>
								<h4>별명</h4>
								<div style="margin-bottom: 0px;" id="hiddennickname">
									<p style="float: left;" id="msgnickname"></p>
								</div>
								<input type="text" class="int" name="nickname" id="nickname" placeholder="별명" onblur="isNickname(this.value)" required="required">
								<span class="glyphicon glyphicon-user"></span>
								<input type="hidden" id="nicknamecheck">
							</div>

							<div>
								<h4>성별</h4>
								<div style="margin-bottom: 0px;" id="hiddengender">
									<p style="float: left;" id="msggender"></p>
								</div>
								<select id="genderselect" class="int" name="gender" onblur="isGender(this.value)" required="required">
									<option value=미정 selected="selected">구분</option>
									<option value=남자>남자</option>
									<option value=여자>여자</option>
								</select>
								<input type="hidden" id="gendercheck">
							</div>

							<h4>휴대폰번호</h4>
							<input type="hidden" id="phonecheck">
							<div style="margin-bottom: 0px;" id="hiddenphone">
								<p style="float: left;" id="msgphone"></p>
							</div>

							<div style="margin-bottom: 0px;" id=hiddenphone>
								<tr>
									<td colspan="3">
										<input type="hidden" id="phone" name="phone" class=int>
										<select id="phone1" name="phone1" style="width: 80px; padding: 10px;" class=int>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										&nbsp;&nbsp;&nbsp;<b>-</b>&nbsp;&nbsp;&nbsp;
										<input name="phone2" id="phone2" maxlength="4" type="input" style="width: 100px;">
										&nbsp;&nbsp;&nbsp;<b>-</b> &nbsp;&nbsp;&nbsp;&nbsp;
										<input name="phone3" id="phone3" maxlength="4" type="input" style="width: 100px" onblur="isPhone(this.value)">
									</td>
								</tr>
							</div>

							<div>
								<h4>이메일</h4>
								<div style="margin-bottom: 0px;" id=hiddenemail>
									<p style="float: left;" id="msgemail"></p>
								</div>

								<input type="hidden" id=emailcheck>
								<input type="text" class="form-control int" name="email" id="email" placeholder="E-mail" onblur="isEmail(this.value)" title="이메일 주소를 입력해주세요." required="required">
								<div class="mail_check_input_box" id="mail_check_input_box_false">
									<input id="certi" type="text" name="certi" title="인증번호 입력" disabled required />
								</div>

								<button type="button" class="btn btn-outline-danger btn-sm px-3" id="emailChk" class="doubleChk">
									<i class="bi bi-envelope-check"></i>&nbsp;인증번호 보내기
								</button>
								&nbsp;
								<button type="button" class="btn btn-outline-info btn-sm px-3" id="emailChk2" class="doubleChk">
									<i class="bi bi-envelope-check"></i>&nbsp;확인
								</button>
								&nbsp;
								<input type="hidden" id="emailDoubleChk" />
								<br> <span class="point successEmailChk" style="color: red;">이메일 입력후 인증번호 보내기를 해주십시오.</span>
								
								<p class="tip" style="color: red;">아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오.</p>
								<div class="check_font" id="email_check"></div>
							</div>
					</div>
					<div>
						<button type="button" class="btn btn-primary btn-block" style="background: #5673bd; border-radius: 25px;" id="RegSuccess">가입하기</button>
						<br>
						<a href="login" class="text-center">이미 회원이십니까?</a>
						<br> <br>
					</div>
			
			</form>
			</center>
		</div>
	</div>

	<script>
	
	
		function showMsg(message) {
			const msg = document.getElementById("msg");
			msg.innerHTML = message;

		}

		function showMsgid(message) {
			const msgid = document.getElementById("msgid");
			msgid.innerHTML = message;

		}
		function showMsgpassword(message) {
			const msgpassword = document.getElementById("msgpassword");
			msgpassword.innerHTML = message;

		}
		function showMsgpasswordcheck(message) {
			const msgpasswordcheck = document
					.getElementById("msgpasswordcheck");
			msgpasswordcheck.innerHTML = message;

		}

		function showMsgbirthday(message) {
			const msgbirthday = document.getElementById("msgbirthday");
			msgbirthday.innerHTML = message;

		}

		function showMsgname(message) {
			const msgname = document.getElementById("msgname");

			msgname.innerHTML = message;

		}

		function showMsgnickname(message) {
			const msgnickname = document.getElementById("msgnickname");

			msgnickname.innerHTML = message;

		}
		function showMsggender(message) {
			const msggender = document.getElementById("msggender");

			msggender.innerHTML = message;

		}
		function showMsgphone(message) {
			const msgphone = document.getElementById("msgphone");

			msgphone.innerHTML = message;

		}

		function showMsgemail(message) {
			const msgemail = document.getElementById("msgemail");

			msgemail.innerHTML = message;

		}

		function isId(asValue) {
			var user_id = $('#user_id').val();
			var regExp = /^[a-z]+[a-z0-9_]{5,20}$/g;
			$.ajax({
						url : '${pageContext.request.contextPath}/user/idCheck?userId='
								+ user_id,
						type : 'post',
						success : function(data) {
							console.log("1 = 중복o / 0 = 중복x : " + data);

							if (data == 1) {
								// 1 : 아이디가 중복되는 문구
								$('#hiddenid').attr('style',
										'margin-bottom:35px;');
								showMsgid("아이디가 이미 있습니다.");
							} else {
								if (!regExp.test(asValue)) {
									$('#hiddenid').attr('style',
											'margin-bottom:50px;');
									showMsgid("아이디는 영문으로 시작하는 5~20자의<br>영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.");
									$('#idcheck').attr('value', 'false');
									return false;
								} else {
									showMsgid("");
									$('#hiddenid').attr('style',
											'margin-bottom:0px;');
									$('#idcheck').attr('value', 'true');

									return true;
								}
							}
						}
					});
		}

		function isPassword(asValue) {
			var regExp = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
			if (!regExp.test(asValue)) {
				$('#hiddenpass').attr('style', 'margin-bottom:55px;');
				$('#passcheck').attr('value', 'false');
				showMsgpassword("비밀번호는 8~16자 영문 대 소문자, 숫자<br> 최소 하나 이상의 특수문자를 사용하세요.");
				return false;
			} else {
				$('#hiddenpass').attr('style', 'margin-bottom:0px;');
				$('#passcheck').attr('value', 'true');

				showMsgpassword("");
				return true;
			}
		}

		function isPasswordEqual() {
			const pwd = document.getElementById("password").value;
			const pwd2 = document.getElementById("passwordCheck").value;

			if (pwd != pwd2) {
				$('#hiddenpasscheck').attr('style', 'margin-bottom:55px;');
				$('#passcheck1').attr('value', 'false');

				showMsgpasswordcheck("비밀번호가 일치하지 않습니다.");
				return false;
			} else {
				$('#hiddenpasscheck').attr('style', 'margin-bottom:0px;');
				$('#passcheck1').attr('value', 'true');
				showMsgpasswordcheck("");
				return true;
			}
		}
		function isBirthday(asValue) {
			var birthday = document.getElementById("birthday").value;
			if (birthday == null || birthday == '') {
				$('#hiddenbirthday').attr('style', 'margin-bottom:55px;');
				$('#birthdaycheck').attr('value', 'false');
				showMsgbirthday("생일을 입력해주세요.");
				return false;
			} else {
				showMsgbirthday("");
				$('#hiddenbirthday').attr('style', 'margin-bottom:0px');
				$('#birthdaycheck').attr('value', 'true');

				return true;
			}
		}

		function isName(asValue) {
			var regExp = /^[가-힣a-zA-Z]/g;
			if (!regExp.test(asValue)) {
				$('#hiddenname').attr('style', 'margin-bottom:55px;');
				$('#namecheck').attr('value', 'false');
				showMsgname("이름을 한글과 영문 대 소문자를 사용하세요.<br>(특수기호, 공백 사용 불가)");
				return false;
			} else {
				$('#hiddenname').attr('style', 'margin-bottom:0px;');
				$('#namecheck').attr('value', 'true');
				showMsgname("");
				return true;
			}
		}

		function isNickname(asValue) {
			var regExp = /^[가-힣a-zA-Z0-9$`~!@$!%*#^?&\\(\\)\-_=+]/g;
			if (!regExp.test(asValue)) {
				$('#hiddennickname').attr('style', 'margin-bottom:55px;');
				$('#nicknamecheck').attr('value', 'false');
				showMsgnickname("별명을 한글과 영문 대 소문자 영어 숫자만 사용하세요.<br>(특수기호, 공백 사용 불가)");
				return false;
			} else {
				$('#hiddennickname').attr('style', 'margin-bottom:0px;');
				$('#nicknamecheck').attr('value', 'true');
				showMsgnickname("");
				return true;
			}
		}

		function isGender(asValue) {
			var gender = document.getElementById("genderselect").value;
			if (gender == "미정" || gender == null) {
				$('#hiddengender').attr('style', 'margin-bottom:55px;');
				$('#gendercheck').attr('value', 'false');
				showMsggender("성별을 입력해주세요.");
				return false;
			}
			if (gender == "남자" || gender == "여자") {
				showMsggender("");
				$('#hiddengender').attr('style', 'margin-bottom:0px;');
				$('#gendercheck').attr('value', 'true');

				return true;
			}
		}

		function isPhone(asValue) {

			$("#phone").val(
					$("#phone1").val() + $("#phone2").val()
							+ $("#phone3").val());

			if ($("#phone").val() == "" || $("#phone").val().length != 11
					|| isNaN($("#phone").val())) {
				$('#hiddenphone').attr('style', 'margin-bottom:55px;');
				$('#phonecheck').attr('value', 'false');
				showMsgphone("휴대폰번호를 정확히 입력해 주세요");

				return;
			}

			else if (isNaN($("#phone").val())) {
				$('#hiddenphone').attr('style', 'margin-bottom:55px;');
				$('#phonecheck').attr('value', 'false');
				showMsgphone("휴대폰번호를 숫자로만 입력해 주세요");

				return;
			}

			for (var i = 0; i < $("#phone").val().length; i++) {

				var chk = $("#phone").val().substring(i, i + 1);

				if (chk == "") {
					$('#hiddenphone').attr('style', 'margin-bottom:55px;');
					$('#phonecheck').attr('value', 'false');
					var fh = $("#phone").val();
					showMsgphone("휴대폰번호를 정확히 입력해주세요");

					return;

				} else {
					$('#hiddenphone').attr('style', 'margin-botto:55px;');
					$('#phonecheck').attr('value', 'true');
					$("#phone").attr(
							'value',
							($("#phone1").val() + "-" + $("#phone2").val()
									+ "-" + $("#phone3").val()));
					showMsgphone("");
				}
			}
		}

		function isEmail(asValue) {
			var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if (!regExp.test(asValue)) {
				$('#hiddenemail').attr('style', 'margin-bottom:55px;');
				$('#emailcheck').attr('value', 'false');
				showMsgemail("이메일 주소를 다시 확인해주세요.");
				return false;
			} else {
				$('#hiddenemail').attr('style', 'margin-bottom:0px;');
				$('#emailcheck').attr('value', 'true');
				showMsgemail("");
				return true;
			}
		}

		//이메일 인증 
		var code = "";
		$("#emailChk")
				.click(
						function() {
							var email = $("#email").val();
							$
									.ajax({
										type : "GET",
										url : "mailCheck?email=" + email,
										success : function(data) {
											let checkEmail = "${checkEmail}";
											
											if (data == "error") {
												alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
												$("#email").attr("autofocus",
														true);
												$(".successEmailChk").text(
														"유효한 이메일 주소를 입력해주세요.");
												$(".successEmailChk").css(
														"color", "red");
											} else if (data == "1") {
												alert("이미 가입된 이메일입니다.");
												$("#email").attr("autofocus",
														true);
												$(".successEmailChk").text(
														"이미 가입된 이메일입니다.");
												$(".successEmailChk").css(
														"color", "red");
											}

											else {
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

		$("#emailChk2").click(function() {
			if ($("#certi").val() == code) {
				$(".successEmailChk").text("인증번호가 일치합니다.");
				$(".successEmailChk").css("color", "green");
				$("#emailDoubleChk").attr('value', 'true');
				$("#certi").attr("disabled", true);

			} else {
				$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".successEmailChk").css("color", "red");
				$("#emailDoubleChk").attr('value', 'false');
				$("#certi").attr("autofocus", true);
			}
		});

		$("#RegSuccess")
				.click(
						function() {

							if ($("#idcheck").attr('value') == "true"
									&& $("#passcheck").attr('value') == "true"
									&& $("#passcheck1").attr('value') == "true"
									&& $("#birthdaycheck").attr('value') == "true"
									&& $("#namecheck").attr('value') == "true"
									&& $("#nicknamecheck").attr('value') == "true"
									&& $("#gendercheck").attr('value') == "true"
									&& $("#phonecheck").attr('value') == "true"
									&& $("#emailcheck").attr('value') == "true"
									&& $("#emailDoubleChk").attr('value') == "true") {

								let form = document.getElementById("frm");
								form.setAttribute("action", "reg");
								form.setAttribute("method", "post");
								form.submit();

								alert($('#user_id').val()
										+ "님 환영합니다. 선택해주셔서 감사합니다 :)");

							} else {
								alert("회원가입을 완료할 수 없습니다. 다시한번 확인해주십시오.");

								return false
							}
							error
						});
	</script>
</body>
</html>

