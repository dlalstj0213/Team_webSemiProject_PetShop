<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니 결과</title>
</head>
<body>
	<h1>장바구니 결과</h1>
	<h3>${sessionScope.loginUser}</h3>
	<table>
	<c:forEach items="${result.listResult}" var="list">
	<tr>
		<td>바구니코드=${list.cartCode}</td>
		<td>이메일=${list.email}</td>
		<td>제품코드=${list.productCode}</td>
		<td>제품명=${list.name}</td>
		<td>제품가격=${list.price}</td>
		<td>재고량=${list.quantity}</td>
		<td><a href='cart.do?m=delete&code=${list.cartCode}'>삭제</a></td>
		</tr>
	</c:forEach>
	</table>
	<c:if test="${empty result.listResult}">장바구니 데이터가 없습니다</c:if>
	
			<div>
			<a href="cart.do"><input type="button" value="모두 구매"/></a>
			<a href="cart.do?m=deleteAll"><input type="button" value="모두 삭제"/></a>
			</div>
	
</body>
</html>