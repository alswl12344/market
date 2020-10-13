<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<title>main</title></head><body>

<%@include file="include/header.jsp"%>
<section class="content">
	<div>
		 전달 받은 내용 출력 : ${name }
	</div>
</section>
<%@include file="include/footer.jsp"%>

</body>
</html>
