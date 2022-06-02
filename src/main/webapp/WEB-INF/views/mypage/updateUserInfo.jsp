<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
	#userinfo {
		width: 1000px;
	    margin : 0 auto ;
	    border: 0px solid #000;
	}
	
	table.type09 {
		border-collapse: collapse;
		text-align: left;
		line-height: 1.5;
		margin : 0 auto ;
	}
	
	table.type09 thead th {
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		color: #369;
		border-bottom: 3px solid #036;
	}
	
	table.type09 tbody th {
		width: 100px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		background: #f3f6f7;
	}
	
	table.type09 td {
		width: 400px;
		padding: 10px;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
	}
	input[type=text] {
		border-radius: 5px;
		border: 1px solid black;
		padding: 0.5px;
		padding-left: 1px;
		text-align: center;
	}
	
	button{
		background-color: #193170;
		border: none;
		color: white;
		padding: 2px 5px;
		text-decoration: none;
		text-align: center;
		border-radius: 5px;
	}
	#submit, #cancle{
		padding: 8px 13px;
		font-size: 1.2rem;
	}
</style>
<script type="text/javascript">
$(function(){
	$("#auth").hide();
	
	//한번 건드린건 false적용
	$("#nickname").change(function(){
		$("#certNick").val("false");
	});
	$("#email1").change(function(){
		$("#certEmail").val("false");
	});
	$("#email2").change(function(){
		$("#certEmail").val("false");
	});
	
	//닉네임 중복확인
	$("#nickCheck").click(function(){
		var nick = $("#nickname").val();
		console.log(nick);
		console.log(1);
		$.ajax({
			type : "get",
			url : "checkNickName",
			data : "nickname="+nick,
			success : function(data) {
				if(data == 1) {
					alert("존재하는 별명입니다.");
					$("#nickCheck").val("");
					$("#nickCheck").focus();
					$("#certNick").val("false");
				} else {
					alert("사용가능한 별명입니다.");
					$("#certNick").val("true");
				}
			}
		});
	});
	
	//이메일
	$("#email3").change(function(){
		var s = $(this).val();
		if(s=='-'){
			$("#email2").val("");
			$("#email2").focus();
		} else {
			$("#email2").val(s);
		}
	});
	
	//이메일 중복확인
	var code = "";
	$("#emailChk").click(function() {
		var email = $("#email1").val()+"@"+$("#email2").val();
		console.log(email);
		$.ajax({
			type : "get",
			url : "mailCheck?email=" + email,
			success : function(data) {
				let checkEmail = "${checkEmail}";
		
				if(data == "1") {
					alert("이미 가입된 이메일입니다.");
					$("#email1").val("");
					$("#email2").val("");
					$("#email1").focus();
				} else {
					alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
					$("#auth").show();
					$("#emailChk2").css("display", "inline-block");
					$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
					$(".successEmailChk").css("color", "#193170");
					code = data;
					console.log(code);
				}
			}
		});
	});

		$("#emailChk2").click(function() {
			if ($("#email4").val() == code) {
				$(".successEmailChk").text(" 인증번호가 일치합니다.");
				$(".successEmailChk").css("color", "green");
				$("#certEmail").val("true");
			} else {
				$(".successEmailChk").text(" 인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
				$(".successEmailChk").css("color", "red");
				$("#certEmail").val("false");
			}
		});
		
	//휴대전화
	$("#phoneSelector").change(function(){
		var s = $(this).val();
		$("#phone1").val(s);
	});
	
	//생년월일
	$("#birthdaySelector1").change(function(){
		var s = $(this).val();
		$("#birthdaySelector1").val(s);
	});
	$("#birthdaySelector2").change(function(){
		var s = $(this).val();
		$("#birthdaySelector2").val(s);
	});
	$("#birthdaySelector3").change(function(){
		var s = $(this).val();
		$("#birthdaySelector3").val(s);
	});
	
	//submit버튼이벤트(이메일 인증 확인 조건넣기)
	
});
function chkSubmit() {
	var email = $("#certEmail").val();
	var nick = $("#certNick").val();
	console.log(email, nick)
	if(email != "false" && nick == "false") {
		alert("중복확인이 필요합니다.");
		return false;
	} else {
		alert("성공적으로 회원정보가 변경되었습니다.")
		return true;
	}
	
}
</script>
</head>
<body>
	<jsp:include page="mypageHeader.jsp"/>
	<form action="updateMypage" method="post" onsubmit="return chkSubmit()">
	<div class="content" id="userinfo">
		<table class="type09">
			<thead>
				<tr>
					<th>기본정보</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>이름</th>
					<td>
						<span>${dto.name }</span>
						<input type="hidden" name="seq" value="${dto.seq }">
						<input type="hidden" name="name" value="${dto.name }">
					</td> 
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<span name="user_id">${sessionScope.user_id }</span>
						<input type="hidden" name="user_id" value="${sessionScope.user_id }">
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" id="nickname" name="nickname" value="${dto.nickname}" style="width:150px;">
						<button type="button" id="nickCheck">중복확인</button>
						<input type="hidden" id="certNick" value="">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<span name="birthday1" style="width:100px;">${birthday1 }년</span>
						<span name="birthday2" style="width:100px;">${birthday2 }월</span> 
						<span name="birthday3" style="width:100px;">${birthday3 }일</span>
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td style="float:left">
						<select id="phoneSelector" style="text-align:center;width:70px;">
							<option <c:if test="${phone1==010 }">selected</c:if>>010</option>
							<option <c:if test="${phone1==011 }">selected</c:if>>011</option>
							<option <c:if test="${phone1==016 }">selected</c:if>>016</option>
							<option <c:if test="${phone1==017 }">selected</c:if>>017</option>
							<option <c:if test="${phone1==018 }">selected</c:if>>018</option>
							<option <c:if test="${phone1==019 }">selected</c:if>>019</option>
						</select>
						<input type="hidden" maxlength="4" name="phone1" id="phone1" value=${phone1 } style="width:80px;">
						&nbsp;-&nbsp;<input type="text" maxlength="4" name="phone2" id="phone2" value=${phone2 } style="width:70px;">&nbsp;-&nbsp;<input type="text" maxlength="4" name="phone3" id="phone3" value=${phone3 } style="width:70px;">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email1" id="email1" value=${email1 } style="width:100px;">@
						<input type="text" name="email2" id="email2" value=${email2 } style="width:100px;">
						<select id="email3">
							<option value="-">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="daum.net">다음</option>
							<option value="gmail.com">구글</option>
						</select>
						<button type="button" id="emailChk">중복확인</button>
						<input type="hidden" id="certEmail"value="">
					</td>
				</tr>
				<tr id="auth">
					<th>이메일 인증</th>
					<td>
						<b>인증번호를 메일에서 확인하여 입력해 주세요</b>
						<input type="text" name="email4" id="email4" style="width:100px;">
						<button type="button" id="emailChk2">인증하기</button>
						<span class="successEmailChk"></span>
						
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<!-- <div style="background-color:cyan;cursor:pointer;width:110px;" type="button" onclick="location.href='/mypage/pwUpdateView'">비밀번호 변경</div> -->
						<button type="button" onclick="location.href='/mypage/pwUpdateView'">비밀번호 변경</button>
					</td>
				</tr>
			</tbody>
		</table>
		<br><br>
		<button type="submit" id="submit">수정</button>
		&nbsp;&nbsp;&nbsp;<button type="button" id="cancle" onclick="history.back()">취소</button>
	</div>
	</form>
</body>
</html>