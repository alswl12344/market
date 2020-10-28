
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<section class="content">
	<div class="box-header">
		<h3 class="box-title">상품 등록하기</h3>
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


	<form name="fileForm" method="post" enctype="multipart/form-data">
	
		<label>상품 썸네일</label><br> <input multiple="multiple" type="file"
			name="Thumbnail" onchange="setThumbnail(event);" /> <br> <br>
		<div id="image_container" style="width: 100; height: 100">
		</div>
		<br>

		<label>상품 소개 이미지</label><br> <input multiple="multiple"
			type="file" name="file" onchange="setThumbnail2(event);" />
		<div id="image_container2" style="width: 100; height: 100">
			<br>
		</div>
		<hr>
		<div class="box-body">
			<div class="form-group">
				<label>상품명</label> <input type="text" name="pname"
					class="form-control" placeholder="상품명을 입력하세요">
			</div>

			<div class="form-group">
				<label>상품설명</label>
				<textarea class="form-control" name="pcontent" rows="3"
					placeholder="내용을 입력하세요"></textarea>
			</div>

			<div class="col-sm-4">
				<label>상품 수량</label> <input type="text" name="pcount"
					class="form-control">
			</div>
			<div class="col-sm-4">
				<label>상품 가격</label> <input type="text" name="pprice"
					class="form-control">
			</div>
				<input type="hidden" name="puserid"	placeholder="사용자id" value="${user.userid }" class="form-control">
			</div>
			<div>
			    <label>상품 코드 입력</label>
				
				    <select name="ptcodemain" id="select1" onChange="codeType(this.value)" >
					    <option value="1">의류</option>
					    <option value="2">잡화</option>
					    <option value="3">식품</option>
					</select>    
					<select id="selCodeType" name="ptcodesub" style="width:120px; display:none;" >
					</select>
			
			</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">작성완료</button>
		</div>
	</form>

</section>
<%@include file="../include/footer.jsp"%>

