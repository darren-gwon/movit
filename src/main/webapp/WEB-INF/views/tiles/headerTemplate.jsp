<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  카카오 스크립트-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--  네이버 스크립트-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<div class="header">
	<span id="sidebarOpen">&#9776;</span> <span class="logo">;Movit</span>
	<div class="loginBtnDiv">
		<c:set var="user_id" value="${sessionScope.user_id}" />
		<c:set var="kakaoN" value="${sessionScope.kakaoN}" />


		<c:if test="${user_id==null && kakaoN==null}">
			 <a href="" data-bs-toggle="modal" data-bs-target="#loginview">LogIn</a> <a href=${pass}/user/agree>회원가입</a>
			
		</c:if>

		<c:if test="${sessionScope.user_id!=null && kakaoN==null}">
			<a href=""> <b>환영합니다.${sessionScope.loginname}(${sessionScope.user_id})님</b></a> &nbsp; &nbsp; <a href="" onclick="logout()">Logout</a>
		
		</c:if>
		<c:if test="${sessionScope.kakaoN!=null}">
			<a href=""> <b>환영합니다. ${sessionScope.loginname}(${sessionScope.user_id})님</b></a> &nbsp; &nbsp;<a href="https://kauth.kakao.com/oauth/logout?client_id=1ae5e64fdf23e2e6840b736262379606&logout_redirect_uri=http://localhost:9005/kakaologout" onclick="kakaologout()">Logout</a>		
		</c:if>
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