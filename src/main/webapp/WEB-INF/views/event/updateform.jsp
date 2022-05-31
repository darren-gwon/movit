<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    $(function(){
		$("#mainupload").change(function(){
			var reader=new FileReader();
			reader.onload=function(e){
				$("#main_img").attr("src",e.target.result);
			}
			reader.readAsDataURL($(this)[0].files[0]);
		});
	});
</script>
</head>
<body>
<form name="updateform" method="post" enctype="multipart/form-data" action="../event/updateform?num=${dto.seq}"> 
<table class="table table-bordered boardform" style="width:500px;">
	<tr>
		<th style="width:100px;">제	목</th>
		<td>
		<input type="hidden" value="${dto.seq}" name="seq">
			<input type="text" name="title" class="form-control" required="required" autofocus="autofocus"
					value="${dto.title}" placeholder="제목을 써주세요"></td>
		</tr>
		<tr>
		<th style="width:100px;">기	간</th>
		<td>
			<input type="date" name="start_date" class="form-control"
					value="${dto.start_date}" style="width:150px;">
					&nbsp;~&nbsp;
			<input type="date" name="end_date" class="form-control"
					value="${dto.end_date}" style="width:150px;"></td>
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
<img src="../main_img/${dto.main_img}" id="main_img">
</body>
</html>