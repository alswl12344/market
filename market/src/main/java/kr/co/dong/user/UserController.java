package kr.co.dong.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hamcrest.core.IsNull;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonValue;
import com.mysql.cj.Session;

import kr.co.dong.Product.PagingPVO;


@Controller
public class UserController {

	// Service의 메소드 사용
	@Inject
	UserService userService;
	UserDTO userDTO;	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	

	
//	이동	회원가입	user/join
	@RequestMapping(value = "user/join", method = RequestMethod.GET)
	public String MoveJoin(@ModelAttribute UserDTO userDTO) throws Exception {
		return "user/join";
	}
	
//	회원가입 - 아이디 중복 검사
	@ResponseBody 
	@RequestMapping(value = "user/validation", method = RequestMethod.POST)
	public int Validation(@RequestParam("userid") String userid) throws Exception {
		System.out.println("입력받은 userid 는 " + userid);
		int usercount = userService.Validation(userid);
		System.out.println("중복 검사 결과 usercount는  " + usercount);

		return usercount;
	}	
	
//	회원가입	user/join
	@RequestMapping(value = "user/join", method = RequestMethod.POST)
	// binding한 결과가 result에 담긴다.
	public String join(@ModelAttribute @Valid UserDTO userDTO, BindingResult result) {
		
		System.out.println("입력받은 "+ userDTO.getUserid());
		System.out.println("입력받은 "+userDTO.getUserpw());
		System.out.println("입력받은 "+userDTO.getUsername());
		System.out.println("입력받은 "+userDTO.getBirth());
		System.out.println("입력받은 "+userDTO.getEmail());
		System.out.println("입력받은 "+userDTO.getPhone());
		// 에러가 있는지 검사
		if( result.hasErrors() ) {

			// 에러를 List로 저장
			List<ObjectError> list = result.getAllErrors();
			for( ObjectError error : list ) {
//				System.out.println(error);
			}
			System.out.println("========= 입력한 정보에 문제가 있음 ============");
			return "user/join";
		}
		
		userService.join(userDTO);
		return "redirect:/";
	}


	
//	이동	로그인	user/login
	@RequestMapping(value = "user/login", method = RequestMethod.GET)
	public String MoveLogin() throws Exception {
		return "user/login";
	}
	
//	로그인	user/login
	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	public String Login(UserDTO userDTO, HttpSession session, HttpServletRequest request)	throws Exception {
		
		UserDTO UD = userService.login(userDTO);
//		System.out.println(UD + "로그인");
		if (UD != null) {
			logger.info("로그인 성공");
			session.setAttribute("user", UD);
			return "redirect:/";
		} else {
			logger.info("로그인 실패");
			return "redirect:login";
		}
	}
	
//	로그아웃	user/logout
	@RequestMapping(value = "user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
//	이동	아이디 찾기	user/SearchId 이름, 생년월일 , 연락처로 찾기
	@RequestMapping(value = "user/SearchId", method = RequestMethod.GET)
	public String MoveSearchId() throws Exception {
		return "user/SearchId";
	}
	
	
//	Ajax 아이디 찾기	user/SearchId
	@ResponseBody 
	@RequestMapping(value = "user/SearchId", method = RequestMethod.POST)
	public String SearchId(UserDTO userDTO) throws Exception {

		String user = userService.SearchId(userDTO);
		logger.info("logger값은 "+ user);
		if(user.trim().length() < 0) {
			return JSONValue.toJSONString(user);
		}
		return JSONValue.toJSONString(user);
	}
	
//	이동	비밀번호 찾기	user/SerachPw 아이디, 생년월일 , 연락처로 찾기
	@RequestMapping(value = "user/SearchPw", method = RequestMethod.GET) 
	public String MoveSerachPw() throws Exception {
		return "user/SearchPw";
	}
	
//	Ajax 비밀번호 찾기	user/SerachPw
	@ResponseBody 
	@RequestMapping(value = "user/SearchPw", method = RequestMethod.POST)
	public String SearchPw(UserDTO userDTO) throws Exception {
		String user = userService.SearchPw(userDTO);
		logger.info("logger값은 "+ user);
		if(user.trim().length() < 0) {
			return JSONValue.toJSONString(user);
		}
		return JSONValue.toJSONString(user);
	}
	
	
//	이동 + 마이페이지 	user/Mypage
	@RequestMapping(value = "user/Mypage", method = RequestMethod.GET) 
	public ModelAndView Mypage(@RequestParam("userid")String userid, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();		
		UserDTO mypage = userService.Mypage(userid);
		mav.addObject("mypage", mypage);
		mav.setViewName("user/Mypage");
		System.out.println(mypage + " : 컨트롤러 마이페이지");
		return mav;
	}
	
//	이동	회원 정보 수정	user/UserUpdate
	@RequestMapping(value = "user/UserUpdate", method = RequestMethod.GET) 
	public ModelAndView MoveUserUpdate(@RequestParam("userid") String userid) throws Exception {
		ModelAndView mav = new ModelAndView();		
		UserDTO user = new UserDTO();
		user= userService.Mypage(userid);
		System.out.println(user + " : 유저DTO확인용");
		mav.addObject("user", user);
		mav.setViewName("user/UserUpdate");
//		System.out.println(user + " : 컨트롤러 마이페이지");
		return mav;
	}
	
//	회원 정보 수정	user/UserUpdate
	@RequestMapping(value = "user/UserUpdate", method = RequestMethod.POST) 
	public String UserUpdate(UserDTO userDTO, RedirectAttributes rttr,Model model) throws Exception {
//		String userid = userDTO.getUserid();
		logger.info("유저아이디 확인 : "+ userDTO);
		int chk = userService.UserUpdate(userDTO);
		if(chk < 0) {
			String msg = "수정할 값을 확인하세요";
			model.addAttribute("msg",msg);
//			MoveUserUpdate(userid);
		}
		return "redirect:Mypage?userid="+userDTO.getUserid();
	}
	
//회원 삭제
	@RequestMapping(value="user/Userdelete", method=RequestMethod.GET)
	public String Delete(@RequestParam("usercode") int usercode,RedirectAttributes rttr) {
		int r = userService.Userdelete(usercode);
		if(r>0) {
			rttr.addFlashAttribute("msg", "삭제되었습니다.");
		}
		return "redirect:UserList";
	}
	
// 회원 관리 등급 변결
	@RequestMapping(value = "user/UserUpgrade", method = RequestMethod.GET)
	public String Upgrade(@RequestParam("usercode") int usercode,RedirectAttributes rttr) {
		
		int r = userService.UserUpgrade(usercode);
		if(r>0) {
			rttr.addFlashAttribute("msg", "유저 레벨 업데이트.");
		}
		return "redirect:UserList";
	}
	
	
	
	
	@RequestMapping(value="chat/friend", method = RequestMethod.GET)
	public ModelAndView friend () {
		
		ModelAndView mav = new ModelAndView();

		
		return mav;
		
	}
	
	//유저 검색하기
		@ResponseBody
		@RequestMapping(value="chat/friend", method = RequestMethod.POST)
		public ArrayList<UserDTO> userSearch(@RequestParam("username") String username) {
			
			ArrayList<UserDTO> ulist = new ArrayList<UserDTO>();
			
			ulist.add(userService.userSearchlist(username));
	
			return ulist;
		}
		
		
		// 친구 추가하기 
		
		@RequestMapping(value="chat/insertfriend", method= {RequestMethod.POST, RequestMethod.GET})
		public String insertfriend (FriendDTO fDTO, Model model, RedirectAttributes rttr) {
			
			int r = userService.insertFriend(fDTO);
			if (r > 0) {
				rttr.addFlashAttribute("msg", "친구 등록 성공");
				return "redirect:/chat/chatroom";

			}
			return "redirect:/";
		
		}
		
		// 회원 전체 리스트 
		@RequestMapping(value = "user/UserList", method = RequestMethod.GET)
		public String ProductPaging(PagingUVO uvo, Model model,
				@RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
			int total = userService.countUser();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "5";
			}

			uvo = new PagingUVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), uvo.getkeyWord());
			model.addAttribute("paging", uvo);
			model.addAttribute("viewAll", userService.userAll(uvo));

			return "user/UserList";
		}

	

