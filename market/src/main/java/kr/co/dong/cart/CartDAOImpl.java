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

	private static final String NameSpace = "kr.co.dong.cart";

	@Override
	public List<CartDTO> CartList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NameSpace + ".CartList" );
	}

	@Override
	public int CartNumChange() {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
