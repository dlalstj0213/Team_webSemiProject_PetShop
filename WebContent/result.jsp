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
	
		<h3>포펫 K50(1)<a href="cart.do?m=insert&code=1">장바구니 추가</a></h3>
		<h3>포펫 K100(2)<a href="cart.do?m=insert&code=2">장바구니 추가</a></h3>
		<h3>포펫 K200(3)<a href="cart.do?m=insert&code=3">장바구니 추가</a></h3>
		<h3>포펫 K300(4)<a href="cart.do?m=insert&code=4">장바구니 추가</a></h3>
		<h3>포펫 W400(5)<a href="cart.do?m=insert&code=5">장바구니 추가</a></h3>
		<br/>		
		
		<h3>포펫 K50(1)</h3>
			<form name="f" method="post" action="order.do?m=check&code=1">
			이메일 : <input name="email" readonly value="${loginUser}"><br/>
			제품코드 : <input name="code" readonly value="1"><br/>
			주소 : <input name="address" readonly value="서울시"><br/>
			전화번호 : <input name="phone" readonly value="01009876543"><br/>
			수량 : <input name="quantity"><br/>
			총금액 : <input name="totalPrice" readonly value="1290000"><br/>
			메모 : <input name="memo"><br/>
				<input type="submit" value="바로구매"/>
			</form>
			
		<h3>포펫 K100(2)</h3>
			<form name="f" method="post" action="order.do?m=insert&code=2">
				수량 : <input name="quantiy">
				<input type="submit" value="바로구매"/>
			</form>
					
		<h3>포펫 K200(3)</h3>
			<form name="f" method="post" action="order.do?m=insert&code=3">
				수량 : <input name="quantiy">
				<input type="submit" value="바로구매"/>
			</form>
			
		<h3>포펫 K300(4)</h3>
			<form name="f" method="post" action="order.do?m=insert&code=4">
				수량 : <input name="quantiy">
				<input type="submit" value="바로구매"/>
			</form>
			
		<h3>포펫 W400(5)</h3>
			<form name="f" method="post" action="order.do?m=insert&code=5">
				수량 : <input name="quantiy">
				<input type="submit" value="바로구매"/>
			</form>
			
</body>
</html>