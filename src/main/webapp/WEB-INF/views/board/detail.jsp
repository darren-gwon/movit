<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/noticedetail.css" rel='stylesheet' />
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
<script>

$(function(){
	$("#del").click(function(){
		var de=confirm("게시글을 삭제합니다");
		
		if (de){
	         return location.href="del?num="+${dto.seq};
				}
			});
	});
</script>

</head>
<body>
<div class="content">
<div class="title">
	<span>공지사항</span></div>
	
<div class="form">
   <table class="table table-hover">
		<tr>
		<td class="tit-td" colspan="6" >${dto.title}</td>
		</tr>
		<tr>
		<td><b>구분</b>  ${dto.type}</td>
		<td><b>작성일</b>  ${dto.write_date}</td>
		<td><b>조회수</b>  ${dto.view_cnt}</td>
		</tr>
	<tr>
		<td class="content-td" colspan="8"><pre class="contents">${dto.content}</pre></td>
	</tr>
	</table>

	<button class="listbtn" onclick="location.href='/notice'">목록</button>
	<c:if test="${user_id=='admin'}">
	<button class="update" onclick="location.href='../notice/edit?num=${dto.seq}'">수정</button>
	<button type="button" id="del" class="del" >삭제</button>
	</c:if>
</div>
	<ul>
		<c:if test="${prev != null }">
			<li>
				<strong class="privious list-title">이전글</strong>
				<b>${prev.title}</b>
			</li>
		</c:if>
	</ul>
</div>
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
</body>
</html>