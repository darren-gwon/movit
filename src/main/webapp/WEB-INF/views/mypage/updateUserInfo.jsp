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
	#wrap {
	    width:500px;
	    margin : 0 auto ;
	    border: 0px solid #000;
	}
	
	table.type09 {
		border-collapse: collapse;
		text-align: left;
		line-height: 1.5;
	}
	
	table.type09 thead th {
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		color: #369;
		border-bottom: 3px solid #036;
	}
	
	table.type09 tbody th {
		width: 150px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		background: #f3f6f7;
	}
	
	table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	}
</style>
<script type="text/javascript">
$(function(){
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
	$("#submit").click(function(){
		
	});
});
</script>
</head>
<body>
	<form action="updateMypage" method="post">
	<div id="wrap">
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
						<input type="hidden" class="form-control" name="seq" value="${dto.seq }">
						<input type="hidden" class="form-control" name="name" value="${dto.name }">
					</td> 
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<span name="user_id" class="form-control">${sessionScope.user_id }</span>
						<input type="hidden" class="form-control" name="user_id" value="${sessionScope.user_id }">
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickname" class="form-control" value="${dto.nickname}"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<span name="birthday1" class="form-control">${birthday1 }년</span>
						<span name="birthday2" class="form-control">${birthday2 }월</span> 
						<span name="birthday3" class="form-control">${birthday3 }일</span>
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<select id="phoneSelector"">
							<option <c:if test="${phone1==010 }">selected</c:if>>010</option>
							<option <c:if test="${phone1==011 }">selected</c:if>>011</option>
							<option <c:if test="${phone1==016 }">selected</c:if>>016</option>
							<option <c:if test="${phone1==017 }">selected</c:if>>017</option>
							<option <c:if test="${phone1==018 }">selected</c:if>>018</option>
							<option <c:if test="${phone1==019 }">selected</c:if>>019</option>
						</select>
						<input type="text" class="form-control" name="phone1" id="phone1" value=${phone1 }>
						&nbsp;-&nbsp;<input class="form-control" name="phone2" id="phone2" value=${phone2 } style="width:40px;">&nbsp;-&nbsp;<input class="form-control" name="phone3" id="phone3" value=${phone3 } style="width:40px;">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input class="form-control" name="email1" id="email1" value=${email1 } style="width:100px;">@
						<input class="form-control" name="email2" id="email2" value=${email2 } style="width:100px;">
						<select id="email3">
							<option value="-">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="daum.net">다음</option>
							<option value="gmail.com">구글</option>
						</select>
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
		<button type="submit" id="submit">수정</button>
		<button type="button" onclick="history.back()">취소</button>
	</div>
	</form>
</body>
</html>