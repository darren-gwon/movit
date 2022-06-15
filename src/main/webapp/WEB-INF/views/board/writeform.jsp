<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="/resources/css/noticewrite.css" rel='stylesheet' />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous">
</head>
<body>
<form name="form" method="post" action="write"> 
<div class="content">
   <div class="container">
<table class="table table-bordered boardform" style="width:500px;">
	<tr>
		<th style="width:100px;">제	목</th>
		<td>
			<input type="text" name="title" class="form-control" required="required" autofocus="autofocus"
					placeholder="제목을 써주세요"></td>
		</tr>
		<tr>
		<th style="width:100px;">구분</th>
		<td colspan="5">
			<!-- <input type="text" name="type" class="form-control" required="required" autofocus="autofocus"> -->
			<select name="type" style="width:500px;">
			 <option value="">--선택--</option>
			 <option value="전체공지">전체공지</option>
			 <option value="지점공지">지점공지</option>
			</select>
					</td>
					
		</tr>
	
	<tr>
		<td colspan="2">
			<textarea style="width:100%; height:300px;" name="content"></textarea>
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
	onclick="location.href='/notice'">돌아가기</button>
	</td>
	</tr>

	
</table>
</div>
</div>
</form>
  <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>

</body>
</html>