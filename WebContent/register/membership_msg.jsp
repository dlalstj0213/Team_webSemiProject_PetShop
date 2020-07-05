<%@page contentType="text/html;charset=utf-8" 
import="main.register.model.RegisterSet"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script language="javascript">
	if(${rCode} == <%=RegisterSet.overlap_EMAIL%>){
		alert("중복된 이메일입니다.");
		location.href="register.do";
	}else if(${rCode} == <%=RegisterSet.MemberShip_false%>){
		alert("회원가입실패");
		location.href="register.do";
	}else{
		alert("회원가입성공!");
		location.href="../login/login.do";
	}
</script>