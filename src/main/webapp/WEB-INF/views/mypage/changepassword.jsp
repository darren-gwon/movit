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
	//비번체크
	$("#pass2").keyup(function(){
		$("#pwdmsg").val("");
		var p1 = $("#pass1").val();
		var p2 = $(this).val();
		if(p1 == '' || p2 == ''){
			$("#pwdmsg").html("변경할 비밀번호를 입력해 주세요.")
		} else if(p1==p2) {
			$("#pwdmsg").html("비밀번호가 일치합니다.").css("color","green");
		} else {
			$("#pwdmsg").html("비밀번호가 일치하지 않습니다.").css("color","red");
			
		}
	});
	
	//현재비밀번호 check
	$("#pass0").change(function(){
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
				if(data==1){
					$("#pwdmsg2").text("OK!");
					
				}
				else {
					$("#pwdmsg2").text("Fail!!");
					
				}
				
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
        $("#pass1").val("");
        //$("#pass1").focus();
        return false;
    } else {
    	//$("#pwdmsg").text('비밀번호가 정상입력되었습니다.').css("color","green");
        return true;
    }

}

//onsubmit 버튼이벤트
function chkSubmit() {
	if($("#pwdmsg2").text() != "OK!") {
		alert("현재 비밀번호가 일치하지 않습니다.");
		$("#pass0").val('');
		$("#pass0").focus();
		return false;
	} else if($("#pwdmsg").html() != "비밀번호가 일치합니다.") {
		alert("변경 비밀번호가 일치하지 않습니다.")
		$("#pass1").val('');
		$("#pass2").val("");
		$("#pass1").focus();
		return false;
	} else {
		return true;
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
		<form action="pwUpdate" id="pwUpdate" method="post" onsubmit="return chkSubmit()">
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
						<span style="display:none;border:1px solid black;height:25px;" id="pwdmsg2"></span>
					</td> 
				</tr>
				<tr>
					<th>변경비밀번호</th>
					<td>
						<input type="password" class="form-control" name="changepwd1" id="pass1" onblur="chkPW(this.value)"><br>
					</td>
				</tr>
				<tr>
					<th>변경비밀번호 확인</th>
					<td>
						<input type="password" class="form-control" name="changepwd1" id="pass2" value="">&nbsp;&nbsp;
						<span id="pwdmsg">비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.</span>
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