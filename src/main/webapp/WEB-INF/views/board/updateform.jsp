<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="updateform" method="post" action="../board/updateform?num=${dto.seq}"> 
<table class="table table-bordered boardform" style="width:500px;">
	<tr>
		<th style="width:100px;">제	목</th>
		<td>
		<input type="hidden" value="${dto.seq}" name="seq">
			<input type="text" name="title" class="form-control" required="required" autofocus="autofocus"
					value="${dto.title}" placeholder="제목을 써주세요"></td>
		</tr>
		<tr>
		<th style="width:100px;">극장</th>
		<td>
			<input type="text" name="type" class="form-control" required="required" autofocus="autofocus"
					value="${dto.type}"></td>
		</tr>

	<tr>
				<td colspan="2">
					<textarea style="width:100%; height:100px;" name="content"
					class="form-control" required="required">${dto.content}</textarea>
				</td>
			</tr>
	<tr>
	<td>
	<button type="submit" class="btn btn-default" style="width:100px;">저장</button>
	
	<button type="button" class="btn btn-default" style="width:100px;">
	<a href="list">돌아가기</a></button>
	</td>
	</tr>
	
</table>

</form>
</body>
</html>