<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${board.btitle}</title>
<!-- 상세 보기  -->
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<%@ include file="../include/header.jsp"%>
	<script>
		$(document).ready(function() {
			console.log("댓글 연결 완료");
			replylist();
			$(document).on('click', '#btnReplySave', function() {
				var rememo = $("#rememo").val();
				var rewriter = $("#rewriter").val();
				var redate = $("#redate").val();
				var url = "${pageContext.request.contextPath}/board/reply";
				var paramData = {
					"rewriter" : '${user.username}',
					"rememo" : rememo,
					"redate" : redate,
					"bno" : '${board.bno}'
				};

				$.ajax({
					type : "POST",
					url : url,
					data : paramData,
					dataType : 'json',
					success : function(result) {
						Swal.fire({
							icon : 'success',
							title : '댓글을 등록하였습니다.'
						})
						replylist();
						$("#rememo").val('');
						$("#rewriter").val('');
						$("#redate").val('');
					},
					error : function(data) {
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
		function replylist() {
			var url = "${pageContext.request.contextPath}/board/replylist";
			var paramData = {
				"bno" : "${board.bno}"
			}
			$.ajax({
				url : url,
				data : paramData,
				dataType : 'json',
				type : 'POST',
				success : function(result) {
					var htmls = "";
					if (result.length < 1) {
						
					} else {
						$(result).each(function() {
								htmls = htmls+ '<div id="reno' + this.reno + '">';
								htmls += '<hr><span class="d-block">';
								htmls += '<strong class="reply-list"><span style="font-size:12pt">'+ this.rewriter + '</span></strong>';
								htmls += '<span style="font-size: 9pt; color: #999399;">';
								htmls += '<br>'+ this.redate;
								htmls += '</span>';
								htmls += '<br>';
								htmls += '<div style="padding-left:10px; padding-top:5px;">';
								htmls += this.rememo;
								htmls += '</div>';
								htmls += '<div align="right" class="reply-button">';
								htmls += '<span style="font-size: 9pt">';
								htmls += '<a href="javascript:void(0)" onclick="fn_editReply('
									+ this.reno + ', \''
									+ this.rewriter + '\', \''
									+ this.rememo + '\' )" style="padding-right:10px;">수정</a>';
								htmls += '<a href="javascript:void(0)" style="padding-right:10px;" onclick="fn_deleteReply('+ this.reno
									+ ')" >삭제</a>';
								htmls += '</span>';
								htmls += '</span>';
								htmls += '</div>';
								htmls += '</div>';
								}); // each End
							}
							$("#replylist").html(htmls);

						}, // Ajax success End
						error : function(data) {
							Swal.fire({
								icon : 'error',
								title : data
							})
						}
					});

		} // replylist() End

		function fn_editReply(reno, rewriter, rememo) {
			var htmls = "";
			htmls = htmls+ '<div id="reno' +reno+'">';
			htmls += '<hr><span class="d-block">';
			htmls += '<strong class="reply-list"><span style="font-size:12pt">' + rewriter + '</strong></span>';
			htmls += '</span>';
			htmls += '<div style="padding-top:10px; padding-bottom:10px;">';
			htmls += '<textarea name="editmemo" id="editmemo" class="form-control" rows="3">'
			htmls += rememo;
			htmls += '</textarea>'
			htmls += '</div>';
			htmls += '<div align="right" class="reply-button">';
			htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateReply('
					+ reno + ', \'' + rewriter
					+ '\')" style="padding-right:10px">저장</a>';
			htmls += '<a href="javascript:void(0)" style="padding-right:10px;" onclick="replylist()" >취소</a>';
			htmls += '</span>';
			htmls += '</span><br>';
			htmls += '</p>';
			htmls += '</div>';

			$('#reno' + reno).replaceWith(htmls);
			$('#reno' + reno + ' #editmemo').focus();

		} // fn_editReply End

		function fn_updateReply(reno, rewriter) {
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
				type : "POST",
				url : url,
				data : paramData,
				dataType : 'json',
				success : function(result) {
					console.log(result);
					replylist();
				},
				error : function(data) {
					console.log(data);
					Swal.fire({
						icon : 'error',
						title : '댓글이 수정되지 않았습니다.'
					})
				}
			});
		}

		function fn_deleteReply(reno) {
			var url = "${pageContext.request.contextPath}/board/replyDelete";
			var paramData = {
				"reno" : reno
			};

			$.ajax({
				type : "POST",
				url : url,
				data : paramData,
				dataType : 'json',
				success : function(result) {
					console.log(result);
					replylist();
				},
				error : function(data) {
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
			<div class="logo">
				<img src="../resources/logo/logo.png" class="logo-detail"/>
			</div>
				<br>
				<div>
					<button class="detail-list" id="board-list">
					<img src="../resources/logo/list.png" width="20px">
					&nbsp;목록</button>
					<c:if
						test="${user.userid eq 'admin' or user.username eq board.bwriter }">
						<button class="detail-list" id="board-update">
						<img src="../resources/logo/update.png" width="20px">
						&nbsp;수정</button>
						<button class="detail-list" id="board-delete">
						<img src="../resources/logo/delete.png" width="20px">
						&nbsp;삭제</button>
					</c:if>
				</div>
				<div class="box-body">
					<table class="detail-table">
						<tr class="detail-tr">
							<td class="detail-title">제목</td>
							<td colspan="3" class="detail-label">${board.btitle}</td>
						</tr>
						<tr class="detail-tr-center">
							<td class="detail-title">작성자</td>
							<td colspan="3" class="detail-label">${board.bwriter}</td>
						</tr>
						<tr class="detail-tr">
							<td class="detail-title">작성일</td>
							<td class="detail-label">${board.bdate}</td>
							<td class="detail-title">조회수</td>
							<td class="detail-label">${board.breadcnt}</td>
						</tr>
						<tr>
							<td colspan="4" class="detail-main">${board.bcontent}</td>
						</tr>
					</table>
				</div>



				<script>
					$(function() {
						//목록 버튼을 눌렀을 때 처리
						$("#board-list").click(function() {
							location.href = "paginglist";
						});
						//삭제 버튼을 눌렀을 때 처리
						$("#board-delete").click(function() {
							location.href = "delete?bno=" + ${board.bno};
						});
						//수정 버튼을 눌렀을 때 처리
						$("#board-update").click(function() {
							location.href = "update?bno=" + ${board.bno};
						});
					})
				</script>
				<div>
					<div class="box-body">
					<br>
						<table class="reply-input">
							<tr>
								<td>
								<textarea class="form-control" rows="4" name="rememo" id="rememo" placeholder="댓글을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
								<div align="right">
								<button type="button" id="btnReplySave" class="reply-save">
								<img src="../resources/logo/writing.png" width="20px">
								&nbsp;저장</button>
								</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div id="replylist" style="width:100%;"></div>
			</div>
			
			<div class="col-sm-1"></div>
		</div>
	</div>
	<br>
	<%@include file="../include/footer.jsp"%>
</body>
</html>
