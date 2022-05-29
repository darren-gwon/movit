<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<form name="form" method="post" action="eventwriteform" enctype="multipart/form-data">
<table class="table table-bordered boardform" style="width:500px;">
	<tr>
		<th style="width:100px;">제	목</th>
		<td>
			<input type="text" name="title" class="form-control" required="required" autofocus="autofocus"
					placeholder="제목을 써주세요"></td>
		</tr>
		<tr>
		<th style="width:100px;">기	간</th>
		<td>
			<input type="date" name="start_date" class="form-control"
					value="2022-05-05" style="width:150px;">
					&nbsp;~&nbsp;
			<input type="date" name="end_date" class="form-control"
					value="2022-05-05" style="width:150px;"></td>
		</tr>

		<tr>
				<th style="width:100px; background-color:#ddd">메인이미지</th>
				<td>
					<input type="file" name="mainupload" id="mainupload" class="form-control"
					multiple="multiple">
				</td>
			</tr>
 			<tr>
				<th style="width:100px; background-color:#ddd">썸네일이미지</th>
				<td>
					<input type="file" name="thumupload" id="thumupload" class="form-control"
					multiple="multiple">
				</td>
			</tr>

	 <tr>
		<td colspan="2"> 
				<textarea name="content" id="content" required="required"
				style="width:100%; height:300px;"></textarea>
			</td>
	</tr>
	
	<tr>
	<td>
	<button type="submit" class="btn btn-default" style="width:100px;">저장</button>
	</td>
	</tr>
	<tr>
	<td>
	<button type="button" class="btn btn-default" style="width:100px;"
	onclick="location.href='eventlist'">돌아가기</button>
	</td>
	</tr>
	
</table>

</form>
<img src="" id="myimg">


</body>
</html>