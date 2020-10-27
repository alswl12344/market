package kr.co.dong.cart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
@Service
public class CartServiceImpl implements CartService{

	@Inject
	CartDAO cartDAO;
	
	@Override
	public List<CartDTO> CartList() {
		// TODO Auto-generated method stub
		return cartDAO.CartList();
	}

	@Override
	public int CartNumChange() {
		// TODO Auto-generated method stub
		return 0;
	}
	


	
}
