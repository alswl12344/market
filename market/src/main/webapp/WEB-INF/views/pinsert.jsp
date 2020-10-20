
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>

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
	</script>


	<form name="fileForm" 	method="post" enctype="multipart/form-data">
		<label>상품 이미지</label><br>
			<input multiple="multiple" type="file" name="file" onchange="setThumbnail(event);"/> 
			<input type="text" name="src" /> 
	
	<div id="image_container" style="width:100; height:100"></div>
	<hr>
		<div class="box-body">
			<div class="form-group">
				<label>상품명</label> 
				<input type="text" name="pname"	class="form-control" placeholder="상품명을 입력하세요">
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
			<div class="col-sm-4">
				<label>상품 분류 코드</label> <input type="text" name="ptcode" placeholder="0:의류 , 1:기타"
					class="form-control">
			</div>
			<div class="col-sm-4">
				<label>상품 분류 코드</label> <input type="hidden" name="puserid" placeholder="사용자id" value = "${user.userid }"
					class="form-control">
			</div>
		</div>


		<div class="box-footer">
			<button type="submit" class="btn btn-primary">작성완료</button>
		</div>
	</form>

</section>
<%@include file="include/footer.jsp"%>

