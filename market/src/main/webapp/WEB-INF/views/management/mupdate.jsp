<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<%@include file="../include/header.jsp"%>
<%@include file="../include/adressSearch.jsp"%>

		<section class="content">
			<div class="box-header">	
				<br>
				<h3 class="box-title">주소지 수정</h3>
			</div>
			<form role="form" method="post">
				<table class="dupdate-table">
            		<tr>
            			<td class="join-table-title">이름</td>
            			<td><input type="text" name='mname' class="form-control"  value="${management.mname}"></td>
            		</tr>
            		<tr>
            			<td class="join-table-title">주소</td>
				<td>
				<input name = "maddress" type="text" id="sample6_postcode" placeholder="우편번호">
				<input name = "maddress" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input name = "maddress" type="text" id="sample6_address" placeholder="주소"><br>
				<input name = "maddress" type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">연락처</td>
            			<td><input type="text" name='mnum' class="form-control"  value="${management.mnum}"></td>
            		</tr>
            		<tr>
            			<td class="join-table-title">받는 사람</td>
            			<td><input type="text" name="username" class="form-control" readonly="readonly"  value="${user.username}"></td>
            			<td><input type="hidden" name="userid" class="form-control" readonly="readonly"  value="${user.userid}"></td>
            		</tr>
            		
            	</table>
				<!-- 수정에 사용할 글번호 -->
					<input type="hidden" name="mcode" value="${management.mcode }" />
				<div class="join-footer" align="center">
					<br>
					<button type="submit" class="join-button">수정 완료</button>
				</div>
				
			</form>
		</section>
		<%@include file="../include/footer.jsp"%>
</body>
</html>