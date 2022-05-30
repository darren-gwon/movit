<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
	<h2>Detail Page Update</h2>
	<form name="update" method="post" action="update?seq=${data.seq}">
	<input type="hidden" value="${data.seq}">
	<div>질문타입 : 
	<select name="inquiry_type" style="width: 500px; height: 50px;">
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
	</div>
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
	
	<div>
		<input type="submit" value="완료"/>
		<input type="reset" value="리셋"/>
		<button type="button" style="width: 100px; height: 50px; margin-left: 10px"><a href="/semiproj/inquiry/faq">돌아가기</a></button>
	</div>
	</form>
</body>
</html>