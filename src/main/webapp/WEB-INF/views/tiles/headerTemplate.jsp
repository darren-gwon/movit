<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  카카오 스크립트-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!--  네이버 스크립트-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<c:set var="pass" value="<%=request.getContextPath()%>" />
<div class="header">
	<span id="sidebarOpen">&#9776;</span> <a style="text-decoration: none;" href="/"><span class="logo">;Movit</span></a>
	<div class="loginBtnDiv">
		<c:set var="user_id" value="${sessionScope.user_id}" />
		<c:set var="kakaoN" value="${sessionScope.kakaoN}" />
		<c:set var="NaverN" value="${sessionScope.NaverN}" />

		<c:if test="${user_id==null && kakaoN==null}">
			 <a href="" data-bs-toggle="modal" data-bs-target="#loginview" style="font-weight: bold; font-size: 18px;">LogIn</a> <a href=${pass}/user/agree style="font-weight: bold; font-size: 18px;">회원가입</a>
			
		</c:if>

		<c:if test="${sessionScope.user_id!=null && kakaoN==null && NaverN==null}">
			<a href="/mypage/home" style="font-weight: bold; font-size: 18px;"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><b> 환영합니다.${sessionScope.loginname}님</b></a> &nbsp; &nbsp; <a href="/logout"  style="font-weight: bold; font-size: 18px;">Logout</a>
		
		</c:if>
		<c:if test="${sessionScope.kakaoN!=null}">
			<a href="/mypage/home" style="font-weight: bold; font-size: 18px;"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><b>환영합니다. ${sessionScope.loginname}님</b></a> &nbsp; &nbsp;<a href="https://kauth.kakao.com/oauth/logout?client_id=1ae5e64fdf23e2e6840b736262379606&logout_redirect_uri=http://15.164.162.4:8080/kakaologout" onclick="kakaologout()" style="font-weight: bold; font-size: 18px;">Logout</a>		
		</c:if>
		<c:if test="${sessionScope.NaverN!=null}">
			<a href="/mypage/home" style="font-weight: bold; font-size: 18px;"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/><b>환영합니다. ${sessionScope.loginname}님</b></a> &nbsp; &nbsp;<a href="/naverlogout" style="font-weight: bold; font-size: 18px;">Logout</a>		
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