package kr.co.dong.user;

import java.util.List;

import kr.co.dong.Product.PagingPVO;
import kr.co.dong.Product.ProductDTO;

public interface UserDAO {

//	이동	회원가입	user/join	
//	회원가입	user/join
	public int join(UserDTO userDTO);
	
//	회원가입 - 유저아이디 중복 체크
	public int Validation(String userid);
	
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

//	포인트 충전
	public int ChargePoint(UserDTO userDTO);
	
//	포인트 계산
	public int PayPoint(UserDTO userDTO);
	
// 회원 삭제하기
	public int Userdelete(int usercode);

// 회원 관리 등급 변경
	public int UserUpgrade(int usercode);
	
// 회원 이름 검색
	public UserDTO userSearchlist(String username);
	
// 회원 친구 추가하기
	public int insertFriend(FriendDTO fDTO);

// 친구 목록 불러오기
	public List<FriendDTO> flist(String userid);
	
// 회원 목록 총 갯수
	public int countUser();

// 페이징 처리 전체 회원 조회
	public List<UserDTO> userAll(PagingUVO uvo);	
	
// 검색 회원 총 갯수 
	public int countUserSearch(PagingUVO uvo);		
	
// 회원 목록 검색
	public List<UserDTO> usearchlist(PagingUVO uvo) throws Exception;	
}
