<%@page contentType="text/html;charset=utf-8" import="java.util.*, web.domain.Board, main.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="../module/layout_top.jsp" />
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- common CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/common/css/common.css">

<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		
		$("#form").submit();
	});
	
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		
		location.href="${pageContext.request.contextPath}/board_mvc/content.jsp";
	});
	
	
</script>
<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}

</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Form</h2>
			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board_mvc/board.do?m=writeOk">
				<div class="mb-3">
					<label for="title">작성자</label>
					<input type="text" class="form-control" name="writer" id="writer" placeholder="이름을 입력해주세요">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">이메일</label>
					<input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요">
				</div>
				
				<div class="mb-3">
					<label for="content">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력해주세요" >
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력하세요" ></textarea>
				</div>
				
			<div >
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			</div>
			
			</form>
		</div>
	</article>
		<jsp:include page="../module/layout_last.jsp" />
</body>
</html>
