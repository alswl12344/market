<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<body>
	<div class="container">
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-10">
	<div class="box-header">
		<h3 class="box-title">상품 등록</h3>
	</div>

	<script> 
	// 이미지 미리보기 메서드
	function setThumbnail(event) { 
		for (var image of event.target.files) { 
			var reader = new FileReader(); 
			reader.onload = function(event) { 
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result);
				img.setAttribute('width', 200);
				img.setAttribute('height', 200);
				document.querySelector("div#image_container").appendChild(img); 
				}; 
				console.log(image); reader.readAsDataURL(image); } 
		} 
	
	function setThumbnail2(event) { 
		for (var image of event.target.files) { 
			var reader = new FileReader(); 
			reader.onload = function(event) { 
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result);
				img.setAttribute('width', 200);
				img.setAttribute('height', 200);
				document.querySelector("div#image_container2").appendChild(img); 
				}; 
				console.log(image); reader.readAsDataURL(image); } 
		} 
	
	
	
	$(function(){
	    
	    // 질문유형을 선택한다.
	    codeType('1' , '10');
	});

	function codeType(type , select) {
	    
	    $('#selCodeType').empty();
	    
	    if(type == '1') { // 의류
	        $('#selCodeType').append("<option value='10' >아우터</option>'");
	        $('#selCodeType').append("<option value='11' name='ptcodesub' >top</option>'");
	    } else if (type == '2') {  // 일반관련
	        $('#selCodeType').append("<option value='20' >꽃</option>'");
	        $('#selCodeType').append("<option value='21' >조명</option>'");
	    } else if ( type == '3') {  // 주문관련
	        $('#selCodeType').append("<option value='30' >해산물</option>'");
	        $('#selCodeType').append("<option value='31' >과채류</option>'");
	        $('#selCodeType').append("<option value='32' >가공식품</option>'");
	  
	    }
	    document.getElementById("selCodeType").style.display = "";
	    
	    if ($.trim(select) != "") {
	        $('#select1').val(type);
	        $('#selCodeType').val(select);
	    }
	}
	

	</script>

	<hr class="mypage-hr">
	<form name="fileForm" method="post" enctype="multipart/form-data">
		<table class="product-table">
		<tr class="product-tr">
            <td class="product-table-title">썸네일</td>
            <td><input multiple="multiple" type="file" name="Thumbnail" onchange="setThumbnail(event);" /></td>
        </tr>
        <tr>
        	<td class="product-table-title" style="height: 220px;">썸네일 미리보기</td>
        	<td><div id="image_container" style="width: 200px; height: 200px; display:inline;">
			</div></td>
		</tr>
        <tr class="product-tr">
        	<td class="product-table-title">상품 이미지</td>
        	<td><input multiple="multiple"
			type="file" name="file" onchange="setThumbnail2(event);" /></td>
		</tr>
        <tr>
        	<td class="product-table-title" style="height: 220px;">이미지 미리보기</td>
        	<td><div id="image_container2" style="width: 200px; height: 200px; display:inline;">
			</div></td>
		</tr>
        <tr class="product-tr">
        	<td class="product-table-title">상품명</td>
        	<td><input type="text" name="pname" class="form-control" placeholder="상품명을 입력해주세요."></td>
		</tr>
		<tr class="product-tr">
			<td class="product-table-title">상품 설명</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" style="height:330px; padding:10px;">
				<textarea name="pcontent"></textarea>
				<script>CKEDITOR.replace('pcontent');</script>
			</td>
		</tr>
		<tr class="product-tr">
			<td class="product-table-title">상품 수량</td>
        	<td><input type="text" name="pcount" class="form-control" placeholder="상품 수량을 입력해주세요."></td>
		</tr>
		<tr class="product-tr">
			<td class="product-table-title">상품 가격</td>
        	<td><input type="text" name="pprice" class="form-control" placeholder="상품 가격을 입력해주세요."></td>
		</tr>
		<tr class="product-tr">
			<td class="product-table-title">상품 코드 입력</td>
        	<td>
	        	<select name="ptcodemain" id="select1" onChange="codeType(this.value)" >
					<option value="1">의류</option>
					<option value="2">잡화</option>
					<option value="3">식품</option>
				</select>    
				<select id="selCodeType" name="ptcodesub" style="width:120px; display:none;" >
				</select>
			</td>
		</tr>
		</table>
		<input type="hidden" name="puserid"	placeholder="사용자id" value="${user.userid }" class="form-control">
		<hr class="mypage-hr">
		<div class="box-footer" align="center">
			<button type="submit" class="join-button">작성 완료</button>
		</div>
	</form>

</div>
<div class="col-sm-1"></div>
</div>
</div>
<%@include file="../include/footer.jsp"%>
</body>


