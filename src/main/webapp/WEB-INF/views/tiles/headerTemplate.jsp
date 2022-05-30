<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="header fixed-top">
	<span id="sidebarOpen">&#9776;</span>
	<span class="logo">;Movit</span>
	<div class="loginBtnDiv">
		<a href="#">로그인</a> <a href="#">회원가입</a>
	</div>
</div>

<script>
$("#sidebarOpen").click(function(){
	if(parseInt($("#mySidenav").css("width"))>0){
		$("#mySidenav").css("width", "0px");
	} else {
		$("#mySidenav").css("width", "500px");
	}
});
</script>