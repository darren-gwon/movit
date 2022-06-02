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
<link rel="stylesheet" href="/resources/css/mypagedelete.css"/>
<style>
	
	  
</style>
<script type="text/javascript">
//onsubmit 버튼이벤트
function chkSubmit() {
	var ans = confirm("정말로 탈퇴를 원하시면 [확인]을 눌러주세요.");
	if(ans) {
		return true;
	} else {
		return false;
	}
}
</script>
</head>
<body>
	<jsp:include page="mypageHeader.jsp"/>
	<c:if test="${sessionScope.user_id ==null }">
		<br><br>
		<h3>로그인이 필요한 서비스입니다.</h3>
		<br><br>
	</c:if>
	<c:if test="${sessionScope.user_id != null }">
	<form action="deleteAccount" id="frm" method="get" onsubmit="return chkSubmit()">
	<input type="hidden" name="user_id" value="${sessionScope.user_id }">
		<div class="content">
			<br><br>
			<img src="/resources/mypage_img/crying.png" style="width:150px;"><br><br>
			<b style="font-size:1.2rem;">진정... 가시렵니까...?</b><br><br>
			<b>[주의] 회원탈퇴전 안내 사항을 꼭 확인해주세요.</b>
		</div><br>
	
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		약관확인하기
		</button>
		<button type="submit" id="realdelete"class="btn btn-danger">회원탈퇴</button>
	</form>
	</c:if>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴시 안내 및 유의사항</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <pre style="text-align:left">
1. 30일간 회원 재가입이 불가능합니다.
 - 회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.
			
2. 탈퇴 후 삭제 내역
 - 회원 탈퇴하시면 회원정보와 개인 보유 포인트
   등 정보가 삭제되며 데이터는 복구되지 않습니다.
</pre>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>