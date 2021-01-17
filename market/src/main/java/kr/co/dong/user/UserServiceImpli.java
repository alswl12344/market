package kr.co.dong.user;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dong.Product.ProductDTO;

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

	@Override
	public int Validation(String userid) {
		// TODO Auto-generated method stub
		return userDAO.Validation(userid);
	}

	@Override
	public int ChargePoint(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return userDAO.ChargePoint(userDTO);
	}

	@Override
	public int PayPoint(UserDTO userDTO) {
		// TODO Auto-generated method stub
		return userDAO.PayPoint(userDTO);
	}

	@Override
	public int Userdelete(int usercode) {
		// TODO Auto-generated method stub
		return userDAO.Userdelete(usercode);
	}

	@Override
	public int UserUpgrade(int usercode) {
		// TODO Auto-generated method stub
		return userDAO.UserUpgrade(usercode);
	}

	
	
	@Override
	public UserDTO userSearchlist(String username) {
		// TODO Auto-generated method stub
		return userDAO.userSearchlist(username);
	}

	@Override
	public int insertFriend(FriendDTO fDTO) {
		// TODO Auto-generated method stub
		return userDAO.insertFriend(fDTO);
	}

	@Override
	public List<FriendDTO> flist(String userid) {
		// TODO Auto-generated method stub
		return userDAO.flist(userid);
	}


	@Override
	public int countUser() {
		// TODO Auto-generated method stub
		return userDAO.countUser();
	}
	
	@Override
	public List<UserDTO> userAll(PagingUVO uvo) {
		// TODO Auto-generated method stub
		return userDAO.userAll(uvo);
	}
	
	@Override
	public int countUserSearch(PagingUVO uvo) {
		// TODO Auto-generated method stub
		return userDAO.countUserSearch(uvo);
	}

	@Override
	public List<UserDTO> usearchlist(PagingUVO uvo) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.usearchlist(uvo);
	}




}
