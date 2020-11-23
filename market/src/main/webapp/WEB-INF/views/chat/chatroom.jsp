<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<%@include file="../include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<section class="content">
	<div align="center">
	<div style="padding:30px;">
<h3 class="box-title"> ${user.userid }님의 친구 </h3>
문의는 친구 검색 이름에 관리자를 입력해주세요.
<hr class="mypage-hr">
<table style="width:80%; text-align: center; margin-top:20px; margin-bottom:30px;">
   <tr> 
   <td class="mypage-td">이름</td>
   <td class="mypage-td">아이디</td>
   
  </tr>


<c:forEach var="Friend" items="${flist}">
 	<tr class="list-tr">
	<!-- 링크 클릭시 아래에 채팅창 띄움 -->	

 	<td> ${Friend.friendname}</td>
 	<td>${Friend.friendid}&nbsp;&nbsp;
 	<!-- 입력할 값 쥐고 가져가기 -->
 	<form action="getchatroom" method="post">
 	<input type="hidden" id="roomcode" name = "roomcode" value="${user.userid}+${Friend.friendid}" />
 	<input type="hidden" id="userid" name = "userid" value="${user.userid}" />
 	<input type="hidden" id="friendid" name= "friendid" value="${Friend.friendid}" />
 	<input type="hidden" id="chatdate" name= "chatdate" value="<%= nowTime %>" />
 	<button onclick="window.open('openchatroom')" id ="chatStart" type="submit">채팅하기</button>	</form></td> 

 
 	</tr>
 	
</c:forEach>
	
</table>	
	<div>
	<table style="width:80%;">
		<tr>
			<td style="padding: 15px;">
				<div class="chat-friend">친구 찾기</div>
			</td>
			<td>	
	  			<div>
					<input type="text" name="keyWord" id = "keyWord" placeholder="이름을 입력하세요." class="search-field"/>
					<button type="submit" id="btnUserSearch" class="search-icon">
						<img src="../resources/logo/search.png" width="20px">
					</button>
					<div id="resultMsg"></div>
					
				</div>
			</td>
		</tr>
	</table>
  <!-- 회원 아이디 검색 창 div -->

</div>
<div id="userList">

</div>
	</div>
	</div>
<p></p><p></p>
</section>
</div>
</div>
</div>
</body>
<script type="text/javascript">




$(document).ready(function(){
	$('#btnUserSearch').click(function(){
		$.ajax({
			type: "POST",
			url: "${contextPath}/chat/friend",
			data: {
				"username" : $('#keyWord').val()
			},
			dataType: 'json',
			success:  function(ulist){ // result<=>data<=>log
				var htmls = "";
				if(ulist[0] == null){ //array list로 넣은 값 불러오기 
					console.log(ulist[0]);
					htmls = htmls + "<br><h6>검색한 회원이 없습니다.</h6>";
				}
				else {
					console.log(ulist[0]);
				var friendcode = parseInt(ulist[0].usercode);
				var friendname = ulist[0].username;
				var friendid = ulist[0].userid;
				
				htmls = htmls + ulist[0].username;
				

				htmls = htmls + "<br>";
				htmls = htmls + '<form name="insertfriend" method="post" action="insertfriend">'
				htmls = htmls + '<input type="hidden" id="usercode" name = "usercode" value="${user.usercode}" />';
				htmls = htmls + '<input type="hidden" id="userid" name = "userid" value="${user.userid}" />';
				htmls = htmls + '\n'+ '<input type="hidden" id="friendcode" name= "friendcode" value="'+friendcode+'" />';
				htmls = htmls + '\n'+ '<input type="hidden" id="friendname" name= "friendname" value="'+friendname+'" />';
				htmls = htmls + '\n'+ '<input type="hidden" id="friendid" name= "friendid" value="'+friendid+'" />'; //friend 테이블에 넣을 값
				htmls = htmls + '<button type="submit" class="list-insert">친구 등록</button>';
				
	
			}
				
				$("#userList").html(htmls);
				
			}, error: function(data){
				console.log(data);
				alert("에러"+ data);
			}
		});
	});
	
	
	
// 	$(document).ready(function(){
// 		$('#chatStart').click(function(){
// 			var userid  = $('#userid').val();
// 			var	friendid = $('#friendid').val();
			
// 			$.ajax({
// 				type: "POST",
// 				url: "${contextPath}/chat/getchatroom",
// 				data: {
// 					"userid" : userid,
// 					"friendid" : friendid
// 				},
// 				dataType: 'json',
// 				success:  function(ulist){ // result<=>data<=>log
// 					var htmls = "";
// 					if(ulist[0] == null){ //array list로 넣은 값 불러오기 
// 						console.log(ulist[0]);
// 						htmls = htmls + "<h6>검색한 회원이 없습니다.</h6>";
// 					}
// 					else {
// 						console.log(ulist[0]);
// 					var friendcode = parseInt(ulist[0].usercode);
		
// 				}
					
// 					$("#userList").html(htmls);
					
// 				}, error: function(data){
// 					console.log(data);
// 					alert("에러"+ data);
// 				}
// 			});
// 		});
// 	});

	
	
});



 


</script>


<script>

	</script>

</html>

