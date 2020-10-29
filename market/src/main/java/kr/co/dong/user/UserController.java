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
}
