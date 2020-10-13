package kr.co.dong.delivery;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sun.org.apache.xml.internal.utils.NameSpace;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NameSpace = "kr.co.dong.delivery";

	@Override
	public List<DeliveryDTO> dview() {
		// 배송 목록
		return sqlSession.selectList(NameSpace + ".dview");
	}

	@Override
	public List<ManagementDTO> management() {
		// 주소록 관리 목록
		return sqlSession.selectList(NameSpace + ".management");
	}

	@Override
	public int insert(ManagementDTO managementDTO) {
		// 주소록 추가
		return sqlSession.insert(NameSpace + ".insert", managementDTO);
	}

	@Override
	public int delete(int mcode) {
		// 주소 삭제
		return sqlSession.delete(NameSpace + ".delete", mcode);
	}

	@Override
	public int update(ManagementDTO managementDTO) {
		// 주소 수정
		return sqlSession.update(NameSpace + ".update", managementDTO);
	}

	@Override
	public ManagementDTO managementdetail(int mcode) {
		// 주소 조회
		return sqlSession.selectOne(NameSpace + ".managementdetail", mcode);
	}

}
