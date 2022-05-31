<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" id="sidebarClose" class="closebtn side_menu" >&times;</a>
  <a href="/" class="side_menu">HOME</a>
  <a href="#" class="side_menu">마이페이지</a>
  <a href="#" class="side_menu">공지사항</a>
  <a href="#" class="side_menu">이벤트</a>
  
  <a href="#" class="side_menu">현재상영작</a>
  <a href="#" class="side_menu">예매하기</a>

  <a href="#" class="side_menu">고객센터</a>
</div>
<div id="sidebarBlock"></div>

<script>
$("#sidebarClose").click(function(){
	if(parseInt($("#mySidenav").css("width"))>0){
		$("#mySidenav").css("width", "0px");
	} else {
		$("#mySidenav").css("width", "500px");
	}
});
</script>