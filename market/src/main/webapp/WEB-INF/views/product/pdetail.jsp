<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<%@ include file="../include/header.jsp"%>
	<script>
	
	$(function(){
		// 버튼을 눌렀을 때 처리

		$('#pupdate').on('click' , function(){
			location.href="pupdate?pcode=" + ${Product.pcode};
		})
		$('#pdelete').on('click' , function(){
			location.href="pdelete?pcode=" + ${Product.pcode};
		})
	
		$('#pdeldelete').on('click' , function(){
			location.href="pdeldelete?pcode=" + ${Product.pcode};
		})
		
		$('#addcart').on('click' , function(){
			var pbuycountval =  $("#pbuycount").val();
			location.href="addcart?pcode=${Product.pcode}&customerid=${user.userid }&pbuycount=" +pbuycountval;
			Swal.fire({
				icon : 'success',
				title : "장바구니에 상품을 추가했습니다."
				})
		});	
	});
	
	
	
	// ajax를 통한 댓글 쓰기
	$(document).ready(function(){
	
		// 댓글 목록 불러오는 아작스 함수 작성
		pReplylist();
		
	
		
		// 댓글 저장 버튼 클릭 이벤트 (댓글 쓰기)
// 		 $("#btnpReplySave").on('click', function){}
		$(document).on('click','#btnpReplySave', function(){
			var pmemo = $("#pmemo").val();
			var pwriter = $("#pwriter").val();
			var predate = $("#predate").val();
			var url = "${pageContext.request.contextPath}/Product/pReply"; //아작스 수정
			var paramData = {
					"pwriter" :'${user.username}',
					"pmemo" : pmemo,
					"predate" : predate,
					"pcode" : '${Product.pcode}'
			}; //추가 데이터
			
			$.ajax({
				type: "POST",
				url: url,
				data: paramData,
				dataType: 'json',
				success: function(result){ // result<=>data<=>log
					Swal.fire({
						icon : 'success',
						title : '댓글을 등록하였습니다.'
					})
					pReplylist();
					$("#pmemo").val('');
					$("#pwriter").val('');
					$("#predate").val('');
				},
				error: function(data){
					console.log(data);
					Swal.fire({
						icon : 'error',
						title : data
					})
				}
			});
			
		});
	});
	
	
	
	// 댓글 아작스 통신 실시
	function pReplylist() {
		var url = "${pageContext.request.contextPath}/Product/pReplylist";
		var paramData = {"pcode" : "${Product.pcode}"}
		$.ajax({
			url: url, // 주소 -> 컨트롤 매핑 주소
			data: paramData, // 요청 데이터(해당 글번호)
			dataType: 'json', // 데이터 타입
			type: 'POST', // 전송 방식(GET/POST)
			success: function(result){ // result 혹은 data (지정 변수)
				
				var htmls = "";
				if(result.length < 1){
				}
				else {
					$(result).each(function(){
						htmls = htmls + '<div id="preno' +this.preno+'">';
										//<div id="reno12"> <div id="reno13">
						htmls += '<hr><span class="d-block">';
						htmls += '<strong class="reply-list"><span style="font-size:12pt">'+ this.pwriter + '</span></strong>';
						htmls += '<span style="font-size: 9pt; color: #999399;">';
						htmls += '<br>'+ this.predate;
						htmls += '</span>';
						htmls += '<br>';
						htmls += '<div style="padding-left:10px; padding-top:5px;">';
			        	htmls += this.pmemo;
			        	htmls += '</div>';
						htmls += '<div align="right" class="reply-button">';
						htmls += '<span style="font-size: 9pt">';
						htmls += '<a href="javascript:void(0)" onclick="fn_editpReply('
							+ this.preno + ', \''
							+ this.pwriter + '\', \''
							+ this.pmemo + '\' )" style="padding-right:10px;">수정</a>';
						htmls += '<a href="javascript:void(0)" style="padding-right:10px;" onclick="fn_deletepReply('+ this.preno
							+ ')" >삭제</a>';
						htmls += '</span>';
						htmls += '</span>';
						htmls += '</div>';
						htmls += '</div>';
	
					}); // each End
				}
				$("#pReplylist").html(htmls);
				// $("replylist").html(result)
				
			}, // Ajax success End
			error: function(data){
				Swal.fire({
					icon : 'error',
					title : data
				})
			}
		});
		
	} // replylist() End
	
	function fn_editpReply(preno, pwriter, pmemo){
		var htmls = "";
		htmls = htmls + '<div id="preno' +preno+'">';
		//<div id="reno12"> <div id="reno13">
		htmls += '<hr><span class="d-block">';
		htmls += '<strong class="reply-list"><span style="font-size:12pt">' + pwriter + '</strong></span>';
		htmls += '</span>';
		htmls += '<div style="padding-top:10px; padding-bottom:10px;">';
		htmls += '<textarea name="editpmemo" id="editpmemo" class="form-control" rows="3">'
		htmls += pmemo;
		htmls += '</textarea>'
		htmls += '</div>';
		htmls += '<div align="right" class="reply-button">';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updatepReply(' + preno + ', \'' + pwriter + '\')" style="padding-right:10px">저장</a>';
		htmls += '<a href="javascript:void(0)" style="padding-right:10px;" onclick="pReplylist()" >취소</a>';
		htmls += '</span>';
		htmls += '</span><br>';
		htmls += '</p>';
		htmls += '</div>';
		
		// 선택한 요소를 다른 것으로 바꿉니다. (변경 : replaceWith)
		// 선택자 $('#reno'+reno)
		$('#preno'+preno).replaceWith(htmls);
		$('#preno'+preno+' #editpmemo').focus();
		// focus : 초점 옮기는 거 (커서가 깜빡이게 하는 것)
	} // fn_editReply End
	
	function fn_updatepReply(reno,rewriter){
		// val = value
		var editpmemo = $("#editpmemo").val();
		console.log(pwriter);
		var url = "${pageContext.request.contextPath}/Product/pReplyUpdate"; //아작스 수정
		var paramData = {
				"preno" : preno,
				"pwriter" : pwriter,
				"pmemo" : editpmemo
		}; //수정 데이터
		
		$.ajax({
			type: "POST",
			url: url,
			data: paramData,
			dataType: 'json',
			success: function(result){ // result<=>data<=>log
				console.log(result);
				pReplylist();
			},
			error: function(data){
				console.log(data);
				Swal.fire({
					icon : 'error',
					title : data
				})
			}
		});
	}
	
	function fn_deletepReply(preno){
		var url = "${pageContext.request.contextPath}/Product/pReplyDelete"; //아작스 삭제
		var paramData = {
				"preno" : preno
		}; //삭제 데이터
		
		$.ajax({
			type: "POST",
			url: url,
			data: paramData,
			dataType: 'json',
			success: function(result){ // result<=>data<=>log
				console.log(result);
				pReplylist();
			},
			error: function(data){
				console.log(data);
				Swal.fire({
					icon : 'error',
					title : data
				})
			}
		});
	}

	
	
	

	</script>
	
<div class="container">
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-10">
		<div class="box">
			<div class="logo">
					<a href="${contextPath }/Product/ProductPaging">
					<img src="../resources/logo/logo.png" class="logo-detail"/>
					</a>
					<br>
				</div>
			<br>
			<div class="box-body">
				<table class="product-table">
					<tr>
						<td rowspan="5" style="width:40%;">
							<div align="center"> 
			               <img src="${Product.pimage}" style="width:90%;"/>  
			               </div>         
						</td>
						<td colspan="2" class="product-name">${Product.pname}</td>
					</tr>
					<tr>
						<td class="product-title">재고 수량</td>
						<td>${Product.pcount}</td>
					</tr>
					<tr>
						<td class="product-title">구매 수량</td>
						<td><input type="text" name="pbuycount" id = "pbuycount" value = "1"
						class="form-control" /></td>
					</tr>
					<tr>
						<td class="product-title">가격</td>
						<td>${Product.pprice}</td>
					</tr>
					<tr>
						<td class="product-title">등록일자</td>
						<td>${Product.pdate}</td>
					</tr>
				</table>
				<input type = "hidden" id = "sessionuserid" value = "${user.userid }">
			</div>
		<table style="width:100%;">
			<tr>
				<td>
				<div style="padding-left:10px;">
					<c:if test="${user.userid == 'admin'}">
					<input class="product-button" type="button" value="상품 수정" id="pupdate" />
					<c:set var="ifdelete" value="${Product.pdel}"/>
					<c:choose>
						<c:when test="${ifdelete eq '0'}">
						<input class="product-button" type="button" value="상품 삭제"  id="pdelete" />
						</c:when>
					<c:when test="${ifdelete eq '1'}">
						<input class="product-button" type="button" value="상품 재등록"  id="pdeldelete"  />
						</c:when>
					</c:choose>
					</c:if>
				</div>
				</td>
				<td>
					<div align="right" style="padding-right:20%;">
					<input type="button" value="장바구니 담기" id="addcart"  class="login-button"/>
					</div>
				</td>
			</tr>
		</table>
		</div>
		<br>
		<hr class="mypage-hr">
		<h5 class="sub-title">상품 설명</h5>
		<hr class="detail-hr">
			<div style="padding : 20px;">
				<div align="center">
				<c:forEach var="img" items="${Image }">
			        <img src = "${img.imgviewpath}" style="width:80%;"/>           
			    </c:forEach>
			    </div>
			    <br>
			    <br>
				${Product.pcontent}
			</div>
		<hr class="mypage-hr">

	<div>
		<div class="box-body">
			<br>
				<table class="reply-input">
					<tr>
						<td>
						<textarea class="form-control" rows="4" name="pmemo" id="pmemo" placeholder="싱품 평을 입력하세요."></textarea></td>
					</tr>
					<tr>
						<td>
						<div align="right">
						<button type="button" id="btnpReplySave" class="reply-save">
						<img src="../resources/logo/writing.png" width="20px">
						&nbsp;저장</button>
						</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	<div style="width:100%;" id="pReplylist">
	</div>
	</div>
	<div class="col-sm-1"></div>
	</div>
	</div>
	<br>
		<%@include file="../include/footer.jsp"%>
</body>
</html>
