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


<script>
	$(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();
		
		location.href = "${pageContext.request.contextPath}/board/boardForm";
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
<div class="container">
<div class="table-responsive"   style="text-align:center">
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
				<th>조회수</th>
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
							<td><c:out value="${board.readNum}"/></td>
							<td><c:out value="${board.wrtieDate}"/></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
</table>

	<table>
              <tr>
              		<td align="center" colspan="5">
            		<%-- 이전 페이지 블럭 버튼 --%>
            		<nav aria-label="...">
  					<ul class="pagination">	
						<c:choose>
						<c:when test="${listResult.page.currentRange==1}">
							<li class="page-item disabled">
							  <a class="page-link" href="board.do?cp=${listResult.page.startPage-1}">&lt;&lt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
							  <a class="page-link" href="board.do?cp=${listResult.page.startPage-1}">&lt;&lt;</a>
							</li>
						</c:otherwise>
						</c:choose>
						<%-- --%>
						
						<%-- 이전 페이지 버튼 --%>
						<c:choose>
							<c:when test="${listResult.page.currentPage==1}">
								<li class="page-item disabled">
								  <a class="page-link" href="board.do?cp=${listResult.page.prevPage}">Previous</a>
								</li>		
							</c:when>
							<c:otherwise>
								<li class="page-item">
								  <a class="page-link" href="board.do?cp=${listResult.page.prevPage}">Previous</a>
								</li>		
							</c:otherwise>
						</c:choose>
						<%-- --%>
						
					  <c:forEach begin="${listResult.page.startPage}" end="${listResult.page.endPage}" var="pageNum">
						<c:choose>
						<c:when test="${pageNum==listResult.page.currentPage}">
							<li class="page-item active" aria-current="page">
						  		<a class="page-link" href="board.do?cp=${pageNum}">${pageNum}<span class="sr-only">(current)</span></a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="board.do?cp=${pageNum}">${pageNum}</a></li>
						</c:otherwise>
						</c:choose>
					</c:forEach>
						
						<%-- 다음 페이지 버튼 --%>
						<c:choose>
							<c:when test="${listResult.page.currentPage==listResult.page.pageCount}">
								<li class="page-item disabled">
								  <a class="page-link" href="#">Next</a>
								</li>
							</c:when>
						<c:when test="${listResult.page.rangeCount==0}">
								<li class="page-item disabled">
								  <a class="page-link" href="#">Next</a>
								</li>
						</c:when>
							<c:otherwise>
								<li class="page-item">
								  <a class="page-link" href="board.do?cp=${listResult.page.nextPage}">Next</a>
								</li>
							</c:otherwise>
						</c:choose>
						<%-- --%>
						
						<%-- 다음 페이지 블럭 버튼 --%>
						<c:choose>
						<c:when test="${listResult.page.currentRange==listResult.page.rangeCount}">
							<li class="page-item disabled">
							  <a class="page-link" href="board.do?cp=${listResult.page.endPage+1}">&gt;&gt;</a>
							</li>
						</c:when>
						<c:when test="${listResult.page.rangeCount==0}">
							<li class="page-item disabled">
							  <a class="page-link" href="board.do?cp=${listResult.page.endPage+1}">&gt;&gt;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
							  <a class="page-link" href="board.do?cp=${listResult.page.endPage+1}">&gt;&gt;</a>
							</li>
						</c:otherwise>
						</c:choose>
						<%-- --%>
		                </ul>
					</nav>
            		</td>
              </tr>
              </table>
</div>
</div>
</article>
<br/><br/><br/>


<script>
	$(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();	
		location.href = "${pageContext.request.contextPath}/board/board.do?m=write";
	});
</script>
<c:if test= "${!empty loginUser}">
<a href='board.do?m=write'><input type="button" class="btn btn-primary float-right" id="btnWriteForm" value="글쓰기"  style=" MARGIN-RIGHT: 11.5%;  MARGIN-TOP: -3%;"></a>
 </c:if>

<jsp:include page="../module/layout_last.jsp" />
</body>
</html>