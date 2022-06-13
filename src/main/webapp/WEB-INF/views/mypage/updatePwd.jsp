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
  #changepwd {
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
		font-size: 1.3em;
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
	
	button[type="submit"] {
		font-size:1.5em;
		padding:0.25em;
		box-sizing: border-box;
		width:100%;
		border: none;
		background-color: #193170;
		color: white;
	}
</style>
<script type="text/javascript">
$(function(){
	
	
	
	//현재비밀번호 check
	$("#pass0").change(function(){
		var data = {
				"user_id":"${sessionScope.user_id}",
				"currentpwd":$("#pass0").val()
		}
		
		$.ajax({
			type:"post",
			url:"chkPwd",
			dataType:"json",
			data:data,
			success:function(data){
				console.log(data);
				if(data==1){
					$("#chkCurrentPwd").val("true");
					
				}
				else {
					$("#chkCurrentPwd").val("false");
					
				}
				
			}
		});
	});
	
	//비밀번호 변경
	/* $("#pwdbtn").click(function(){
		var data = {
				"user_id":"${sessionScope.user_id}",
				"changepwd1":$("#pass1").val()
		}
		
		$.ajax({
			type:"post",
			url:"updatePwd",
			dataType:"json",
			data:data
		});
	}); */
	
});

//비밀번호 유효성검사(정규식)
function chkPW() {
    let id = $("#user_id").val();
    let pw = $("#pass1").val();
    let number = pw.search(/[0-9]/g);
    let english = pw.search(/[a-z]/ig);
    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    if (false === reg.test(pw)) {
        $("#pwdmsg").css("color","red");
        $("#pwdFmt").val("false");
        return false;
    } else {
    	$("#pwdFmt").val("true");
        return true;
    }

}

//onsubmit 버튼이벤트
function chkSubmit() {
	//비번일치여부 체크
	var p1 = $("#pass1").val();
	var p2 = $("#pass2").val();
	if(p1 === p2 && p1 != '') {
		$("#coincidePwd").val("true");
	} else {$("#coincidePwd").val("false");}
	if($("#coincidePwd").val()=="true" && $("#chkCurrentPwd").val()=="true" && $("#pwdFmt").val()=="true") {
		alert("비밀번호가 성공적으로 변경되었습니다.");
		return true;
	} else {
		alert("입력한 정보가 맞지않습니다.")
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
	<div class="content" id="changepwd">
		<form action="updatePwd" id="pwUpdate" method="post" onsubmit="return chkSubmit()">
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
						<input type="hidden" class="form-control" name="user_id" id="user_id" value="${sessionScope.user_id }"><br>
						<input type="password" class="form-control" name="currentpwd" id="pass0" value="${dto.password }">
						<input type="text" id="chkCurrentPwd">
					</td> 
				</tr>
				<tr>
					<th>변경비밀번호</th>
					<td>
						<input type="password" class="form-control" name="changepwd1" id="pass1" onblur="chkPW(this.value)">
						<input type="text" id="pwdFmt">
					</td>
				</tr>
				<tr>
					<th>변경비밀번호 확인</th>
					<td>
						<input type="password" class="form-control" name="changepwd2" id="pass2" value="">&nbsp;&nbsp;
						<span id="pwdmsg">비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.</span>
						<input type="text" id="coincidePwd">
						
					</td>
				</tr>
			</tbody>
			<tr>
				<td colspan="2"><button type="submit">제출</button></td>
			</tr>
		</table>
		
		</form>
	</div>
</body>
</html>