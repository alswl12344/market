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

import kr.co.dong.ImgDTO;
import kr.co.dong.board.PagingVO;
import kr.co.dong.cart.CartDTO;

public interface ProductDAO {
	
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
	//상품 정렬하기
	public List<ProductDTO> psort(int ptcode);
	//상품명으로 검색하기
	public ProductDTO psearch(String pname);
	//상품 수정하기
	public int pupdate(ProductDTO productDTO);
	//상품 삭제하기
	public int pdelete(int pcode);
	//삭제 목록 확인하기
	public List<ProductDTO> pdellist();	
	// 게시물 총 갯수
	public int countProduct();
	// 페이징 처리 게시글 조회
	public List<ProductDTO> selectProduct(PagingPVO pvo);
	// 상품 장바구니 담기
	public int AddCart(CartDTO cartDTO);
}
