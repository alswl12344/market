package kr.co.dong.chat;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.delivery.ManagementDTO;
import kr.co.dong.user.FriendDTO;
import kr.co.dong.user.UserDTO;
import kr.co.dong.user.UserService;

@Controller
public class Mcontroller {

	@Inject
	UserService userService;
	
	@Inject
	MessageService mService;
	//친구 리스트 불러오기
	
	@RequestMapping(value="chat/chatroom", method = RequestMethod.GET)
	public ModelAndView chatroom(HttpSession session, ChatroomDTO chatroomDTO) {
		
		ModelAndView mav = new ModelAndView();
		UserDTO userdto = (UserDTO)session.getAttribute("user");
		String userid = userdto.getUserid();
		System.out.println("userid는" + userid);
		List<FriendDTO> flist = userService.flist(userid);
		mav.addObject("chatroomDTO",chatroomDTO);
		mav.addObject("flist", flist);
		mav.setViewName("chat/chatroom");
		
		return mav;
		
	}
	

	@RequestMapping(value="chat/openchatroom", method = RequestMethod.GET)
	public String getchatroom(ChatroomDTO chatroomDTO) {
		
		return "chat/openchatroom";
		
	}
	
	//채팅방 개설

	// getchatroom을 jsp에서 가져와서 > chatroomDTO 값을 getchatroom 메서드에 넣는다
	@RequestMapping(value="chat/getchatroom", method = RequestMethod.POST)
	public String openchatroom(ChatroomDTO chatroomDTO, RedirectAttributes rttr) {

		System.out.println("chatroomDTO: " + chatroomDTO);
		      int r = mService.getChatroom(chatroomDTO);
		      if(r>0) {
		         rttr.addFlashAttribute("msg", "개설 성공");
		         
		         return "redirect:chatroom";
		       
		      }
		      
		     return "redirect:chat/openchatroom";
		   //성공시 openchatroom jsp 열기
		   }

	}
