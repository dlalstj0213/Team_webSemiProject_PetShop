<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TEST</title>
</head>
<body style="text-align:center" onload="document.f.name.focus()">
		<h1>장바구니(TEST)</h1>
		<form name="f" method="post" action="cart.do?m=myCart">
			이메일(로그인) : <input name="userEmail"><br/>
			<input type="submit" value="전송"/>
			<input type="reset" value="취소"/>
		</form>
		
		<h3>1</h3>
		<h3>2</h3>
		<h3>3</h3>
	</body>
</html>