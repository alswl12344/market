<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
	로그인 폼 : ${test }<br>
	<form action="${contextPath }/login/login4" method="post">
		아이디 : <input type="text" name = "userID"><br>
		이 름 : <input type="text" name="name"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>