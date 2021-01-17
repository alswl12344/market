package kr.co.dong.cart;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sun.org.apache.xml.internal.utils.NameSpace;

@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String nameSpace = "kr.co.dong.cart";

	@Override
	public List<CartDTO> CartList(String customerid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".CartList", customerid );
	}

	@Override
	public int CartNumChange(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".CartNumChange", cartDTO);
	}
	
	@Override
	public int AddCart(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".AddCart", cartDTO);
	}

	@Override
	public int CheckCart(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".CheckCart", cartDTO);
	}

	@Override
	public int BuyCountUpdate(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".BuyCountUpdate", cartDTO);
	}	

	@Override
	public int DeleteNonUserCart() {
		// TODO Auto-generated method stub
		return sqlSession.delete(nameSpace+".DeleteNonUserCart");
	}


	@Override
	public int DeleteCart(int cartcode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(nameSpace+".DeleteCart", cartcode);
	}

	@Override
	public CartDTO BuyCart(int cartcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".BuyCart", cartcode);
	}

	@Override
	public int CartStatusUpdate(int cartcode) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".CartStatusUpdate", cartcode);
	}

	@Override
	public int CartClear(String customerid) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".CartClear", customerid);
	}

	@Override
	public List<CartDTO> OrderingCart(String customerid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".OrderingCart", customerid);
	}

	@Override
	public int OrderingCartComfirm(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".OrderingCartComfirm", cartDTO);
	}

	@Override
	public List<CartDTO> SelectDeliveryView() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".SelectDeliveryView");
	}
	
}
