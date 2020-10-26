
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="include/header.jsp"%>
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
                  htmls = htmls + ("사용가능한 아이디 입니다.");
                  console.log("=====사용가능 아이디======");
                  id_chk = true;
               } else {
                  htmls = htmls + ("이미 등록된 아이디 입니다.");
                  id_chk = false;
                  console.log("===== 중복 아이디======");
               }
               if(id_chk == true){
                  $('#valid_check').attr('disabled', false);
               } else {
                  $('#valid_check').attr('disabled', true);
               }
                  
               $("#error_userid").html(htmls)
            },
            error : function(msg) {
               console.log(msg);
               htmls = htmls + ("<h3>오류발생.</h3>" + msg);
               $("#error_userid").html(htmls)
            }
         });
      });

   });
</script>

<section class="content">
   <div class="box-header">
      <h3 class="box-title">회원가입</h3>
   </div>
   <form:form modelAttribute="userDTO" method="POST"
      action="${contextPath }/user/join">
      <table>
         <div class="box-body">
            <div class="form-group">
               <label>ID : </label> <input type="button" id="id_chk" name="id_chk"
                  value="중복체크">

               <form:input type="text" id="userid" name="userid" path="userid"
                  class="form-control" placeholder="ID를 입력하세요" />
               <form:errors path="userid" />
               <div id="error_userid"></div>
            </div>

            <div class="form-group">
               <label>Password : </label>
               <form:input type="password" name="userpw" id="userpw" path="userpw"
                  class="form-control" placeholder="비밀번호를 입력하세요" />
               <form:errors path="userpw" />

            </div>

            <div class="form-group">
               <label>이름</label>
               <form:input type="text" name="username" path="username"
                  class="form-control" placeholder="이름을 입력하세요" />
               <form:errors path="username" />
            </div>

            <div class="form-group">
               <label>생년월일</label>
               <form:input type="text" name="birth" path="birth"
                  class="form-control" placeholder="예)200101" />
               <form:errors path="birth" />
            </div>

            <div class="form-group">
               <label>E-mail</label>
               <form:input type="email" name="email" path="email"
                  class="form-control" placeholder="예)market@naver.com" />
               <form:errors path="email" />
            </div>

            <div class="form-group">
               <label>연락처</label>
               <form:input type="text" name="phone" path="phone"
                  class="form-control" placeholder="예)01012345678" />
               <form:errors path="phone" />
            </div>

         </div>
         <div class="box-footer">
            <button type="submit" id="valid_check" disabled=""
               class="btn btn-primary">작성완료</button>
            <button type="reset" class="btn btn-primary">작성취소</button>
         </div>
      </table>
   </form:form>



</section>



<%@include file="include/footer.jsp"%>
