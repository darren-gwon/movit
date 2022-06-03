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
	<div class="container2">
		<div class="content2" style="margin-top: 5%;">
			<center>
				<h1 id="title">kakao 유저 회원가입</h1>
				<form id=frm  class="form-inlie" >
					<div>
						<center>
							<div>
								<p style="font-size: 25px;">
									;Movit 회원가입에 <br>오신걸환영합니다.
								</p>
							</div>
							<div>
								<h4>생년월일</h4>
								<div style="margin-bottom: 0px;" id="hiddenbirthday" class="int">
									<p style="float: left;" id="msgbirthday"></p>
								</div>
								<input type="date" class="int" name="birthday" id="birthday" onblur="isBirthday(this.value)" required="required">
								<input type="hidden" id="birthdaycheck" class="int">
							</div>
							<div>
								<h4>별명</h4>
								<div style="margin-bottom: 0px;" id="hiddennickname" class="int">
									<p style="float: left;" id="msgnickname"></p>
								</div>
								<input type="text" class="int" name="nickname" id="nickname" placeholder="별명" onblur="isNickname(this.value)" required="required">
								<span class="glyphicon glyphicon-user"></span>
								<input type="hidden" id="nicknamecheck" class="int">
							</div>
							<div>
								<h4>성별</h4>
								<div style="margin-bottom: 0px;" id="hiddengender" class="int">
									<p style="float: left;" id="msggender"></p>
								</div>
								<select id="genderselect" class="int" name="gender" onblur="isGender(this.value)" required="required">
									<option value=미정 selected="selected">구분</option>
									<option value=남자>남자</option>
									<option value=여자>여자</option>
							</select>
								<input type="hidden" id="gendercheck" class="int">
							</div>
							<h4>휴대폰번호</h4>
							<input type="hidden" id="phonecheck">
							<div style="margin-bottom: 0px;" id="hiddenphone" class="int">
								<p style="float: left;" id="msgphone"></p>
							</div>
							<div style="margin-bottom: 0px;" id=hiddenphone>
								<tr>
									<td colspan="3">
										<input type="hidden" id="phone" name="phone" class=int>
										<select id="phone1" name="phone1" style="width: 80px; padding: 5px;" class=int>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										&nbsp;&nbsp;&nbsp;<b>-</b>&nbsp;&nbsp;&nbsp;
										<input name="phone2" id="phone2" maxlength="4" type="input" style="width: 80px;">
										&nbsp;&nbsp;&nbsp;<b>-</b> &nbsp;&nbsp;&nbsp;&nbsp;
										<input name="phone3" id="phone3" maxlength="4" type="input" style="width: 80px" onblur="isPhone(this.value)">
									</td>
								</tr>
							</div>
					</div>
					<div>
						<button type="button" class="btn btn-primary btn-block reg" style="background: #5673bd; border-radius: 25px; font-size: 18px; font-weight: bold;width: 100%; height: 55px;" id="RegSuccess">가입하기</button>
						<br>
						<br> <br>
					</div>
			
			</form>
			</center>
		</div>
	</div>
	

	<script>
	
	

		function showMsgbirthday(message) {
			const msgbirthday = document.getElementById("msgbirthday");
			msgbirthday.innerHTML = message;

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


		$("#RegSuccess").click(function() {

							if (	$("#birthdaycheck").attr('value') == "true"
									&& $("#nicknamecheck").attr('value') == "true"
									&& $("#gendercheck").attr('value') == "true"
									&& $("#phonecheck").attr('value') == "true") {

								let form = document.getElementById("frm");
								form.setAttribute("action", "/kakaoreg");
								form.setAttribute("method", "post");
								form.submit();

								alert(
										${sessionScope.kakaoN}+"님 환영합니다. 선택해주셔서 감사합니다 ");

							} else {
								alert("회원가입을 완료할 수 없습니다. 다시한번 확인해주십시오.");

								return false
							}
							error
						});
	</script>
</body>
</html>

