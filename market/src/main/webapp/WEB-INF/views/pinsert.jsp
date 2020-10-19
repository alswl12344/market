		<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
		
		<%@include file="include/header.jsp"%>
		<script>
			$(document).ready(function(){
				$("#input_imgs").on("change", handleImgsFilesSelect);
			});
			function handleImgsFilesSelect(e){
				var files = e.tatget.files;
				var filesArr = Array.prototype.slice.call(files);
				
				filesArr.forEach(functuon(f){
					if(!f.type.match("image.*")){
						return;
					}
					
					sel_files.push(f);
					
					var reader = new FileReader();
					reader.onload = function(e) {
						var img_html = "<img sre = \"" + e.target.result + "\" />;
						$(".imgs_wrap").append(img_html);
					}
					reader.readAsDataURL(f);
				});
				
			}
		</script>
		
		<section class="content">
			<div class="box-header">
				<h3 class="box-title">상품 등록하기</h3>
			</div>
		
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>상품명</label> <input type="text"
							name="pname" class="form-control" placeholder="상품명을 입력하세요">
					</div>
					<div class="form-group">
						<label>상품 이미지</label> <input multiple="multiple" type="file" name="pimage" />
					</div>
					<div class="form-group">
						<label>상품설명</label>
						<textarea class="form-control" name="pcontent" rows="3"
							placeholder="내용을 입력하세요"></textarea>
					</div>
		
					<div class="col-sm-4">
						<label>상품 수량</label> <input type="text" name="pcount" class="form-control"></div>
					<div class="col-sm-4">
						<label>상품 가격</label> <input type="text" name="pprice" class="form-control"></div>
					<div class="col-sm-4">
						<label>상품 코드</label> <input type="text" name="ptcode" class="form-control"></div>
					</div>
					
					
				    <input multiple="multiple" type="file" name="file" />
				    <input type="text" name="src" />
				    <input type="submit" value="전송" />

				        
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">작성완료</button>
				</div>
			</form>
			
		</section>
		<%@include file="include/footer.jsp"%>
					
