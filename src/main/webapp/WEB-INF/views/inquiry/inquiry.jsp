<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta charset="UTF-8">

<style type="text/css">
	table.type04 {
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin : 20px 10px;
	}
	table.type04 th {
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
	table.type04 td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>

<div class="container">
  <div class="row">
    <div class="col">
     <img src="../image/inquirytop.png"  width="1300px;">
     
    </div>
  </div>
 
  <br><br><hr><br><br>
 </div> 

	<table class="type04" style="text-align: center; font-size: 17px;">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">영화관</th>
				<th scope="col">글제목</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="inquiry">
				<tr>
					<td class="text_ct">${inquiry.seq}&nbsp;</td>
					<td class="text_ct">${inquiry.theaterID}&nbsp;</td>
					<td class="text_ct"><a href="list/detail?seq=${inquiry.seq}">${inquiry.title}&nbsp;</a></td>
					<td class="text_ct"><fmt:formatDate value="${inquiry.write_date}" pattern="yyyy/MM/dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
<a href="<c:url value='/inquiry/list/insert'/>" role="button" class="btn btn-outline-info">1:1 문의 글쓰기</a>
<input type="button" value="선택삭제" onclick="deleteValue();">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>