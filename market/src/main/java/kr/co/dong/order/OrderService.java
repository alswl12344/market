package kr.co.dong.order;

import java.util.List;

public interface OrderService {
	 
//	전체 결제내역 조회 관리자용 (오더 테이블 데이터 조회)
	public List<OrderDTO> OrderList();
	
//	결제내역 조회 일반 사용자용
	public List<OrderDTO> OrderListUser(String orderuserid);
	
//	결제버튼 클릭 (주문완료 테이블에 데이터 인서트)
	public int OrderConfirm(OrderDTO orderDTO);
	
//	결제 테이블에서 상품의 ordernumber 가져오기 
	public List<OrderDTO> GetOrderNumber(OrderDTO orderDTO);
	
//	입금대기중인 결제 건에 대해서 입금 확인처리
	public int MoneyCheck(int ordercode);
}
