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
	.content {
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
});
</script>
</head>
<body>
	<div class="content">
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
					<td>${dto.name }</td> 
				</tr>
				<tr>
					<th>아이디</th>
					<td>${sessionScope.user_id }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<select id="birthdaySelector1">
							<option value="">년</option>
							<c:forEach var="i" begin="1900" end="2022">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
						<select id="birthdaySelector2">
							<option value="">월</option>
							<c:forEach var="i" begin="1" end="12">
								<c:choose>
									<c:when test="${i < 10}">
										<option value="${i}">0${i}</option>
									</c:when>
									<c:otherwise>
										<option value="${i}">${i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
							<select id="birthdaySelector3">
							<option value="">일</option>
							<c:forEach var="i" begin="1" end="31">
								<c:choose>
									<c:when test="${i < 10}">
										<option value="${i}">0${i}</option>
									</c:when>
									<c:otherwise>
										<option value="${i}">${i}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<input name="birthday1" id="birthday1" value="${birthday1 }">
						<input name="birthday2" id="birthday2" value="${birthday2 }">
						<input name="birthday3" id="birthday3" value="${birthday3 }">
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
						<input type="text" name="phone1" id="phone1" value=${phone1 }>
						<input name="phone2" id="phone2" value=${phone2 }>-<input name="phone3" id="phone3" value=${phone3 }>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input name="email1" id="email1" value=${email1 }>@<input name="email2" id="email2" value=${email2 }>
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
					<td><button type="button" id="pwdbtn">변경하기</button></td>
				</tr>
			</tbody>
		</table>
		<button type="button">수정</button><button type="button">취소</button>
	</div>
</body>
</html>