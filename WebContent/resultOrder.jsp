<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
               <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매 완료 결과</title>
</head>
<body>
	<h1>구매 완료 결과</h1>
	<c:if test="${result.flag}">
				결제 완료<br/>총 결제된 금액 : ${result.totalPay}<br/>결과종류 : ${result.resultType}<br/>
	</c:if>
	<c:if test="${!result.flag}">
		결제 실패 <br/>결과종류 : ${result.resultType}<br/>
	</c:if>
	<a href="cart.do"><input type="button" value="확인"/></a>
</body>
</html>