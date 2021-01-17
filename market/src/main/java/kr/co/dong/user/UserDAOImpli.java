package kr.co.dong.user;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.dong.Product.ProductDTO;

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
	public int ChargePoint(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".ChargePoint", userDTO);
	}

	@Override
	public int PayPoint(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".PayPoint", userDTO);
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
	
	
	@Override
	public int Userdelete(int usercode) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".Userdelete", usercode);
	}
	
	@Override
	public int UserUpgrade(int usercode) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".UserUpgrade", usercode);
	}

	@Override
	public UserDTO userSearchlist(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".userSearchlist", username);
	}

	@Override
	public int insertFriend(FriendDTO fDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".insertFriend", fDTO);
	}

	@Override
	public List<FriendDTO> flist(String userid) {
		// TODO Auto-generated method stub

		return sqlSession.selectList(namespace+".flist", userid);
	}
	
	@Override
	public int countUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".countUser");
	}

	
	@Override
	public List<UserDTO> userAll(PagingUVO uvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".userAll", uvo);
	}

	
	@Override
	public int countUserSearch(PagingUVO uvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".countUserSearch", uvo);
	}

	@Override
	public List<UserDTO> usearchlist(PagingUVO uvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".usearchlist", uvo);
	}

	


	



}
