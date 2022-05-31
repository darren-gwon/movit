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
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<style>
  #wrap {
	    width:500px;
	    margin : 0 auto ;
	    border: 0px solid #000;
	}
	
	table.type09 {
		border-collapse: collapse;
		text-align: left;
		line-height: 1.5;
	}
	
	table.type09 thead th {
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		color: #369;
		border-bottom: 3px solid #036;
	}
	
	table.type09 tbody th {
		width: 150px;
		padding: 10px;
		font-weight: bold;
		vertical-align: top;
		border-bottom: 1px solid #ccc;
		background: #f3f6f7;
	}
	
	table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	}
</style>
<script type="text/javascript">
$(function(){
	//비번체크
	$("#pass2").keyup(function(){
		var p1 = $("#pass1").val();
		var p2 = $(this).val();
		if(p1==p2){
			$("#pwdmsg").html("OK!").css("color","blue");
		} else {
			$("#pwdmsg").html("Fail!!").css("color","red");
		}
	});
	//현재비밀번호 check
	$("#pass0").keyup(function(){
		var data = {
				"user_id":"${sessionScope.user_id}",
				"currentpwd":$("#pass0").val()
		}
		
		$.ajax({
			type:"post",
			url:"pwCheck",
			dataType:"json",
			data:data,
			success:function(data){
				console.log(data);
				if(data==1){$("#pwdmsg2").html("OK!").css("color","blue");}
				else {$("#pwdmsg2").html("Fail!!").css("color","red");}
				
			}
		});
	});
	//비밀번호 변경
	$("#pwdbtn").click(function(){
		var data = {
				"user_id":"${sessionScope.user_id}",
				"changepwd1":$("#pass1").val()
		}
		
		$.ajax({
			type:"post",
			url:"pwUpdate",
			dataType:"json",
			data:data
		});
	});
	
});
</script>
</head>
<body>
	<div id="wrqp">
		<form action="pwUpdate" id="pwUpdate" method="post">
		<table class="type09">
			<thead>
				<tr>
					<th>기본정보</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>현재비밀번호</th>
					<td>
						<input type="text" class="form-control" name="user_id" value="${sessionScope.user_id }"><br>
						<input type="text" class="form-control" name="currentpwd" id="pass0" value="${dto.password }">
						<div style="border:1px solid black;height:25px;" id="pwdmsg2"></div>
					</td> 
				</tr>
				<tr>
					<th>변경비밀번호</th>
					<td>
						<input type="password" class="form-control" name="changepwd1" id="pass1" value=""><br>
					</td>
				</tr>
				<tr>
					<th>변경비밀번호 확인</th>
					<td>
						<input type="password" class="form-control" name="changepwd1" id="pass2" value="">&nbsp;&nbsp;<b id="pwdmsg"></b>
					</td>
				</tr>
			</tbody>
		</table>
		<button type="submit" id="pwdbtn">제출</button>
		</form>
	</div>
</body>
</html>