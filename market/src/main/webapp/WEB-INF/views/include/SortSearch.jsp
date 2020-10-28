<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		  <!-- 검색 창 div -->
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
			
	  <hr>
	  <!-- 소트 창 div -->
	  
	  <div>
	  
	  <button onclick="location.href='${contextPath }/Product/pCategory?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=1'">의류 </button>
	  <button onclick="location.href='${contextPath }/Product/pCategory?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2'">기타 </button>
	  <button onclick="location.href='${contextPath }/Product/pCategory?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3'">식품</button>
	  </div>	
	  <div>
 
	
		<c:set var="code" value="${selptcode}" />
		
		<c:choose>
		
			<c:when test="${code eq '1'}">
		 <button onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=10'">의류-아우터</button>
		 <button onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=11'">의류-top</button>
			</c:when>
			<c:when test="${code eq '2'}">
		 <button onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=20'">잡화-꽃 </button>
		 <button onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=21'">잡화-조명 </button>
			</c:when>
			<c:when test="${code eq '3'}">
		 <button onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3&ptcodesub=30'">식품-해산물 </button>
		 <button onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3&ptcodesub=31'">식품-과채류</button>
		 <button onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3&ptcodesub=32'">식품-가공식품 </button>
			</c:when>
			</c:choose>
		</div>