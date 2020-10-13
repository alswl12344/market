package kr.co.dong.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class UserServiceImpli implements UserService{

	@Inject
	UserDAO userDAO;
	
	@Override
	public int join(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return userDAO.join(userDTO);
	}

	@Override
	public UserDTO login(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return userDAO.login(userDTO);
	}

	@Override
	public String SearchId(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return userDAO.SearchId(userDTO);
	}

	@Override
	public String SearchPw(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return userDAO.SearchPw(userDTO);
	}

	@Override
	public UserDTO Mypage(String userid) {
		// TODO Auto-generated method stub
		return userDAO.Mypage(userid);
	}

	@Override
	public int UserUpdate(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return userDAO.UserUpdate(userDTO);
	}

}
