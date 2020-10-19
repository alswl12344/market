<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>



<body>
<%@include file="./include/header.jsp" %>
 <div>${msg}</div>
 <div class="wrapper">
		<header class="main-header">
			<div class="page-header">
				<h1>상품 목록</h1>
			</div>
		</header>
	</div>
<div class="table-responsive">
  <div style="float:right;">
  	<select id="cntPerPage" name="sel" onchange="selChange()">
  		<option value="5" <c:if test="${paging.cntPerPage == 5 }">selected</c:if>>5줄 보기</option>
  		<option value="10" <c:if test="${paging.cntPerPage == 10 }">selected</c:if>>10줄 보기</option>
  		<option value="15" <c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15줄 보기</option>
  		<option value="20" <c:if test="${paging.cntPerPage == 20 }">selected</c:if>>20줄 보기</option>
  			
  	</select>
  </div>
  
  <table class="table">
   <tr>
  	<td>상품 번호</td>
  	<td>상품명</td>
  	<td>상품 이미지</td>
  	<td>작성일</td>
  	<td>등록기한</td>
  	<td>상품가격</td>
  	<td>상품수량</td>
  	<td>분류코드</td>
  </tr>
<c:forEach var="Product" items="${viewAll}">
 	<tr id="SortResult">
 	<td>${Product.pcode}</td>
 	<td><a href="pdetail?pcode=${Product.pcode}"> ${Product.pname} </a></td>
 	<td>${Product.pimage}</td>
 	<td>${Product.pdate}</td>
 	<td>${Product.plimit}</td>
 	<td>${Product.pprice}</td>
 	<td>${Product.pcount}</td>
 	<td>${Product.ptcode}</td>
 	</tr>
</c:forEach>
<tr>
<td colspan="5" align="center">
<input class="btn btn-success" type="button" value="메인으로" 
id="main" />
<input class="btn btn-primary" type="button" value="상품 등록하기" id="pinsert"/>
<input class="btn btn-danger" type="button" value="삭제 상품 목록보기" id="pdellist"/>
<h6>상품 정렬</h6><button type="button" id="btnClothes" value="0">의류</button>
</td>
</tr>
  </table>
  
  <div>
			<form method ="post" action="${contextPath }/Product/ProductPagingSearch?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}">
				<select name="SearchOption">
					<option value="pname">제목</option>
				</select> <input type="text" name="keyWord" id = "keyWord"/>
<!-- 				<input type="hidden" name="nowPage" value="" /> -->
<%-- 				<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}"/> --%>
				<button type="submit">검색</button>
				</form>
			</div>
		</div>
  
  
  <div style="display: block; text-align: center;">
  	<c:if test="${paging.startPage != 1 }">
  		<a href="${contextPath }/Product/ProductPaging?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"> &lt; </a>
  	</c:if>
  	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
  		<c:choose>
  			<c:when test="${p == paging.nowPage }">
  				<b>&nbsp; ${p } &nbsp;</b>
  			</c:when>
  			<c:when test="${p != paging.nowPage }">
  				<a href="${contextPath }/Product/ProductPaging?nowPage=${p }&cntPerPage=${paging.cntPerPage}">&nbsp; ${p } &nbsp;</a>
  			</c:when>
  		</c:choose>
  	</c:forEach>
  	<c:if test="${paging.endPage != paging.lastPage }">
  		<a href="${contextPath }/Product/ProductPaging?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"> &gt; </a>
  	</c:if>
  </div>
  
  <div id="test">
  
  </div>
</div>


<%@include file="include/footer.jsp" %>
</body>
<script>
	function selChange(){
		var sel = document.getElementById('cntPerPage').value;
		
		location.href="${contextPath }/dong/Product/ProductPaging?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
	//아작스 물품 소트
	$(document).on('click','#btnClothes', function(){
		console.log("1");
		var ptcode =$("#btnClothes").val();
		console.log(ptcode);
		var url = "${pageContext.request.contextPath}/Product/ProductSort";
		var paramData = {
				"ptcode" : ptcode
				
		};		
		//$.ajax({ }); : ajax를 사용하겠다는 시작 & 기본 구조
		// 1. 주소 (url : 호출할 메소드 컨트롤러 주소)
		// 2. 변수 (data : function을 정의할 때 선언한 변수를 사용 여기선 json 타입으로 선언)
		// 3. 데이터타입 (dataType : 'text', 'json', 'xml', 'json' 등의 타입 : {"key", "data"} 
		// 4. 전송방식 (type : GET / POST)
		
		$.ajax({
			
			type : "POST",
			url : url,
			data : paramData,
			dataType: 'json',
			
				success : function(result) { // 사용자가 정하는 임의의 변수
					console.log(result);
					if (result == null) { // result값의 크기를 조건으로 댓글이 있는지 확인  / 리턴된 값이 있다 => 길이가 1보다 크다
					 console.log(result);
					} else {
 						htmls += "<c:forEach var='Product' items='${ProductSort}'>";
						htmls += "<tr id='SortResult'>";
 						htmls += "<td>${Product.pcode}</td>";
 						htmls += "<td><a href='pdetail?pcode=${Product.pcode}'> ${Product.pname} </a></td>";
 						htmls += "<td>${Product.pimage}</td>";
 						htmls += "<td>${Product.pdate}</td>";
						htmls += "<td>${Product.plimit}</td>";
 						htmls += "<td>${Product.pprice}</td>";
 						htmls += "<td>${Product.pcount}</td>";
 						htmls += "<td>${Product.ptcode}hkhkl</td>";
 						htmls += "</tr>";
 						htmls += "</c:forEach>";
					}
					$("#test").html(htmls)
				},
				error : function(data) {
					console.log(data);
			
			
				}
			
		});
		
		
		
	});
	

	$('#main').on('click' , function(){
		location.href="${pageContext.request.contextPath}";
	})
	
	$('#pinsert').on('click', function(){
		location.href="pinsert";
	})
	
	$('#pdellist').on('click', function(){
		location.href="pdellist";
	})
</script>



</html>