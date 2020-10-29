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
	public int CartNumChange() {
		// TODO Auto-generated method stub
		return 0;
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
	
}
