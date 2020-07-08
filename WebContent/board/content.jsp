<%@page contentType="text/html;charset=utf-8" import="java.util.*, web.domain.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../module/layout_top.jsp" />
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- common CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/common/css/common.css">

<script>
	$(document).on('click', '#btnList', function(){
		e.preventDefault();
		
		$("#form").submit();
		location.href = "${pageContext.request.contextPath}/board_mvc/board.do?m=update";
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
			<h2>후기글</h2>
			<br/>
			
			
			<div class="bg-white rounded shadow-sm">
			
				</div>			
				<div class="mb-3">
				<input type="text" value="${board.title}" class="form-control" readonly><div class="board_title"></div>
				<div class="board_info_box">
				</div>	
				<br/>
				<div class="mb-3">
				<input type="text" value="${board.writer}" class="form-control" readonly><div class="board_writer"></div> 
				<div class="board_info_box">
				</div>
				<br/>
				
				<div class="mb-3">
				<input type="text"  value="${board.email}" class="form-control" readonly><div class="board_email"></div>
				<div class="board_info_box">
				</div>
				<br/>
				<br/>
				
				<div class="mb-3">
				<textarea type="text" value="hekio" rows="5" class="form-control" readonly><c:out value="${board.content}"/></textarea>
				<div class="board_info_box">
			    </div>
			    
			
			
			<div style="margin-top : 20px">
				<c:if test="${loginUser.email eq board.email}">
				 <!-- 현재 로그인된 이메일과 게시판에 등록된 이메일과 같다면 true 그러면 삭제 수정 가능. -->
				<a href="board.do?m=update&seq=${board.idx}"><button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button></a>
				<a href="board.do?m=del&seq=${board.idx}"><button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				</c:if>
				<a href="board.do"><button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button></a>
			</div>
		</div>
	
	  <table>
            <thead>
            <tr>
            <th>
                <h3><strong>Comments</strong></h3>
            </th>
            </tr>
             </thead>
             	<c:if test="${!empty loginUser}">
            			 	<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/board/board.do?m=comment&idx=${board.idx}">
            			 	<tr>
			                        <td>
			                            <div>
			                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="content" placeholder="댓글을 입력하세요"></textarea>
			                                <button type="submit" class="btn pull-right btn-success">등록</button>
			                            </div>
			                        </td>
			                        </tr>
			               </form>
                    </c:if>
        </table>
        <div class="section-top-border">
				<div class="row">
					<div class="col-lg-12">
					<c:if test="${!empty comment}">
						<c:forEach items="${comment}" var="comment">
						<blockquote class="generic-blockquote">
						<h5><c:out value="${comment.writer}"/>  ||  <c:out value="${comment.email}"/>  ||  <c:out value="${comment.writeDate}"/> 
								<c:if test="${loginUser.email eq comment.email}">
							    &nbsp;<a href="board.do?m=deleteComment&idx=${comment.commentIdx}&seq=${board.idx}">삭제</a>
							    </c:if>
						</h5>
							<div style = "white-space:pre;"><c:out value="${comment.content}"/></div>
						</blockquote>
						</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			
		</article>
	
	<br/><br/><br/>
	<jsp:include page="../module/layout_last.jsp" />
</body>
</html>
