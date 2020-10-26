<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>List</title>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="${contextPath }/dong/board/paginglist?nowPage=${paging.nowPage}&cntPerPage=5";
	}
</script>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<%@include file="../include/header.jsp" %>
<div class="container">
		<div class="row">
			<div class="col-sm-12">
					<div class="box-header">
						<h3 class="box-title">게시판</h3>
					</div>
<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> 
 <div>${msg}</div>
<div class="table-responsive">
  <table class="table">
  <tr>
  	<td>글번호</td>
  	<td>제목</td>
  	<td>작성일</td>
  	<td>작성자</td>
  	<td>조회수</td>
  </tr>
<c:forEach var="board" items="${listAll }">
 	<tr>
 	<td>${board.bno}</td>
 	<td><a href="detail?bno=${board.bno}"> ${board.btitle} </a></td>
 	<td>${board.bdate}</td>
 	<td>${board.bwriter}</td>
 	<td><span class="badge">${board.breadcnt }</span></td>
 	</tr>
</c:forEach>
	</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="${contextPath }/board/paginglist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${contextPath }/board/paginglist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${contextPath }/board/paginglist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	<input class="btn btn-success" type="button" value="메인으로" 
id="main" />
<input class="btn" type="button" value="글쓰기" 
id="insert" />
<br>
</div>

</div>
</div>
</div>
</div>

<%@include file="../include/footer.jsp" %>
</body>

<script>
	$('#main').on('click' , function(){
		location.href="${pageContext.request.contextPath}";
	})
	$('#insert').on('click' , function(){
		location.href="insert";
	})
</script>


</html>