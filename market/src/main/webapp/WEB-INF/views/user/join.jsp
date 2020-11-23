
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="../include/header.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<script>
   $(document).ready(function() {

      var submit_chk = true;
      var pw_chk = $('#userpw').val();
      var name_chk = $('#username').val();
      var birth_chk = $('#birth').val();
      var phone_chk = $('#phone').val();
      var id_chk = true;
      var htmls = "아이디 중복체크를 진행해하여 주십시오";
      
      $("#error_userid").html(htmls)
      $('#id_chk').click(function() {
         var url = "${contextPath}/user/validation";
         var userid = $('#userid').val();
         var paramData = {
            "userid" : userid
         };
         htmls = "";
         
      
         $.ajax({
            type : "POST",
            url : url,
            data : paramData,
            dataType : 'json',
            success : function(result) { // 사용자가 정하는 임의의 변수
               console.log(result);
               if (result == 0) { // result값의 크기를 조건으로 댓글이 있는지 확인  / 리턴된 값이 있다 => 길이가 1보다 크다
            	   Swal.fire({
   					icon : 'success',
   					title : "사용 가능한 아이디입니다."
   					})
                  console.log("=====사용가능 아이디======");
                  id_chk = true;
               } else {
                  Swal.fire({
  					icon : 'error',
  					title : "이미 등록된 아이디 입니다."
  					})
                  id_chk = false;
                  console.log("===== 중복 아이디======");
               }
               if(id_chk == true){
                  $('#valid_check').attr('disabled', false);
               } else {
                  $('#valid_check').attr('disabled', true);
               }
                  
            },
            error : function(msg) {
            	Swal.fire({
  					icon : 'error',
  					title : msg
  					})
            }
         });
      });

   });
</script>

<section class="content">
   <div class="box-header">
   		<br>
      <h3 class="box-title">회원가입</h3>
   </div>
   <hr class="mypage-hr">
   <form:form modelAttribute="userDTO" method="POST"
      action="${contextPath }/user/join">
      <table>
         <div class="box-body">
            <div class="form-group">
            	<table class="join-table">
            		<tr>
            			<td class="join-table-title">아이디</td>
            			<td><form:input type="text" id="userid" name="userid" path="userid"
                  class="form-control" placeholder="아이디를 입력하세요" /></td>
                  		<td style="width:15%;">
                  		<div align="center">
                  		<input type="button" id="id_chk" name="id_chk" value="중복 체크" class="join-check">
                  		<form:errors path="userid" /></div></td>
            		</tr>
            		<tr>
            			<td class="join-table-title">비밀번호</td>
            			<td colspan="2">
            			<form:input type="password" name="userpw" id="userpw" path="userpw"
            			class="form-control" placeholder="비밀번호를 입력하세요" />
               			<form:errors path="userpw" />
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">이름</td>
            			<td colspan="2">
            			<form:input type="text" name="username" path="username"
            			class="form-control" placeholder="이름을 입력하세요" />
               			<form:errors path="username" />
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">생년월일</td>
            			<td colspan="2">
            			<form:input type="text" name="birth" path="birth"
            			class="form-control" placeholder="ex) 200202" />
               			<form:errors path="birth" />
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">이메일</td>
            			<td colspan="2">
            			<form:input type="email" name="email" path="email"
            			class="form-control" placeholder="ex) market@naver.com" />
               			<form:errors path="email" />
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">연락처</td>
            			<td colspan="2">
            			<form:input type="text" name="phone" path="phone"
            			class="form-control" placeholder="ex) 01012345678" />
               			<form:errors path="phone" />
                  		</td>
            		</tr>
            	</table>
            </div>
         </div>

      </table>
      <hr class="mypage-hr">
      <div class="join-footer" align="center">
			<button type="submit" id="valid_check" class="join-button">작성 완료</button>
			<button type="reset" class="join-button-white">작성 취소</button>
		</div>
   </form:form>

</section>


<%@include file="../include/footer.jsp"%>
