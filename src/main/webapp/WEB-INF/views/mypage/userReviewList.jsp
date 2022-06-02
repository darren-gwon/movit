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
<style>
/* .reviewdiv{
	float:left;
}
ul.reviewlist li {
	list-style: none;
	width:90%;
	text-align:left;
	margin-left:30px;
	float:left;
	padding-bottom: 10px;
	padding-top: 5px;
}

ul.reviewlist{
	border: 1px solid magenta;
	width: 350px;
	height: 200px;
}
span.writeday{
	color: gray;
	font-size: 0.7em;
}

div.reviewContent{
	border: 1px solid black;
	text-align:left;
	/* left:350px;
	margin-right:50%;
}

div pre{
	clear:both;
	margin-left: 350px;
	margin-top: 100px;
} */



div.reviewdiv{
	width: 1200px;
	height:130px;
	float: left;
}
ul.reviewlist{
	margin-top: 10px;
	left:0px;
	width: 350px;
	height: 200px;
	display:inline-block;
}

pre {
	display:inline-block;
	padding-bottom: 150px;
	width: 300px;
}


</style>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="mypageHeader.jsp"/>
	<div class="content">
		<c:forEach var="list" items="${list }">
			<div class="reviewdiv"><hr>
				<ul class="reviewlist">
					<li><strong>영화아이디:${list.movieID }</strong></li>
					<li>
						<span>${list.user_id }</span>
						<span class="writeday">${list.write_date }</span>
					</li>
					<li><img style="width:15px;"src="/resources/review_img/heart.png">&nbsp;${list.total_likes }</li>
				</ul>
			
					<pre>${list.content }</pre>
			</div>
		</c:forEach>
		
	</div>
</body>
</html>