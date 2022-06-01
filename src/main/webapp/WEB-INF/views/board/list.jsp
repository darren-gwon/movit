<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<c:set var="root" value="<%=request.getContextPath() %>" />
<title>Insert title here</title>
<script>
 function search() {
  
  keyword = document.getElementById("keyword").value;
  
  console.log(keyword)
  location.href = "../board/list?num&keyword=" + keyword;
 };
</script>
<style>
.content {
	position: relative;
}
div.title{
	margin-top:150px;
	width:1500px;
}
.title h2{
position: absolute;
	float: left;
	margin-left:320px;
	font-weight:bold;
}
.tbl_list {
	text-align: center;
	border-collapse: collapse;
	margin-top: 20px;
}
thead th {
	font-weight: bold;
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
	background-color: #ffdfdc;
	text-align: center;
}
tbody td {
	text-align: center;
	height:47px;
}

.text1 a {
	text-overflow: ellipsis;
	white-space: nowrap;
	text-decoration: none;
	color: black;
}
td.text1{
	text-align: left; 
}
ul {
	list-style: none;
	float: left;
	display: inline;
	text-align: center;
}
div.paging	{
	text-align: center;
	width:840px;
	margin-left: 800px;
}

ul a {
	float: left;
	padding: 4px;
	margin-right: 3px;
	width: 50px;
	color: #000;
	font: bold 12px tahoma;
	border: 0px solid #eee;
	text-decoration: none;
	text-align: center;
}
div.bu1{
	margin-left:1500px;
}
div #keyword {
	height: 40px;
	width: 200px;
	border: 2px solid grey;
	margin-top: 130px;
	margin-left:1100px;
	border-radius: 25px;
	padding-left: 30px;
	font-size: 15px;
	margin-bottom:10px;
}

#search {
	overflow: hidden;
	margin: 0px;
	height: 55px;
	width: 55px;
	background-color: transparent;
	position: absolute;
	margin-left: -50px;
	margin-top: 120px;
	border: 0px;
	cursor: pointer;
}

div.total {
	position: absolute;
	float:left;
	font-size: 16px;
	margin-left:330px;
	margin-top: 130px;
	margin-bottom: 10px;
	color: gray;
	font-weight: bold;
}


</style>
</head>
<body>
	<div class="content">
	<div class="title">
	<h2>공지사항</h2></div>
	
		<div class="total"> 총 ${postcount}건</div>
		<input type="text" id="keyword" />
		<button type="button" id="search" onclick="search()">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  			<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
	</svg>
		</button>


	<div class="container">
		<div class="row">
			<div class="col">
				<!-- <table class="tbl_list"> -->
				<table class="table table-hover">
					<colgroup>
						<col width="50px"  />
						<col width="100px" />
						<col width="550px" />
						<col width="150px" />
						<col width="80px" />
					</colgroup>

					<thead>
						<tr>
							<th>번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list" varStatus="i" >
							<tr>
								<td><c:out value="${i.count}" /></td>
								<td>${list.type}</td>
								<td class="text1"><a href="../board/detail?num=${list.seq}">${list.title}</a></td>
								<fmt:parseDate value="${list.write_date}" var="dateValue"
									pattern="yyyy-MM-dd" />
								<td><fmt:formatDate value="${dateValue}"
										pattern="yyyy-MM-dd" /></td>
								<td>${list.view_cnt}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="paging">
		<ul>
			<li><c:if test="${prev}">

					<a href="../board/notice?num=${startpagenum - 1}">〈</a>

				</c:if> <c:forEach begin="${startpagenum}" end="${endpagenum}" var="num">

					<c:if test="${select !=num}">
						<a href="../board/notice?num=${num}">${num}</a>
					</c:if>

					<c:if test="${select ==num}">
						<a href="../board/notice?num=${num}">${num}</a>
					</c:if>

				</c:forEach> <c:if test="${next}">
					<a href="../board/notice?num=${endpagenum + 1}">〉</a>
				</c:if></li>
		</ul>
		</div>
		
				<div class="bu1">
					<button type="button" class="btn btn-primary" style="width: 100px;"
						onclick="location.href='${root}/board/writeform'">글쓰기</button>
				
				</div>
				</div>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>