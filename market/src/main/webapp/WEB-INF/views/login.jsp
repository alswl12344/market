<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<title>Home</title></head><body>

<%@include file="include/header.jsp"%>
<section class="content">
	<Form method="post">
	아이디 : <input type="text" name="userid" /><br>
	패스워드 : <input type="text" name="userpw" /><br>
	<input type="submit" value="로그인" />
	
	</Form>
	<hr>
	admin/12345<br>
</section>

		<br><br>
				<a href="SearchId"> <h3 class="box-title">아이디 찾기</h3></a>
				&nbsp;&nbsp;
				<a href="SearchPw"> <h3 class="box-title">비밀번호 찾기</h3></a>
<%@include file="include/footer.jsp"%>

</body>
</html>
