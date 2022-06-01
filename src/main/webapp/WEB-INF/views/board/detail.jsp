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
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
<style>
	.content {
		position: relative;
		margin-top:200px;
		background-color:;
	}
	.form{
	width:1100px;
	text-align:center;
	margin:auto;
	}	
</style>
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
<div class="content">
<div class="form">
   <table class="table table-hover">
		<tr>
		<td colspan="6" >${dto.title}</td>
		</tr>
		<tr>
		<th>구분</th>
		<td>${dto.type}</td>
		<th>작성일</th>
		<td>${dto.write_date}</td>
		<th>조회수</th>
		<td>${dto.view_cnt}</td>
		</tr>
	<tr>
		<td colspan="8" style="height:500px;">${dto.content}</td>
	</tr>
	</table>
</div>
</div>
	<button onclick="location.href='../board/updateform?num=${dto.seq}'">수정</button>
	<button type="button" id="del" >삭제</button>
	<button onclick="location.href='list'">목록</button>


<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
</body>
</html>