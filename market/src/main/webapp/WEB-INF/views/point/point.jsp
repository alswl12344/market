<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>

<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false" link="blue">
	<%@include file="../include/header.jsp"%>

	<div class="container">

		<div class="card-body bg-white mt-0 shadow">
			<p style="font-weight: bold">카카오페이 현재 사용가능</p>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
			<p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
			<button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">충 전 하 기</button>						
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>
</body>
<%@include file="../include/import.jsp"%>

</html>