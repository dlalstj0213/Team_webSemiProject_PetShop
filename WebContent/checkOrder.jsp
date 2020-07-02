<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
               <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 전 확인</title>
</head>
<body>
	<c:if test="${!empty result}">
	<form name="f" method="post" action="order.do?m=buy&code=${result.productCode}">
		구매자 이메일:  <input name="email" readonly value="${result.email}"> <br/>
		제품코드:  <input name="productCode" readonly value="${result.productCode}"> <br/>
		배달지:  <input name="address" readonly value="${result.address}"> <br/>
		구매자 전화번호:  <input name="phone" readonly value="${result.phone}"> <br/>
		수량:  <input name="quantity" readonly value="${result.quantity}"> <br/>
		총금액:  <input name="totalPrice" readonly value="${result.totalPrice}"> <br/>
		할인율:  <input name="discount" readonly value="${result.discount}"> <br/>
		메모:  <input name="memo" readonly value="${result.memo}"> <br/><br/>
				<input type="submit" value="결제"/>
		</form>
	</c:if>
	
	<br/>
</body>
</html>