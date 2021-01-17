<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%@include file="../include/header.jsp"%>
	<%@include file="../include/adressSearch.jsp"%>

	<section class="content">
   <div class="box-header">
   		<br>
      <h3 class="box-title">주소지 등록</h3>
   </div>
   <hr class="mypage-hr">
   <form role="form" method="post">
            <div class="form-group">
            
            	<table class="minsert-table">
            		<tr>
            			<td class="join-table-title">배송지 이름</td>
            			<td><input type="text" name='mname' class="form-control" placeholder="이름을 입력하세요"></td>
            		</tr>
            		<tr>
            			<td class="join-table-title">주소</td>
            	<td>
            <br>
				<input name = "maddress" type="text" id="sample6_postcode" placeholder="우편번호">
				<input name = "maddress" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input name = "maddress" type="text" id="sample6_address" placeholder="주소"><br>
				<input name = "maddress" type="text" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
            		</td>
            		</tr>
            		
            		<tr>
            			<td class="join-table-title"><br>연락처</td>
            			<td colspan="2"><br>
            			<input type="text" name="mnum" class="form-control" placeholder="연락처를 입력하세요">
                  		</td>
            		</tr>
            	</table>
            		<input type="hidden" name="userid" value="${user.userid }">
            </div>
      <hr class="mypage-hr">
      <div class="join-footer" align="center">
			<button type="submit" class="join-button">작성 완료</button>
			<button type="reset" class="join-button-white">작성 취소</button>
		</div>
   </form>

</section>
		

<%@include file="../include/footer.jsp"%>
					

</body>
</html>