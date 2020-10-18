/*
 * 
 * 상품 전체 목록보기
 * 상품 등록하기
 * 상품 정렬하기
 * 상품 검색하기
 * 상품 수정하기
 * 상품 삭제하기
 * */

package kr.co.dong.Product;

import java.util.List;
import java.util.Map;

import kr.co.dong.board.PagingVO;

public interface ProductDAO {
	
	//상품 전체보기 
	public List<ProductDTO> plist();
	//상품 정렬하기 
		public List<ProductDTO> ProductSort(int ptcode);
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
	//상품 삭제복구하기
	public int pdeldelete(int pcode);
	
	//삭제 목록 확인하기
	public List<ProductDTO> pdellist();
	
	// 게시물 총 갯수
	public int countProduct();

	// 게시물 선택 갯수
	public int countProduct2(PagingPVO pvo);
	
	// 페이징 처리 게시글 조회
	public List<ProductDTO> selectProduct(PagingPVO pvo);
	
	//게시글 전체 목록 ==> 검색 옵션, 키워드 매개 변수
	public List<ProductDTO> psearchlist(PagingPVO pvo) throws Exception;
//	
//	// 게시글 레코드 갯수 메서드 증가
//	public int countArticle(String SearchOption, String KeyWord) throws Exception;
}
