<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="form" method="post" action="create"> 
<table class="table table-bordered boardform" style="width:500px;">
	<tr>
		<th style="width:100px;">제	목</th>
		<td>
			<input type="text" name="title" class="form-control" required="required" autofocus="autofocus"
					placeholder="제목을 써주세요"></td>
		</tr>
		<tr>
		<th style="width:100px;">구분</th>
		<td>
			<input type="text" name="type" class="form-control" required="required" autofocus="autofocus"
					></td>
		</tr>
	
	<tr>
		<td colspan="2">
			<textarea style="width:100%; height:100px;" name="content"></textarea>
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
	onclick="location.href='list'">돌아가기</button>
	</td>
	</tr>

	
</table>

</form>
</body>
</html>