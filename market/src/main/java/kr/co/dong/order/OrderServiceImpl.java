package kr.co.dong.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
@Service
public class OrderServiceImpl implements OrderService{
	@Inject
	private OrderDAO orderDAO;

	@Override
	public int OrderConfirm(OrderDTO orderDTO) {
		// TODO Auto-generated method stub
		return orderDAO.OrderConfirm(orderDTO);
	}

	@Override
	public List<OrderDTO> OrderList() {
		// TODO Auto-generated method stub
		return orderDAO.OrderList();
	}

	@Override
	public List<OrderDTO> GetOrderNumber(OrderDTO orderDTO) {
		// TODO Auto-generated method stub
		return orderDAO.GetOrderNumber(orderDTO);
	}

	@Override
	public int MoneyCheck(int ordercode) {
		// TODO Auto-generated method stub
		return orderDAO.MoneyCheck(ordercode);
	}

	@Override
	public List<OrderDTO> OrderListUser(String orderuserid) {
		// TODO Auto-generated method stub
		return orderDAO.OrderListUser(orderuserid);
	}



	
}
