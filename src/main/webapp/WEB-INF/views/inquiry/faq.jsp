<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <c:set var="root" value="<%=request.getContextPath() %>"/>
<!doctype html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
	table.type04 {
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin : 20px 10px;
	}
	table.type04 th {
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
	table.type04 td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
</style>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "delete"; //Controller로 보내고자하는 URL
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for(var i=0; i<list.length; i++){
				if(list[i].checked){//선택되어 있으면 배열에 값을 저장함
					valueArr.push(list[i].value);
				}
			}
			if(valueArr.length == 0){
				alert("선택된 글이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk){
					$.ajax({
						url : url, // 전송 URL
						type : 'POST', //POST 방식
						traditional : true,
						data : {
							valueArr : valueArr //보내고자 하는 data 변수 설정
						},
						success: function(jdata){
							if(jdata = 1) {
								alert("삭제 성공");
								location.replace("faq") //faq로 맵핑 페이지 새로고침
							}
							else{
								alert("삭제 실패");
							}
						}
					});
				}
			}
		}
	
	</script>

	
<meta charset="utf-8">

</head>

<body>
<form name="userForm">
<div class="container">
  <div class="row">
    <div class="col">
     <img src="../image/InquiryFAQ_TOP.png"  width="1300px;">
    </div>
  </div>
 
  <br><br><hr><br><br>
 </div>
 
	<table class="type04" style="text-align: center; font-size: 17px;">
		<thead>
			<tr>
				<th><input id="allCheck" type="checkbox" name="allCheck"/></th>
				<th>번호</th>
				<th>문의유형</th>
				<th>제목</th>
				<th>문의날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="faq">
				<tr>
					<td><input name="RowCheck" type="checkbox" value="${faq.seq}"/></td>
					<td>${faq.seq}&nbsp;</td>
					<td>${faq.inquiry_type}&nbsp;</td>
					<td><a href="faq/detail?seq=${faq.seq}">${faq.title}&nbsp;</a></td>
					<td><fmt:formatDate value="${faq.write_date}" pattern="yyyy/MM/dd" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	
<a href="<c:url value='/inquiry/faq/insert'/>" role="button">글쓰기</a>
<input type="button" value="선택삭제" onclick="deleteValue();">


</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>