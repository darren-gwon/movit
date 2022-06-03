<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<link href="/resources/css/info.css" rel='stylesheet' />

<meta charset="UTF-8">
<title>MOVIT 결제 성공</title>
</head>
<body>
	<div class="content">
		<div class="paySuccessInfo">
			결제일자: 결제번호: 결제방식: 총금액: 영화명: 결제일: 갯수:

			<table class="table table-striped">
				<tr>
					<td colspan="2">영수증</td>
				</tr>
				<tr>
					<td>결제일자</td>
					<td>${payInfo.approved_at}</td>
				</tr>
				<tr>
					<td>예매번호</td>
					<td>${bookingDto.bookingID}</td>
				</tr>
				<tr>
					<td>결제번호</td>
					<td>${payInfo.tid}</td>
				</tr>
				<tr>
					<td>결제수단</td>
					<td>${payInfo.payment_method_type}</td>
				</tr>
				<tr>
					<td>영화관</td>
					<td>aaaaaaaaa</td>
				</tr>
				<tr>
					<td>상영시간 </td>
					<td></td>
				</tr>
				<tr>
					<td>영화명</td>
					<td>${orderInfo.item_name}</td>
				</tr>
				
				<tr>
					<td>총수량</td>
					<td>${orderInfo.quantity}원</td>
				</tr>
				<tr>
					<td>총금액</td>
					<td>${orderInfo.totalPrice}원</td>
				</tr>
				<tr>
					<td>좌석번호</td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>


${payInfo}
----------------------------------------------
${orderInfo}
----------------------------------------------
${bookingDto}


	결제 성공!!!! 

</body>
</html>