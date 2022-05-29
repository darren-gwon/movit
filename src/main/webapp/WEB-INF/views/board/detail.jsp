<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#del").click(function(){
		var de=confirm("게시글을 삭제합니다");
		
		if (de){
	         return location.href="delete?num="+${dto.seq};
				}
			});
	});
</script>

</head>
<body>
<h1>상세내용</h1>

	<table border="1">

	<tr>
		<th>제목</th>
		<td style="width:100px;">${dto.title}</td>
		<th>극장</th>
		<td style="width:100px;">${dto.type}</td>
		<th>작성일</th>
		<th style="width:100px;">${dto.write_date}<%--  <fmt:formatDate value="${dto.writedate}" pattern="yyyy-MM-dd"/>--%></th>
		<th>조회수</th>
		<th style="width:100px;">${dto.view_cnt}</th>
	</tr>
	<tr>
		<td colspan="8" style="height:500px;">${dto.content}</td>
	</tr>
	
	<button onclick="location.href='../board/updateform?num=${dto.seq}'">수정</button>
	<button type="button" id="del" >삭제</button>
	<button onclick="location.href='list'">목록</button>
</table>

</body>
</html>