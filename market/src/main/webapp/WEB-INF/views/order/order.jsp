<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false" link="blue">

	<%@include file="../include/header.jsp"%>
	<%@include file="../include/adressSearch.jsp"%>


	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="box-header">
					<h3 class="box-title">결제페이지</h3>
				</div>
				<div class="table-responsive">
						<table class="table">
							<tr style="border: none;">
								<td style="border: none;" value = "${productname } ${countArr }" id = "ordername">구매상품 : <a href="#"
									onclick="ProductShow()">${productname } ${countArr }</a><br>
								</td>
							</tr>
							
							<tr style="border: none; display: none;" id="orderProduct">
								<td style="border: none;" id="orderProduct"><c:forEach
										var="orderProduct" items="${orderlist}">
								&nbsp;&nbsp;&nbsp;&nbsp;
								상품명 : ${orderProduct.cname }&nbsp;
								X${orderProduct.cbuycount }개<br>
									</c:forEach></td>
							</tr>
							
							<tr>
								<td>결제금액 : ${sumPrice }원 <br> 보유 포인트 : ${point}원
								</td>
							</tr>
							
							<tr>
								<td>결제방식 : <select onChange="payType(this.value)"	id="selectPay">
										<option value="0">선택</option>
										<option value="3">무통장입금</option>
										<option value="2">포인트차감</option>
								</select><br>
									<div id="account"></div>
							</tr>
							
							<tr>
								<td>주문주소 선택 : 
									<input type="radio" id = "delivery" name="delivery" onchange="delivery_chk(this.value)" value="0">등록된배송지 
									<input	type="radio" id = "delivery" name="delivery" onchange="delivery_chk(this.value)" value="1">신규배송지 <br>
									받는사람 : 
									<input type="text" name="receivename" id = "receivename" 
									placeholder="이름을 입력하세요">
								</td>
							</tr>
							
							<tr>
								<td id="delivery_insert"></td>
								<!-- 결제 방식 선택에 따라 결과가 들어올 자리  -->
							</tr>
							
							<tr>
								<td id="maddress" value=""></td>
							</tr>
							
							<tr>
								<td colspan="3" align="center">
								<button type="button" id="ordercomfirmbtn" onclick = "countcheck()">결제</button>
								<button type="button" class="selectDelete_btn">선택 삭제</button>
								</td>
							</tr>
						</table>
				</div>
			</div>
		</div>
	</div>

	<script>
		function ProductShow() { // 구매할 상품의 세부 정보 리스트를 보여주고 감추기
			var x = document.getElementById("orderProduct");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		};

		function payType(type, select) { // 결제방식 선택에 따라 계좌번호 / 카카오페이 출력
			var htmls = "";
			if (type == '3') {
				htmls += "&nbsp;&nbsp;&nbsp; - 신한 : 110-334-535608 고동수"
			} else if (type == '2') {
				htmls += "결제금액  : ${sumPrice}원 / 보유포인트 : ${point}<br>";
				htmls += "결제 후 포인트 : ${point - sumPrice}원";
				htmls += "<c:if test='${sumPrice > point}'>";  
				htmls += "<td style='color: red'>보유하신 포인트가 부족합니다. ";
				htmls += "<a href='${contextPath }/user/chargepoint'>충전하기</a></td>";
				htmls += "</c:if>";
			} else {
				htmls = "";
			}
			$('#account').html(htmls);
		};

		function delivery_chk(value) { // 배송지 선택 방식 메소드 출력 - 저장된 주소목록 불러오기 or 신규 주소 등록 (비회원을 위해)
			var htmls = "배송지 입력 : ";
			console.log(value);
			if (value == '0') {
				htmls += '<a href="${contextPath }/delivery/management?userid=${user.userid}">배송지관리</a>';
				htmls += '<br> <select name="delSel" id="delSel" onclick="deliverySel(this.value)">';
				htmls += '<option value=" ">선택</option>';
				htmls += '<c:forEach var="delivery" items="${deliverylist}">';
				htmls += '<option value="${delivery.maddress} ">${delivery.mname }</option>';
				htmls += '</c:forEach>';
				htmls += '</select>';
			} else {
				htmls += '<br>';
				htmls += '<input type="text" id="sample6_postcode" placeholder="우편번호">';
				htmls += '<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>';
				htmls += '<input type="text" id="sample6_address" placeholder="주소"><br>';
				htmls += '<input type="text" id="sample6_detailAddress" placeholder="상세주소">';
				htmls += '<input type="text" id="sample6_extraAddress" placeholder="참고항목">';
			}
// 			orderConfirm(addressvalue)
			$("#delivery_insert").html(htmls);
			htmls = ""; // 초기화
		};

		function deliverySel(value) { // 결제방식 선택에 따라 동작하는 메소드
			console.log("deliverySel"+value);
			$("#maddress").html(value);
			$('#maddress').val(value); // $("#maddress")의 value값을 value로 변경
		};
		
		function countcheck(){		
			var orderprice = ${sumPrice };
			var paramData = {
					"orderprice" : orderprice
				};		
			$.ajax({
				type : "POST",
				url : "${contextPath }/order/ordercountcheck",
				data : paramData,
				dataType : 'json',
				success : function(result) {
					console.log(result);
					console.log(result.msg);
					if(result != ""){
						alert("재고가부족합니다 : "+ result);
					}else{
						orderConfirm(); // 재고부족이 아닐 시 결제 프로세스를 진행시킴
					}
				},
				error : function(data){
					console.log(data);
					alert("오류발생 : "+ data);
				}
				
			});
		};
			
		
		
		function orderConfirm(){
			var orderprice = ${sumPrice };
			var orderpaytype = $("#selectPay").val();
			var orderreceivename = $("#receivename").val();
			var ordermanagementaddress = "";
			var ordername = $("#ordername").val()			
			console.log(ordername);
			console.log("address"+$("#maddress").val());
			if ($("#maddress").val() == ""){
				console.log('여기왔다');
				ordermanagementaddress = $("#sample6_postcode").val()+$("#sample6_address").val()+$("#sample6_detailAddress").val();
			} else {
				console.log('여기로 왔다');
				ordermanagementaddress = $("#maddress").val()
			}
			var paramData = {
					"orderprice" : orderprice,
					"orderpaytype" : orderpaytype,
					"orderreceivename" : orderreceivename,
					"ordermanagementaddress" : ordermanagementaddress
				};		
			$.ajax({
				type : "POST",
				url : "${contextPath }/order/order",
				data : paramData,
				dataType : 'json',
				success : function(result) {
					location.href = "${contextPath }/delivery/dview";
				},
				error : function(data){
					console.log(data);
					alert("오류발생 : "+ data);
				}
				
			});
		};
		
	</script>
	<%@include file="../include/footer.jsp"%>

	

</body>
</html>