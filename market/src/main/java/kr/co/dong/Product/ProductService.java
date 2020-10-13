package kr.co.dong.Product;

import java.util.List;



public interface ProductService {
	//상품 전체보기 
	public List<ProductDTO> plist();
	//상품 상세보기
	public ProductDTO pdetail(int pcode);
	//상품 등록하기
	public int pinsert(ProductDTO productDTO);
	//상품 정렬하기
	public List<ProductDTO> psort(int ptcode);
	//상품명으로 검색하기
	public ProductDTO psearch(String pname);
	//상품 수정하기
	public int pupdate(ProductDTO productDTO);
	//상품 삭제하기
	public int pdelete(int pcode);
	//상품 삭제 목록
	public List<ProductDTO> pdellist();
	// 게시물 총 갯수
	public int countProduct();

	// 페이징 처리 게시글 조회
	public List<ProductDTO> selectProduct(PagingPVO pvo);
}
