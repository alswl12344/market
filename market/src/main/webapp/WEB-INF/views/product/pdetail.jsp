<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<script>
	
	$(function(){
		//메인 버튼을 눌렀을 때 처리
		
		$('#main').on('click' , function(){
			location.href="${pageContext.request.contextPath}";
		})
		$('#plist').on('click' , function(){
			location.href="ProductPaging";
		})
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
			location.href="addcart?pcode=${Product.pcode}&customerid=${user.userid }";
			alert('상품이 장바구니에 추가되었습니다');
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
			var url = "${pageContext.request.contextPath}/Product/pReply"; //아작스 수정
			var paramData = {
					"pwriter" : pwriter,
					"pmemo" : pmemo,
					"pcode" : '${Product.pcode}'
			}; //추가 데이터
			
			$.ajax({
				type: "POST",
				url: url,
				data: paramData,
				dataType: 'json',
				success: function(result){ // result<=>data<=>log
					alert("댓글 등록 성공")
					pReplylist();
					$("#pmemo").val('');
					$("#pwriter").val('');
				},
				error: function(data){
					console.log(data);
					alert("에러"+ data);
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
					htmls = htmls + "<h5>등록된 상품평이 없습니다.</h5>";
				}
				else {
					$(result).each(function(){
						htmls = htmls + '<div class="media text-muted pt-3" id="preno' +this.preno+'">';
										//<div id="reno12"> <div id="reno13">
						htmls += '<span class="d-block">';
			            htmls += this.preno + ' - ';
			          	htmls += '<strong class="text-gray-dark">' + this.pwriter + '</strong>';
			      		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			           	htmls += '<a href="javascript:void(0)" onclick="fn_editpReply(' + this.preno + ', \'' + this.pwriter + '\', \'' + this.pmemo + '\' )" style="padding-right:5px">수정</a>';
			     		htmls += '<a href="javascript:void(0)" onclick="fn_deletepReply(' + this.preno + ')" >삭제</a>';
			      		htmls += '</span>';
			            htmls += '</span><br>';
			        	htmls += this.pmemo;
			        	htmls += '</p>';
			        	htmls += '</div>';      
	
					}); // each End
				}
				$("#pReplylist").html(htmls);
				// $("replylist").html(result)
				
			}, // Ajax success End
			error: function(data){
				alert("에러 발생"+data);
			}
		});
		
	} // replylist() End
	
	function fn_editpReply(pcode, pwriter, pmemo){
		var htmls = "";
		htmls = htmls + '<div class="media text-muted pt-3" id="pcode' +pcode+'">';
		//<div id="reno12"> <div id="reno13">
		htmls += '<span class="d-block">';
		htmls += preno + ' - ';
		htmls += '<strong class="text-gray-dark">' + pwriter + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updatepReply(' + preno + ', \'' + pwriter + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onclick="pReplylist()" >취소</a>';
		htmls += '</span>';
		htmls += '</span><br>';
		htmls += '<textarea name="editpmemo" id="editpmemo" class="form-control" rows="3">'
		htmls += pmemo;
		htmls += '</textarea>'
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
				alert("에러");
			}
		});
	}
	
	function fn_deletepReply(preno){
		var url = "${pageContext.request.contextPath}/Product/pReplyDelete"; //아작스 삭제
		var paramData = {
				"preno" : preno,
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
				alert("에러");
			}
		});
	}

	
	
	

	</script>
	
	<section class="content">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">상세보기</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<label>상품명</label> <input type="text" name="title"
						class="form-control" value="${Product.pname}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label>상품 이미지</label>
					<c:forEach var="img" items="${Image }">
 					<tr>
 					<td><img src = "${img.imgviewpath}"/></td>					
 					
 					</tr>
 					</c:forEach>
				</div>

				<div class="form-group">
					<label>상품 설명</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${Product.pcontent}</textarea>
				</div>

				<div class="form-group">
				<div class="col-sm-4"><label>수량</label> <input type="text" name="id"
						class="form-control" value="${Product.pcount}" readonly="readonly" /></div>
				<div class="col-sm-4">	
					<label>가격</label> <input type="text" name="id"
						class="form-control" value="${Product.pprice}" readonly="readonly" />
					</div>
					<div class="col-sm-4"><label>등록일자</label> <input type="text" name="id"
						class="form-control" value="${Product.pdate}" readonly="readonly" />		
				</div>
				</div>
			</div>

		</div>
		
		<div class="box-footer">
		<input class="btn btn-success" type="button" value="메인으로 돌아가기"  id="main" />
		<input class="btn btn-primary" type="button" value="목록으로 돌아가기"  id="ProductPaging" />
		<input class="btn btn-warning" type="button" value="상품 수정하기"  id="pupdate" />
	<input class="btn btn-danger" type="button" value="장바구니 담기" id="addcart" />
		
		<c:set var="ifdelete" value="${Product.pdel}"/>
		
		<c:choose>
			<c:when test="${ifdelete eq '0'}">
			<input class="btn btn-danger" type="button" value="상품 삭제하기"  id="pdelete" />
			</c:when>
		<c:when test="${ifdelete eq '1'}">
			<input class="btn btn-danger" type="button" value="상품 재등록하기"  id="pdeldelete"  />
			</c:when>
		</c:choose>
		
		</div>
	
	<div>
		<div class="box-body">
			<table>
				<tr>
					<td rowspan="2" width="70%"><textarea class="form-control" rows="3" name="pmemo" id="pmemo" placeholder="상품평을 입력하세요."></textarea></td>
					<td><input type="text" name="pwriter" id="pwriter" placeholder="평 작성자"></td>
				</tr>
				<tr>
					<td><button type="button" id="btnpReplySave">저장</button></td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<div id="pReplylist">
	</div>
	
	
	
	
	</section>
<hr><p></p><p></p>

</body>
</html>
