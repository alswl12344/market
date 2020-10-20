<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
<!-- 상세 보기  -->
</head>
<body>
	<%@ include file="include/header.jsp"%>
<script>
	// ajax를 통한 댓글 쓰기
	$(document).ready(function(){
		console.log("1111");
		// var str = "<h3>아작스 댓글 목록</h3>"
		// 댓글 목록 불러오는 아작스 함수 작성
		replylist();
		
		// $("#ajaxReply").html(str);
		
		// 댓글 저장 버튼 클릭 이벤트 (댓글 쓰기)
		// $("#btnReplySave").on('click', function)
		$(document).on('click','#btnReplySave', function(){
			var rememo = $("#rememo").val();
			var rewriter = $("#rewriter").val();
			var url = "${pageContext.request.contextPath}/board/reply"; //아작스 수정
			var paramData = {
					"rewriter" : rewriter,
					"rememo" : rememo,
					"bno" : '${board.bno}'
			}; //추가 데이터
			
			$.ajax({
				type: "POST",
				url: url,
				data: paramData,
				dataType: 'json',
				success: function(result){ // result<=>data<=>log
					replylist();
					$("#rememo").val('');
					$("#rewriter").val('');
				},
				error: function(data){
					console.log(data);
					alert("에러");
				}
			});
			
		});
	});
	
	
	
	// 댓글 아작스 통신 실시
	function replylist() {
		var url = "${pageContext.request.contextPath}/board/replylist";
		var paramData = {"bno" : "${board.bno}"}
		$.ajax({
			url: url, // 주소 -> 컨트롤 매핑 주소
			data: paramData, // 요청 데이터(해당 글번호)
			dataType: 'json', // 데이터 타입
			type: 'POST', // 전송 방식(GET/POST)
			success: function(result){ // result 혹은 data (지정 변수)
				alert("성공");
				var htmls = "";
				if(result.length < 1){
					htmls = htmls + "<h3>등록된 댓글이 없습니다.</h3>";
				}
				else {
					$(result).each(function(){
						htmls = htmls + '<div class="media text-muted pt-3" id="reno' +this.reno+'">';
										//<div id="reno12"> <div id="reno13">
						htmls += '<span class="d-block">';
			            htmls += this.reno + ' - ';
			          	htmls += '<strong class="text-gray-dark">' + this.rewriter + '</strong>';
			      		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			           	htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.reno + ', \'' + this.rewriter + '\', \'' + this.rememo + '\' )" style="padding-right:5px">수정</a>';
			     		htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.reno + ')" >삭제</a>';
			      		htmls += '</span>';
			            htmls += '</span><br>';
			        	htmls += this.rememo;
			        	htmls += '</p>';
			        	htmls += '</div>';      
	
					}); // each End
				}
				$("#replylist").html(htmls);
				// $("replylist").html(result)
				
			}, // Ajax success End
			error: function(data){
				alert("에러 발생"+data);
			}
		});
		
	} // replylist() End
	
	function fn_editReply(reno, rewriter, rememo){
		var htmls = "";
		htmls = htmls + '<div class="media text-muted pt-3" id="reno' +reno+'">';
		//<div id="reno12"> <div id="reno13">
		htmls += '<span class="d-block">';
		htmls += reno + ' - ';
		htmls += '<strong class="text-gray-dark">' + rewriter + '</strong>';
		htmls += '<span style="padding-left: 7px; font-size: 9pt">';
		htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + reno + ', \'' + rewriter + '\')" style="padding-right:5px">저장</a>';
		htmls += '<a href="javascript:void(0)" onclick="replyList()" >취소</a>';
		htmls += '</span>';
		htmls += '</span><br>';
		htmls += '<textarea name="editmemo" id="editmemo" class="form-control" rows="3">'
		htmls += rememo;
		htmls += '</textarea>'
		htmls += '</p>';
		htmls += '</div>';
		
		// 선택한 요소를 다른 것으로 바꿉니다. (변경 : replaceWith)
		// 선택자 $('#reno'+reno)
		$('#reno'+reno).replaceWith(htmls);
		$('#reno'+reno+' #editmemo').focus();
		// focus : 초점 옮기는 거 (커서가 깜빡이게 하는 것)
	} // fn_editReply End
	
	function fn_updateReply(reno,rewriter){
		// val = value
		var editmemo = $("#editmemo").val();
		console.log(rewriter);
		var url = "${pageContext.request.contextPath}/board/replyUpdate"; //아작스 수정
		var paramData = {
				"reno" : reno,
				"rewriter" : rewriter,
				"rememo" : editmemo
		}; //수정 데이터
		
		$.ajax({
			type: "POST",
			url: url,
			data: paramData,
			dataType: 'json',
			success: function(result){ // result<=>data<=>log
				console.log(result);
				replylist();
			},
			error: function(data){
				console.log(data);
				alert("에러");
			}
		});
	}
	
	function fn_deleteReply(reno){
		var url = "${pageContext.request.contextPath}/board/replyDelete2"; //아작스 삭제
		var paramData = {
				"reno" : reno,
		}; //삭제 데이터
		
		$.ajax({
			type: "POST",
			url: url,
			data: paramData,
			dataType: 'json',
			success: function(result){ // result<=>data<=>log
				console.log(result);
				replylist();
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
					<label>제목</label> <input type="text" name="title"
						class="form-control" value="${board.btitle}" readonly="readonly" />
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${board.bcontent}</textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input type="text" name="id"
						class="form-control" value="${user.name}" readonly="readonly" />
				</div>
			</div>

		</div>
		<div class="box-footer">
			<button class="btn btn-success">메인</button>
			<button class="btn btn-warning">수정</button>
			<button class="btn btn-danger">삭제</button>
			<button class="btn btn-primary">목록</button>
		</div>
		</div>
	</section>
				<script>
	$(function(){
		//메인 버튼을 눌렀을 때 처리
		$(".btn-success").click(function(){
			location.href="../";
		});
		//목록 버튼을 눌렀을 때 처리
		$(".btn-primary").click(function(){
			location.href="list";
		});
		//삭제 버튼을 눌렀을 때 처리
		$(".btn-danger").click(function(){
			location.href="delete?bno=" + ${board.bno};
		});
		//수정 버튼을 눌렀을 때 처리
		$(".btn-warning").click(function(){
			location.href="update?bno=" + ${board.bno};
		});
	})
	</script>
	<div>
		<div class="box-body">
			<table>
				<tr>
					<td rowspan="2" width="70%"><textarea class="form-control" rows="3" name="rememo" id="rememo" placeholder="댓글을 입력하세요."></textarea></td>
					<td><input type="text" name="rewriter" id="rewriter" placeholder="댓글 작성자"></td>
				</tr>
				<tr>
					<td><button type="button" id="btnReplySave">저장</button></td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<div id="replylist">
	</div>


</body>
</html>