//		회원 리스트 GET
		@RequestMapping(value = "user/UserListSearch", method = RequestMethod.GET)
		public String UserList(PagingUVO uvo, Model model,
				@RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
				@RequestParam(value = "keyWord", required = false) String keyWord) throws Exception {
			int total = userService.countUserSearch(uvo);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "5";
			}
			uvo = new PagingUVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyWord);
			model.addAttribute("paging", uvo);
			model.addAttribute("viewAll", userService.usearchlist(uvo));
			return "user/UserListSearch";
		}
		
		// 회원 리스트 POST

		@RequestMapping(value = "user/UserListSearch", method = RequestMethod.POST)
		public String ProductPagingSearch1(PagingUVO uvo, Model model,
				@RequestParam(value = "nowPage", required = false) String nowPage,
				@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
				@RequestParam(value = "keyWord", required = false) String keyWord) throws Exception {
			logger.info("키워드1 " + uvo.getkeyWord());
			logger.info("키: " + keyWord);
			int total = userService.countUserSearch(uvo);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "5";
			}
			logger.info(cntPerPage);
			logger.info(nowPage);

			uvo = new PagingUVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyWord);

			model.addAttribute("paging", uvo);
			model.addAttribute("viewAll", userService.usearchlist(uvo));

			return "user/UserListSearch";
		}

//		포인트 충전페이지로 이동 user/chargepoint
		@RequestMapping(value = "user/chargepoint", method = RequestMethod.GET) 
		public String MoveChargePoint() throws Exception {
		
			return "point/point";
		}
		
//		포인트 충전 user/chargepoint
		@ResponseBody 
		@RequestMapping(value = "user/chargepoint", method = RequestMethod.POST) 
		public String ChargePoint(int amount, HttpSession session) throws Exception {
			
			System.out.println("충전금액은 : "+amount);
			UserDTO userDTO = (UserDTO) session.getAttribute("user"); // 세션에서 아이디 포함하는 userDTO 빈을 가져옴
			userDTO.setPoint(amount);		 						  // 충전할 금액을 빈의 point변수에 추가
			int chk = userService.ChargePoint(userDTO);				  // 포인트 업데이트
			
			// 업데이트된 포인트를 다시 세션에 갱신
			String userid = userDTO.getUserid();
			UserDTO userPoint = userService.Mypage(userid);
			session.setAttribute("point", userPoint.getPoint());
			return "redirect:/";
		}
		
		
	}
