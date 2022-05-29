<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="<%=request.getContextPath() %>"/>
<title>Insert title here</title>
<script>
 function search() {
  
  keyword = document.getElementById("keyword").value;
  
  console.log(keyword)
  location.href = "../board/list?num&keyword=" + keyword;
 };
</script>
<style>
		.tbl_list{
            text-align: center;
            border-collapse: collapse;
            margin-top: 20px;
        }
		thead th{
            font-weight: bold;
            border-top: 2px solid gray;
            border-bottom: 2px solid gray;
            background-color: #ffdfdc;
            height: 50px;
        }
        .text1 a{
        	text-overflow:ellipsis;
        	white-space:nowrap;
        	text-decoration:none;
			color: black;
        } 
        .text1{
        text-align: left;
        }
        td{
            border-bottom: 1px solid #dddddd;
            padding: 20px;
            font-size: 15px;
            line-height: 1.3;
        }
        div #keyword {
        	height:50px;
        	width:750px;
        	border:2px solid grey;
        	margin-top:10px;
        	margin-left:90px;
        	border-radius:25px;
        	padding-left:30px;
        	font-size: 15px;
        }
        #search{
      		overflow: hidden;
        	margin:0px;
        	height:55px;
        	width:55px;
            background-color:transparent;
        	position: absolute;
        	margin-left:-70px;
        	margin-top:10px;
            border:0px;
            cursor:pointer;	
        }
        div.total{
        	font-size: 16px;
			margin-left: 10px;
			margin-top: 20px;
			color:gray;
			font-weight:bold;
        }
        ul {
			list-style:none;
			float:left;
			display:inline;
		}
		ul li {
			float:left;
			margin: 20px 0px;
			margin-left:20px;
			margin-bottom:300px;
			padding:0 50px;
			text-align:center;
			
		}
		ul a {
			float:left;
			padding:4px;
			margin-right:3px;
			width:50px;
			color:#000;
			font:bold 12px tahoma;
			border:1px solid #eee;
			
			text-decoration:none;
		
		}

</style>
</head>
<body>

<div class="searchtap">
<input type="text" id="keyword"/>
  <button type="button" id="search" onclick="search()">
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></button>
  </div>
 <div class="total">전체 ${postcount}건</div>
 <div>
<table class="tbl_list">
	<colgroup>
    	<col width="50px"/>
    	<col width="100px"/>
    	<col width="550px"/>
    	<col width="150px"/>
    	<col width="80px"/>
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
	<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.seq}</td>
			<td>${list.type}</td>
			<td class="text1"><a href="../board/detail?num=${list.seq}">${list.title}</a></td>	
			 <fmt:parseDate value="${list.write_date}" var="dateValue" pattern="yyyy-MM-dd"/> 
	 		<td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td>		
			<td>${list.view_cnt}</td>
		</tr>
	</c:forEach>

	</tbody>
</table>
</div>

<div class="bu1">
	<button type="button" class="btn btn-primary" style="width:100px;" 
	onclick="location.href='${root}/board/writeform'">글쓰기</button>
	</div>
	<div>
<ul>
	<li>
  <c:if test="${prev}">
 			
 			<a href="../board/list?num=${startpagenum - 1}">〈</a>
 		
	</c:if>

	 <c:forEach begin="${startpagenum}" end="${endpagenum}" var="num">
	 
  	<c:if test="${select !=num}" >
  		<a href="../board/list?num=${num}">${num}</a>
  	</c:if>
  	
  	<c:if test="${select ==num}" >
  	<a href="../board/list?num=${num}">${num}</a>
  	</c:if>
  	
	</c:forEach> 
	
	
	<c:if test="${next}">
 		<a href="../board/list?num=${endpagenum + 1}">〉</a>
	</c:if>
	</li>
	</ul>
</div>

</body>
</html>