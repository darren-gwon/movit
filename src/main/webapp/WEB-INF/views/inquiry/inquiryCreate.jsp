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
		<label>SUPPORT INQUIRY SELECT</label>
		<br>
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
			<label>1:1 문의글 TITLE</label>
			<br>
				<input type="text" name="title" placeholder="title 입력해주세요" style="width: 600px; height: 50px;">		
			<br><br>
		
			<label>1:1 문의글 CONTENT</label>
			<br>
				<input type="text" name="content" placeholder="content 작성해주세요." style="width: 600px; height: 600px; font-size: 20px;">
		<br><br>
		<hr>
		<br><br>
		<button type="submit" style="width: 100px; height: 50px; margin-left: 10px">등록</button>
		<button type="button" style="width: 100px; height: 50px; margin-left: 10px"><a href="/semiproj/inquiry/list">돌아가기</a></button>
		</form>
</body>
</html>