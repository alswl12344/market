package kr.co.dong.user;

public interface UserDAO {

//	이동	회원가입	user/join	
//	회원가입	user/join
	public int join(UserDTO userDTO);
	
//	이동	로그인	user/login
//	로그인	user/login
	public UserDTO login(UserDTO userDTO);
	
//	이동	아이디 찾기	user/SearchId
//	아이디 찾기	user/SearchId
	public String SearchId(UserDTO userDTO);
	
//	이동	비밀번호 찾기	user/SerachPw
//	비밀번호 찾기	user/SerachPw
	public String SearchPw(UserDTO userDTO);
	
//	마이페이지	user/Mypage
	public UserDTO Mypage(String userid);
	
//	이동	회원 정보 수정	user/UserUpdate
//	회원 정보 수정	user/UserUpdate
	public int UserUpdate(UserDTO userDTO);
	
}
