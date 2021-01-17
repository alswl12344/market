<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<html>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<%@include file="../include/header.jsp"%>
	<div class="container">
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-10">
					<div class="box-header">
						<h3 class="box-title">배송 현황</h3>
					</div>


	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	<div class="table-responsive">
	  <table class="list-table">
	<tr class="list-tr-top">
	  	<th class="list-td">주문번호</th>
	  	<th class="list-td">결제일 </th>
	  	<th class="list-td">결제 금액</th>
	  	<th class="list-td">수령인</th>
	  	<th class="list-td">주소지 </th>
	  	<th class="list-td">결제 방식</th>
	  	<th class="list-td">상태</th>
	  	
	  </tr>
	<c:forEach var="delivery" items="${list }">
	 	<tr class="list-tr">
	 	<td class="list-td"> ${delivery.ordernumber}</td>
	 	<td class="list-td"> ${delivery.orderdate}</td>
	  	<td class="list-td"> ${delivery.orderprice}</td>
	 	<td class="list-td"> ${delivery.orderreceivename}</td>
	 	<td class="list-td"> ${delivery.ordermanagementaddress}</td>
	 	<td class="list-td"> ${delivery.ordertypename}</td>
	 	<td class="list-td"> ${delivery.orderstatus}</td>
	 	<c:if test="${delivery.orderpaytype == 3}">
	 		<td class="list-td"><button class="product-button" onclick="location.href='${contextPath}/order/moneycheck?ordercode=${delivery.ordercode}'" value="${delivery.ordercode}">입금 확인</button></td>
	 	</c:if>
	 	</tr>
	</c:forEach>
	</table>
	
	</div>
</div>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<script>
	function checkmoney(value){
		var ordercode = value;
		location.href = "${contextPath}/order/moneycheck?ordercode="+ordercode;
	}
</script>
<%@include file="../include/footer.jsp" %>
</body>
</html>