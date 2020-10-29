package kr.co.dong.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
@Service
public class CartServiceImpl implements CartService{

	@Inject
	CartDAO cartDAO;
	
	@Override
	public List<CartDTO> CartList(String customerid) {
		// TODO Auto-generated method stub
		return cartDAO.CartList(customerid);
	}
	
	@Override
	public int AddCart(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return cartDAO.AddCart(cartDTO);
	}

	@Override
	public int CartNumChange() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CheckCart(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return cartDAO.CheckCart(cartDTO);
	}

	@Override
	public int BuyCountUpdate(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return cartDAO.BuyCountUpdate(cartDTO);
	}
	


	
}
