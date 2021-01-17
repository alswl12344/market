<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	  <!-- 소트 창 div -->
	  
	  <div>
	  	<table style="width:100%; height:50px; border-top: 3px solid #5f4f6e; border-bottom: 2px solid #5f4f6e;">
	  		<tr>
	  			<td style="width:30%;"></td>
	  			<td>
	  				<div align="center">
	  				<button class="sort-button" onclick="location.href='${contextPath }/Product/pCategory?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=1'">의류 </button>
	  				</div>
	  			</td>
	  			<td>
	  				<div align="center">
	  				<button class="sort-button" onclick="location.href='${contextPath }/Product/pCategory?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2'">잡화 </button>
	  				</div>
	  			</td>
	  			<td>
	  				<div align="center">
	  				<button class="sort-button" onclick="location.href='${contextPath }/Product/pCategory?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3'">식품</button>
	  				</div>
	  			</td>
	  			<td style="width:30%;"></td>
	  		</tr>
	  	</table>
	  </div>	
	  <div>
 
	
		<c:set var="code" value="${selptcode}" />
		
		<c:choose>
		
			<c:when test="${code eq '1'}">
		 <button class="detail-list" onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=10'">아우터</button>
		 <button class="detail-list" onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=11'">Top</button>
			</c:when>
			<c:when test="${code eq '2'}">
		 <button class="detail-list" onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=20'">꽃 </button>
		 <button class="detail-list" onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=2&ptcodesub=21'">조명 </button>
			</c:when>
			<c:when test="${code eq '3'}">
		 <button class="detail-list" onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3&ptcodesub=30'">해산물 </button>
		 <button class="detail-list" onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3&ptcodesub=31'">과채류</button>
		 <button class="detail-list" onclick="location.href='${contextPath }/Product/pCategory2?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}&ptcodemain=3&ptcodesub=32'">가공식품 </button>
			</c:when>
			</c:choose>
		</div>