package kr.co.dong.cart;

import java.util.List;

public interface CartService {
	 
//	장바구니 리스트 조회	cart/cart
	public List<CartDTO> CartList(String customerid);

	// 상품 장바구니 담기
	public int AddCart(CartDTO cartDTO);
	
	// 이미 장바구니에 있는 상품인지 확인
	public int CheckCart(CartDTO cartDTO);
	
	// 장바구니에 있는 상품인 경우 수량 증가
	public int BuyCountUpdate(CartDTO cartDTO);
	
//	장바구니에서 주문 수량 변경	CartNumChange
	public int CartNumChange(CartDTO cartDTO);
	
//	비회원 장바구니 자동 삭제 (로그아웃 시)
	public int DeleteNonUserCart();
	
//  장바구니 상품 선택 구매	cart/buycart
	public CartDTO BuyCart(int cartcode);	
	
//	선택 삭제	cart/DeleteCart
	public int DeleteCart(int cartcode);
	
//	결제 진행중인 상품 표시 CartStatusUpdate
	public int CartStatusUpdate(int cartcode);
	
//	장바구니 결제 진행중인 상품 초기화 CartClear
	public int CartClear(String customerid);
	
//	장바구니 결제 진행중인 상품 검색 OrderingCart
	public List<CartDTO> OrderingCart(String customerid);
	
//	장바구니 상품을 결제 시 결제 완료 처리(카트상품의 상태값을 2로 변경 및 오더코드 입력)OrderingCartComfirm
	public int OrderingCartComfirm(CartDTO cartDTO);
	
//	주문목록 테이블 조회 SelectDeliveryView
	public List<CartDTO> SelectDeliveryView();
}
