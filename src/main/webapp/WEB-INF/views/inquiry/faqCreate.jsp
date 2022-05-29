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
		<form action="insert" method="post">
		<h2>Create Page</h2>
		<hr>
		<br><br>
		<label>FAQ TYPE SELECT</label>
		<br>
			<select name="inquiry_type" style="width: 600px; height: 50px;">
    			<option value="">FAQ title 타입선택</option>
    			<option value="영화예매">영화예매</option>
    			<option value="할인혜택">할인혜택</option>
    			<option value="결제수단">결제수단</option>
    			<option value="멤버십">멤버십</option>
    			<option value="VIP">VIP</option>
    			<option value="극장">극장</option>
    			<option value="특별관">특별관</option>
    			<option value="홈페이지">홈페이지</option>
			</select>
			<br><br>
			<label>FAQ TITLE</label>
			<br>
				<input type="text" name="title" placeholder="title 입력해주세요" style="width: 600px; height: 50px;">		
			<br><br>
		
			<label>FAQ CONTENT</label>
			<br>
				<input type="text" name="content" placeholder="content 작성해주세요." style="width: 600px; height: 600px; font-size: 20px;">
		<br><br>
		<hr>
		<br><br>
		<button type="submit" style="width: 100px; height: 50px; margin-left: 10px">등록</button>
		<button type="button" style="width: 100px; height: 50px; margin-left: 10px"><a href="/semiproj/inquiry/faq">돌아가기</a></button>
		</form>
</body>
</html>