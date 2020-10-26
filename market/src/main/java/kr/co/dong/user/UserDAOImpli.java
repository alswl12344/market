package kr.co.dong.user;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpli implements UserDAO {

	@Inject
	SqlSession sqlSession;
	static final String namespace = "kr.co.dong.user";
	
	@Override
	public int join(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".join", userDTO);
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".login", userDTO);
	}

	@Override
	public String SearchId(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".SearchId", userDTO);
	}

	@Override
	public String SearchPw(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".SearchPw", userDTO);
	}

	@Override
	public UserDTO Mypage(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".Mypage", userid);
	}

	@Override
	public int UserUpdate(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".UserUpdate", userDTO);
	}

	@Override
	public int Validation(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".Validation", userid);
	}

}
