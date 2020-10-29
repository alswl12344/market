package kr.co.dong.cart;

import java.util.List;


public interface CartDAO {

//		장바구니 리스트 조회	cart/cart
		public List<CartDTO> CartList(String customerid);
	
		// 상품 장바구니 담기
		public int AddCart(CartDTO cartDTO);
		
		// 이미 장바구니에 있는 상품인지 확인
		public int CheckCart(CartDTO cartDTO);
		
		// 장바구니에 있는 상품인 경우 수량 증가
		public int BuyCountUpdate(CartDTO cartDTO);
		
//		장바구니에서 주문 수량 변경	CartNumChange
		public int CartNumChange();
		
//	  	선택 구매	cart/buy
		
		
//		선택 삭제	cart/cdelete

}