package kr.co.dong.cart;

import java.util.List;


public interface CartDAO {

//		장바구니	cart/cart
		public List<CartDTO> CartList();
	
//		수량 변경	CartNumChange
		public int CartNumChange();
		
//	  	선택 구매	cart/buy
		
		
//		선택 삭제	cart/cdelete

}