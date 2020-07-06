<%@page contentType="text/html;charset=utf-8" import="java.util.*, web.domain.Board, main.vo.ListResult"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zxx">
<head>
<jsp:include page="../module/layout_top.jsp" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<style>
body {
padding-top: 120px;
padding-bottom: 30px;
}
</style>
<script>
	$(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();
		
		location.href = "${pageContext.request.contextPath}/board/boardForm";
	});
</script>
</head>

<body>
<article>
<div class="container">
<div class="table-responsive">
<table class="table table-striped table-sm">
		<colgroup>
			<col style="width:5%;" />
			<col style="width:auto;" />
			<col style="width:15%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>이메일</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty listResult.list}" >
					<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
				</c:when> 
				<c:when test="${!empty listResult.list}">
					<c:forEach var="board" items="${listResult.list}">
						<tr>
							<td><c:out value="${board.idx}"/></td>
							<td><a href='board.do?m=content&seq=${board.idx}'><c:out value="${board.title}"/></a></td>
							<td><c:out value="${board.writer}"/></td>
							<td><c:out value="${board.email}"/></td>
							<td><c:out value="${board.wrtieDate}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
</table>
<hr width='600' size='2' color='gray' noshade>
<font color='gray' size='3' face='휴먼편지체'>
    (총페이지수 : ${listResult.page.listCount})
    &nbsp;&nbsp;&nbsp;

<c:forEach begin="${listResult.page.startPage}" end="${listResult.page.endPage}" var="page">
    <a href="board.do?cp=${page}">
               <strong>${page}</strong>
           </a>&nbsp;
</c:forEach>

    ( TOTAL : ${listResult.page.listCount} )
    
    
 
    </select>
    </font>
</div>
</div>
</article>
<script>
	$(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();	
		location.href = "${pageContext.request.contextPath}/board_mvc/board.do?m=write";
	});
</script>
<c:if test= "${!empty loginUser}">
<a href='board.do?m=write'><input type="button" class="btn btn-primary float-right" id="btnWriteForm" value="글쓰기"  style=" MARGIN-RIGHT: 11.5%;  MARGIN-TOP: -3%;"></a>
 </c:if>

<jsp:include page="../module/layout_last.jsp" />
</body>
</html>