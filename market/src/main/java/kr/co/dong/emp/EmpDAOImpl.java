/*
 * Mybatis를 담당 (사용)
 * ----> SqlSession 사용
 * 
 */

package kr.co.dong.emp;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAOImpl implements EmpDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String nameSpace= "empMapper";

	@Override
	public int empCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".cnt");
	}

	@Override
	public List<EmpDTO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
