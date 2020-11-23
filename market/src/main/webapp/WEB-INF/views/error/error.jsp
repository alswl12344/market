<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<body>

<%@include file="../include/header.jsp"%>
<section class="content">
	<h1>404 Error Code</h1><br>
	ERROR : 페이지가 없습니다.<br>
	경로 설정을 명확하게 이해하세요.<br>
	1. 컨트롤러에 매핑이 되지 않았습니다.<br>
	2. 경로에 페이지가 없습니다.<br>
	3. 무언가가 이상합니다.<br>
	4. 서버를 먼저 구동해서 오류가 있는지 확인하세요.<br>
	(매퍼가 이상이 있는 경우 서버 시작시 바로 오류나옴)
</section>
<%@include file="../include/footer.jsp"%>

</body>
</html>