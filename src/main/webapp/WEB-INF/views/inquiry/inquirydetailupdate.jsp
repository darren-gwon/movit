<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
		body
		{
			border: 1px solid black;
			width: 800px;
			height: 1100px;
		}
		th
		{
			border: 1px solid black;
		}
		td
		{
			border: 1px solid black;
		}
	</style>
<meta charset="UTF-8">
</head>
<body>
		<form name="inquiryupdate" method="post" action="update?seq=${data.seq}">
		<input type="hidden" value="${data.seq}">
		<h2>Create Page</h2>
		<hr>
		<br><br>
		<label>INQUIRY TYPE SELECT</label>
			<br>
    		<select name="theaterID" style="width: 600px; height: 50px;">
    			<option value="">분실 장소</option>
    			<option value="01">1</option>
    			<option value="02">2</option>
    			<option value="03">3</option>
    			<option value="04">4</option>
    			<option value="05">5</option>
    			<option value="06">6</option>
    			<option value="07">7</option>
    		</select>
			<br><br>
			<select name="inquiry_type" style="width: 600px; height: 50px;">
    			<option value="">질문 타입선택</option>
    			<option value="일반문의">일반문의</option>
    			<option value="칭찬">칭찬</option>
    			<option value="불만사항">불만사항</option>
    			<option value="영화예매">영화예매</option>
    			<option value="할인혜택">할인혜택</option>
    			<option value="홈페이지">홈페이지</option>
    			<option value="기타">기타</option>
			</select>
			<br><br>
			<hr>
	<div>글제목</div>
	<br>
	<div><input name="title" value="${data.title}" type="text" style="width: 600px; height: 30px;"/></div>
	<br>
	<div>글내용</div>
	<br>
	<div><input name="content" value="${data.content}" type="text" style="width: 600px; height: 600px;"/></div>
	<br>
	<div>작성일자</div>
	<br>
	<div><fmt:formatDate value="${data.write_date}" pattern="yyyy-MM-dd" /></div>

	<br>
	<hr>
	<br>
		<br><br>
		<div>
			<input type="submit" value="완료"/>
			<input type="reset" value="리셋"/>
			<button type="button" style="width: 100px; height: 50px; margin-left: 10px"><a href="/semiproj/inquiry/list">돌아가기</a></button>
		</div>
		</form>
</body>
</html>