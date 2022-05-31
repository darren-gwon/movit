<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#del").click(function() {
			var de = confirm("게시글을 삭제합니다");

			if (de) {
				return location.href = "../event/delete?num=" + ${dto.seq}
			}
				});
	});
</script>
<style>
	.event-detail h2.tit {
	    width: 1100px;
	    margin: 0 auto;
	    padding: 0;
	}
	#contents {
	    width: 100%;
	    margin: 0;
	    padding: 40px 0 0 0;
	}
	h2.tit{
		font-size:1.8666em;
		font-weight:400;
		letter-spacing:-1px;
		line-height:1.1;
		color:#222;
		left:30px;
		
	}
	.event-detail{
		position:relative;
		margin:0 0 40px 0;
		padding:0 0 30px 0;
	}
	.event-detail .event-date {
		overflow: hidden;
   		width: 1100px;
    	margin: 0 auto 30px auto;
    	padding: 15px 0 25px 0;
    	line-height: 1.1;
    	border-bottom: 1px solid #555;
    	margin-top:20px;
    	margin-bottom:40px;
	}
	.cnt {
		margin-left:770px;
	}
</style>
</head>
<body>
		<div id="contents">
			<div class="event-detail">
			<h2 class="tit">${dto.title}</h2>
			<p class="event-date">
			<span>기간 : ${dto.start_date} ~ ${dto.end_date}</span>
			<b class="cnt">조회수 : ${dto.view_cnt}</b>
			<table align="center" border="0" cellpadding="0" cellspacing="0" width="1100">
			<tr>
				<td width="1100">
					<img src="../main_img/${dto.main_img}">${dto.content}
			 	</td>
			 </tr>
			</table>
		</div>
	</div>

		<button onclick="location.href='../event/updateform?num=${dto.seq}'">수정</button>
		<button type="button" id="del">삭제</button>
		<button onclick="location.href='eventlist'">목록</button>

	

</body>
</html>