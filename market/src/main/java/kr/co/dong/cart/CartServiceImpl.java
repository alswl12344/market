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
	public int CartNumChange(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return cartDAO.CartNumChange(cartDTO);
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

	@Override
	public int DeleteNonUserCart() {
		// TODO Auto-generated method stub
		return cartDAO.DeleteNonUserCart();
		}

	@Override
	public int DeleteCart(int cartcode) {
		// TODO Auto-generated method stub
		return cartDAO.DeleteCart(cartcode);
	}

	@Override
	public CartDTO BuyCart(int cartcode) {
		// TODO Auto-generated method stub
		return cartDAO.BuyCart(cartcode);
	}

	@Override
	public int CartStatusUpdate(int cartcode) {
		// TODO Auto-generated method stub
		return cartDAO.CartStatusUpdate(cartcode);
	}

	@Override
	public int CartClear(String customerid) {
		// TODO Auto-generated method stub
		return cartDAO.CartClear(customerid);
	}

	@Override
	public List<CartDTO> OrderingCart(String customerid) {
		// TODO Auto-generated method stub
		return cartDAO.OrderingCart(customerid);
	}

	@Override
	public int OrderingCartComfirm(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return cartDAO.OrderingCartComfirm(cartDTO);
	}

	@Override
	public List<CartDTO> SelectDeliveryView() {
		// TODO Auto-generated method stub
		return cartDAO.SelectDeliveryView();
	}


	
}
