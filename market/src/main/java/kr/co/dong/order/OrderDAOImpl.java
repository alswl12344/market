package kr.co.dong.order;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sun.org.apache.xml.internal.utils.NameSpace;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NameSpace = "kr.co.dong.order";

	@Override
	public int OrderConfirm(OrderDTO orderDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NameSpace + ".OrderConfirm",orderDTO);
	}

	@Override
	public List<OrderDTO> OrderList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NameSpace + ".OrderList");
	}

	@Override
	public List<OrderDTO> GetOrderNumber(OrderDTO orderDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NameSpace + ".GetOrderNumber",orderDTO);
	}

	@Override
	public int MoneyCheck(int ordercode) {
		// TODO Auto-generated method stub
		return sqlSession.update(NameSpace + ".MoneyCheck", ordercode);
	}

	@Override
	public List<OrderDTO> OrderListUser(String orderuserid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NameSpace + ".OrderListUser", orderuserid);
	}

	
}
