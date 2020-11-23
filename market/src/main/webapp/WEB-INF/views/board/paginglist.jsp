<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%@include file="../include/header.jsp" %>
<div class="container">
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="logo">
					<img src="../resources/logo/logo.png" class="logo-detail"/>
					<br>
				</div>
<div class="table-responsive">
  <table class="list-table">
  <tr class="list-tr-top">
  	<th></th>
  	<th width = "40%" class="list-td">제목</th>
  	<th class="list-td">작성일</th>
  	<th class="list-td">작성자</th>
  	<th width = "10%" class="list-td">조회수</th>
  </tr>
<c:forEach var="board" items="${listAll }">
 	<tr class="list-tr">
 	<td class="list-td">${board.bno}</td>
 	<td class="list-td-title"><a href="detail?bno=${board.bno}"> ${board.btitle} </a></td>
 	<td class="list-td">${board.bdate}</td>
 	<td class="list-td">${board.bwriter}</td>
 	<td class="list-td">${board.breadcnt }</td>
 	</tr>
</c:forEach>
	</table>
	<div>
	<table width="100%" style="margin-top:10px;">
		<tr>
			<td width="30%">
			<form>
		    <input type="text" name="keyword" placeholder="Search for..." class="search-field">
		    <button type="submit" class="search-icon">
		    <img src="../resources/logo/search.png" width="20px">
		    </button>
			</form>
			</td>
			<td>
		 <ul class="pagination">
			  	<c:if test="${paging.startPage != 1 }">
			  		<li class="page-item">
						<a href="${contextPath }/board/paginglist?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}" class="page-link">&lt;</a>
					</li>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item">
							<a class="page-link">${p }</a>
							</li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li class="page-item">
								<a href="${contextPath }/board/paginglist?nowPage=${p}&cntPerPage=${paging.cntPerPage}" class="page-link">${p }</a>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			    <c:if test="${paging.endPage != paging.lastPage}">
			    	<li class="page-item">
						<a href="${contextPath }/board/paginglist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" class="page-link">&gt;</a>
					</li>
				</c:if>
			</ul>
			</td>
			<td width="30%">
				<div align="right">
					<button class="list-insert" id="insert">
					<img src="../resources/logo/writing.png" width="20px">
					&nbsp;글 작성</button>
				</div>
			</td>
		</tr>
	</table>
<br>
</div>
</div>
</div>
</div>
<div class="col-sm-1"></div>
</div>
<br>
<%@include file="../include/footer.jsp" %>
</body>

<script>
	$('#insert').on('click' , function(){
		location.href="insert";
	})
</script>


</html>