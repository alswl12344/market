<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<html>
<head>
<title>아이디 찾기</title>
</head>
<body>
	<%@include file="include/header.jsp"%>

	<section class="content">

		<Form method="post">
			아이디 : <input type="text" name="userid" id="userid" /><br> 생년월일
			: <input type="text" name="birth" id="birth" /><br> 연락처 : <input
				type="text" name="phone" id="phone" /><br> <input type="button"
				value="비밀번호찾기" id="btnSearchPw" />
		</Form>

	</section>

	<div id="answer"></div>

	<script>
		//ajax를 통한 아이디 찾기 결과 리턴 
		$(document).ready(function() {
			console.log("아이디 찾기 결과 리턴페이지");

			// 비밀번호찾기 함수 정의
			$('#btnSearchPw').click(function() {
				var userid = $("#userid").val(); // function이 실행될 때 useride값을 입력 받음
				var birth = $("#birth").val();
				var phone = $("#phone").val();
				var url = "${pageContext.request.contextPath}/user/SearchPw";
				var paramData = {
					"userid" : userid,
					"birth" : birth,
					"phone" : phone
				};
				var htmls = "";
				//$.ajax({ }); : ajax를 사용하겠다는 시작 & 기본 구조
				// 1. 주소 (url : 호출할 메소드 컨트롤러 주소)
				// 2. 변수 (data : function을 정의할 때 선언한 변수를 사용 여기선 json 타입으로 선언)
				// 3. 데이터타입 (dataType : 'text', 'json', 'xml', 'json' 등의 타입 : {"key", "data"} 
				// 4. 전송방식 (type : GET / POST)
				$.ajax({
					type : "POST",
					url : url,
					data : paramData,
					dataType : 'json',
					success : function(result) { // 사용자가 정하는 임의의 변수
						console.log(result);
						alert("비밀번호 찾기 성공");
						if (result == null) { // result값의 크기를 조건으로 댓글이 있는지 확인  / 리턴된 값이 있다 => 길이가 1보다 크다
							htmls = htmls + ("<h3>입력한 정보를 확인해주세요.</h3>");
						} else {
							htmls = htmls + "<div>" + result + "</div>";
						}
						$("#answer").html(htmls)
					},
					error : function(msg) {
						console.log(msg);
						alert("비밀번호 찾기 실패");
						htmls = htmls + ("<h3>입력한 정보를 확인해주세요.</h3>");
						$("#answer").html(htmls)
					}
				});

			});
		});
	</script>
	<%@include file="include/footer.jsp"%>

</body>
</html>
