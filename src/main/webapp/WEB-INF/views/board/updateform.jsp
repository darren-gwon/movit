<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="/resources/css/eventupdate.css" rel='stylesheet' />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="updateform" method="post" action="../notice/edit?num=${dto.seq}"> 
<div class="content">

<table class="table table-bordered boardform" style="width:500px;">
	<tr>
		<th style="width:100px;">제	목</th>
		<td>
		<input type="hidden" value="${dto.seq}" name="seq">
			<input type="text" name="title" class="form-control" required="required" autofocus="autofocus"
					value="${dto.title}" placeholder="제목을 써주세요"></td>
		</tr>
			<tr>
		<th style="width:100px;">구분</th>
		<td colspan="5">
			<!-- <input type="text" name="type" class="form-control" required="required" autofocus="autofocus"> -->
			<select name="type" style="width:500px;">
			 <option value="${dto.type}">${dto.type}</option>
			 <option value="전체공지">전체공지</option>
			 <option value="지점공지">지점공지</option>
			</select>
					</td>	
		</tr>

	<tr>
				<td colspan="2">
					<textarea style="width:100%; height:100px;" name="content"
					class="form-control" required="required"><${dto.content}</textarea>
				</td>
			</tr>
	<tr>
	<td colspan="4">
	<button type="submit" class="btn btn-default" style="width:100px;">저장</button>
	</td>
	</tr>
	<tr>
	<td colspan="4">
	<button type="button" class="btn btn-default" style="width:100px;"
	onclick="history.back()">돌아가기</button>
	</td>
	</tr>
	
</table>
</div>
</form>
</body>
</html>