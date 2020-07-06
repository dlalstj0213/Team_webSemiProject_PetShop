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
</head>

<body>
	<section class="breadcrumb_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<h2>Review</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
<br/><br/><br/>
	<article>
		<div class="container" role="main">
			<h2>board Form</h2>
			<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/board.do?m=updateOk">
				<div class="mb-3">
					<input type="hidden" class="form-control" name="seq" id="seq" value="${board.idx}">
				</div>
				<div class="mb-3">
					<label for="title">작성자</label>
					<input type="text" class="form-control" name="writer" id="writer" readonly placeholder="${board.writer}">
				</div>
				
				<div class="mb-3">
					<label for="reg_id">이메일</label>
					<input type="text" class="form-control" name="email" id="email" readonly placeholder="${board.email}">
				</div>
				<div class="mb-3">
					<label for="content">제목</label>
					<textarea class="form-control" rows="5" name="subject" id="subject">${board.title}</textarea>
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content">${board.content}</textarea>
				</div>
				
			<div >
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			</div>
			
			</form>
		</div>
	</article>
	<br/><br/><br/>
	<jsp:include page="../module/layout_last.jsp" />
</body>
</html>
