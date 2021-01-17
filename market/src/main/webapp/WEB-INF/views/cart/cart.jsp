<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>

<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<%@include file="../include/header.jsp"%>

	<div class="container">
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<div class="logo">
					<img src="../resources/logo/logo.png" class="logo-detail"/>
					<br>
				</div>
					<table class="list-table">
						<tr class="list-tr-top">
							<td class="list-td-top">선택</td>
							<td class="list-td-top">상품명</td>
							<td class="list-td-top">상품 이미지</td>
							<td class="list-td-top">수량</td>
							<td class="list-td-top">금액</td>
							<td class="list-td-top">배송비</td>
						</tr>
							
							<c:forEach var="cart" items="${cartList }">
							<c:set var = "price" value = "0" />
								<tr>
									<td><input type="checkbox" name="chBox" class="chBox"
										data-cartNum="${cart.cartcode}" /></td>
									<td><a href="../Product/pdetail?pcode=${cart.pcode}">${cart.cname}</a></td>
									<td><a href="../Product/pdetail?pcode=${cart.pcode}"><img
											src="${cart.cimage}" style="width: 150px; height: 150px"></a></td>
									<td><input type = "number" value = "${cart.cbuycount}" onchange = "CartNumChange(this.value)" style = "width:100px"/></td>
									<c:set var = "price" value = "${cart.cbuycount*cart.cprice}" />
									<td><c:out value = "${price}"/></td>									
									<td>배송비</td>
								</tr>
							</c:forEach>
							<table style="width:100%;">
						<tr>
							<td style="width:30%; padding-left:20px;">
								<div class="allCheck">
									<input type="checkbox" name="allCheck" id="allCheck" />
									<label for="allCheck">모두 선택</label>
								</div>
							</td>
							<td>
								<div align="center" class="cart-footer">
									<button class="cart-button" type="button" id="selectBuy_btn">선택 구매</button>
									<button type="button" id="selectDelete_btn" class="cart-button-white">선택 삭제</button>
								</div>
							</td>
							<td style="width:30%;"></td>
						</tr>
					</table>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>

	<%@include file="../include/footer.jsp"%>
</body>

<script>
	//1. 모두 선택 체크 박스 클릭 시 동작
	$("#allCheck").click(function() {
		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}

		//1-2. 개별 체크 박스 클릭 시 모두 선택 체크박스 체크 해제
		$(".chBox").click(function() {
			$("#allCheck").prop("checked", false);
		});
	});
	//2. 선택 삭제 버튼 클릭 시 동작
	$(".selectDelete_btn").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");

		if (confirm_val) {
			var checkArr = new Array();

			$("input[class='chBox']:checked").each(function() {
				checkArr.push($(this).attr("data-cartNum"));
			});

			$.ajax({
				url : "${contextPath }/cart/deletecart",
				type : "post",
				data : {
					chbox : checkArr
				},
				success : function() {
					location.href = "${contextPath }/cart/cartlist?customerid=${user.userid }";
				}
			});
		}
	});
	//3. 구매하기 버튼 
		$("#selectBuy_btn").click(function() {			
			var checkArr = new Array();
			$("input[class='chBox']:checked").each(function() {
				checkArr.push($(this).attr("data-cartNum"));
			});
		
			$.ajax({
				url : "${contextPath }/cart/buycart",
				type : "post",
				data : {
					chbox : checkArr
				},
				success : function(data) {
					console.log("data.countArr :"+data.countArr);
					console.log("data.sumPrice :"+data.sumPrice);
					location.href = "${contextPath }/order/order?countArr="+data.countArr+"&sumPrice="+data.sumPrice+"&customerid=${user.userid}";
				}
			});		
	});
	// 4. 물품 구매 수량 변경
	function CartNumChange(value){
		$.ajax({
			url : "${contextPath }/cart/numchange",
			type : "POST",
			data : {
				cbuycount : value
			},
			success : function(data) {
				
			}
		});	
	}
</script>


</html>