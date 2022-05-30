<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    
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
		<h2>분실물 문의</h2>
		<hr>
		<p>;mobit에서 잃어버린 물건이 있다면 '＃분실문 문의/접수'를 통해 접수해주세요.</p>
		<p>접수하신 글이 답변 처리중이거나 답변 완료가 될 시에는 알려드립니다.</p>
		<hr>
		<br><br>
		<label>분실 장소</label>
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
			<label>분실물 타입</label>
			<br>
				<input type="text" name="item_type" placeholder="고객님의 분실물 타입을 입력해주세요" style="width: 600px; height: 50px;">		
			<br><br>
			<label>글 제목</label>
			<br>
				<input type="text" name="title" placeholder="분실물 글 제목을 입력해주세요" style="width: 600px; height: 50px;">		
			<br><br>
				<label>분실 날짜</label>
			<br>
				<input type="date" name="lost_date" id="lost_date"> 
				
			<br><br>			
				<label>상세 내용</label>
			<br>
				<input type="text" name="content" placeholder="분실물 글 내용을 작성해주세요." style="width: 600px; height: 300px;">
			<br><br>
				<label>접수 상태</label>
			<br>
				<select name="status" style="width: 600px; height: 50px;">
    				<option value="">접수 처리 타입 선택</option>
    				<option value="01">1</option>
    				<option value="02">2</option>
    			</select>
    		
    			
		<hr>
		<br><br>
		<button type="submit" style="width: 100px; height: 50px; margin-left: 10px">등록</button>
		<button type="button" style="width: 100px; height: 50px; margin-left: 10px"><a href="/semiproj/inquiry/lost">돌아가기</a></button>
		</form>

</body>
</html>