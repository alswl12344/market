<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>

</head>
<body>
<%@include file="../include/header.jsp" %>
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
<c:forEach var="board" items="${list }">
 	<tr>
 	<td>${board.bno}</td>
 	<td><a href="detail?bno=${board.bno}"> ${board.btitle} </a></td>
 	<td>${board.bdate}</td>
 	<td>${board.bwriter}</td>
 	<td><span class="badge">${board.breadcnt }</span></td>
 	</tr>
</c:forEach>
<tr>
<td colspan="5" align="center">
<input class="btn btn-success" type="button" value="메인으로" 
id="main" />

</td>
</tr>
  </table>
</div>


<%@include file="../include/footer.jsp" %>
</body>

<script>
	$('#main').on('click' , function(){
		location.href="${pageContext.request.contextPath}";
	})
</script>


</html>