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
</style>
<script type="text/javascript">
$(function(){
	//현재비밀번호 check
	$("$pass0").keyup(function(){
		$.ajax({
			type:"post",
			
		});
	});
});
</script>
</head>
<body>
	<div id="wrqp">
		<input type="text" name="user_id" value="${sessionScope.user_id }">
		<input type="text" name="currentpwd" id="pass0" value="${dto.password }">
		<input type="text" name="changepwd1" id="pass1" value="">
		<input type="text" name="changepwd1" id="pass2" value=""><div id="pwdmsg"></div>
	</div>
</body>
</html>