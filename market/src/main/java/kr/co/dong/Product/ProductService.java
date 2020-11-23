package kr.co.dong.Product;

import java.util.List;

import kr.co.dong.ImgDTO;



public interface ProductService {
	//상품 전체보기 
	public List<ProductDTO> plist();
	//상품 상세보기
	public ProductDTO pdetail(int pcode);
	//상품 상세보기(이미지)
	public List<ImgDTO> pdetailimg(int imgfromno);
	//상품 등록하기
	public int pinsert(ProductDTO productDTO);
	//상품 이미지 업로드
	public int pimageinsert(ImgDTO imgDTO);
	//상품명으로 검색하기
	public ProductDTO psearch(String pname);
	//상품 수정하기
	public int pupdate(ProductDTO productDTO);
	//상품 삭제하기
	public int pdelete(int pcode);
	//상품 삭제복구하기
	public int pdeldelete(int pcode);
	//삭제 목록 확인하기
	public List<ProductDTO> pdellist();	
	// 게시물 총 갯수
	public int countProduct();
	// 게시물 최종 번호 확인
	public int MaxProduct();
	// 게시물 선택 갯수
	public int countProduct2(PagingPVO pvo);
	// 페이징 처리 게시글 조회
	public List<ProductDTO> selectProduct(PagingPVO pvo);
	//게시글 전체 목록 ==> 검색 옵션, 키워드 매개 변수
	public List<ProductDTO> psearchlist(PagingPVO pvo) throws Exception;
	//상품 정렬 개수 쿼리(대분류)
			public int productSort(int ptcodemain);
			//소트 정렬 목록(대분류)
			public List<ProductDTO> productSortList(PagingSortPVO spvo) throws Exception;
			//상품 정렬 개수 쿼리 (중분류)
			public int productSort2(int ptcodesub);
			//소트 정렬 목록 (중분류)
			public List<ProductDTO> productSortList2(PagingSortPVO2 spvo) throws Exception;
	
	// 게시물 번호에 해당하는 댓글 번호를 가져오는 메소드
		public List<ProductReply> pGetDetail(int pcode);
		
		// 댓글 보기
		public ProductReply pReplyDetail(int preno);
		
		// 댓글 작성
		public int pReply(ProductReply productReply);

		// 댓글 수정
		public int pReplyUpdate(ProductReply productReply);
		
		// 댓글 삭제
		public int pReplyDelete(int preno);
		// 상품 구매 수량 증가
		public int BuycountUpdate(ProductDTO productDTO);
}
