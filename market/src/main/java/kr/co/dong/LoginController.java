package kr.co.dong;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.domain.LoginVO;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="login/loginForm",method=RequestMethod.GET)
	public ModelAndView loginForm() {
		logger.info("로그인 폼 처리화면입니다.");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("test", "test model"); // Model 전달자
		mav.setViewName("login/loginForm");  // View 
		
		return mav;
	}
	//request한 파라미터를 전달받는 방법1
	@RequestMapping(value="login/login",method= RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView();
		
		String userID = request.getParameter("userID");
		String name = request.getParameter("name");
		
		//요청 데이터를 view에 전달
		mav.addObject("userID", userID);
		mav.addObject("name", name);
		mav.setViewName("login/result");
		return mav;
	}
	
	//request한 파라미터를 전달받는 방법2
	//@RequestParam 
	@RequestMapping(value="login/login2", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login2(@RequestParam("userID") String userID,
			@RequestParam("name")String name,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userID", userID);
		mav.addObject("name", name);
		mav.setViewName("login/result");
		return mav;
	}
	
	//request한 파라미터를 전달받는 방법3
	//@RequestParam Map<> 
	@RequestMapping(value="login/login3", method = RequestMethod.POST)
	public ModelAndView login3(@RequestParam Map<String,String> info, HttpServletRequest request ) throws Exception {
		request.setCharacterEncoding("utf-8");
		//요청데이터 확인
		logger.info("아이디 : " + info.get("userID"));
		logger.info("이름 : " + info.get("name"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", info);
		mav.setViewName("login/result");
		return mav;
	}
	
	//request한 파라미터를 전달받는 방법4
	//@ModelAttribute
	@RequestMapping(value="login/login4",method = RequestMethod.POST)
	public ModelAndView login4(@ModelAttribute("info")LoginVO loginVO) {
		logger.info("아이디 : " + loginVO.getUserID());
		logger.info("이름 : " + loginVO.getName());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/result");
		return mav;
	}
	
//	@RequestMapping(value="login/login4",method = RequestMethod.POST)
//	public ModelAndView login4(LoginVO loginVO) {
//		logger.info("아이디 : " + loginVO.getUserID());
//		logger.info("이름 : " + loginVO.getName());
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("info",loginVO);
		
//		mav.setViewName("login/result");
//		return mav;
//	}
	
}














