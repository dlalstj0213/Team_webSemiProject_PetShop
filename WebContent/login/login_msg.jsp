<%@page contentType="text/html;charset=utf-8" 
import="main.login.model.LoginSet"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script language="javascript">
	if(${rCode} == <%=LoginSet.NO_ID%>){
		alert("로그인 실패 ( 존재하지않는 아이디 )");
		location.href="login.do";
	}else if(${rCode} == <%=LoginSet.NO_PWD%>){
		alert("로그인 실패 ( 잘못된 비밀번호 )");
		location.href="login.do";
	}else{
		alert("로그인 성공");
		location.href="../home/home.do";
	}
</script>