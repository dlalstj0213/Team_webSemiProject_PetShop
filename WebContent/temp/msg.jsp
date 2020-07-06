<%@page contentType="text/html;charset=utf-8"%>
<%
    String kind = (String)request.getAttribute("kind");
    boolean result = (Boolean)request.getAttribute("result");
    System.out.println("kind: " + kind + ", result: " + result);
%>
 
<script language="javascript"> 
	if("<%=kind%>" == "writeOk"){
		   if(<%=result%>){
			   alert("입력 성공!");
		   }else {
			   alert("입력 실패!");
		   }
	}else{
		   if(<%=result%>){
			   alert("수정 성공!");
		   }else {
			   alert("수정 실패!");
		   }
	}
	
	location.href="board.do";
</script>