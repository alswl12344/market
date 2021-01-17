package kr.co.dong.delivery;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.Session;

import kr.co.dong.order.OrderDTO;
import kr.co.dong.order.OrderService;
import kr.co.dong.user.UserDTO;



@Controller
public class DeliveryController {
	
	@Inject
	private DeliveryService deliveryService;
	
	@Inject
	private OrderService orderService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryService.class);
	 
	// 배송현황 목록 (관리자)
		@RequestMapping(value="delivery/dview", method=RequestMethod.GET)
		public ModelAndView dview() {
			
			ModelAndView mav = new ModelAndView();			
			List<OrderDTO> list = orderService.OrderList();				
			System.out.println("리스트 값 확인 : " + list);			
			mav.addObject("list", list);
			mav.setViewName("delivery/dview");
			return mav;
		}
		// 배송현황 목록 (일반 사용자)
		@RequestMapping(value="delivery/dviewuser", method=RequestMethod.GET)
		public ModelAndView DviewUser(@RequestParam("orderuserid")String orderuserid) {
			System.out.println("여기왓다");
			ModelAndView mav = new ModelAndView();			
			List<OrderDTO> list = orderService.OrderListUser(orderuserid);			
			mav.addObject("list", list);
			mav.setViewName("delivery/dviewuser");
			return mav;
		}
		
		// 주소록 관리 목록
		@RequestMapping(value="delivery/management", method=RequestMethod.GET)
		public ModelAndView management(@RequestParam("userid")String userid) {
			ModelAndView mav = new ModelAndView();
			
			List<ManagementDTO> list = deliveryService.management(userid);
			
			System.out.println("리스트 값 확인 : " + list);
			
			mav.addObject("list", list);
			mav.setViewName("management/management");
			return mav;
		}
		
		//주소 추가
		   @RequestMapping(value="delivery/minsert", method=RequestMethod.GET)
		   public String insert() {
		      
		      return "management/minsert";
		   }
		   
		   @RequestMapping(value="delivery/minsert", method=RequestMethod.POST)
		   public String insert(ManagementDTO managementDTO,RedirectAttributes rttr, HttpSession session) {
			   int r = deliveryService.insert(managementDTO);
		      
			   UserDTO userDTO = (UserDTO)session.getAttribute("user");
			   String userid = userDTO.getUserid();
		      if(r>0) { //성공
		         rttr.addFlashAttribute("msg", "추가에 성공하였습니다.");
		      }
		      return "redirect:management?userid="+ userid;
		   }
		   
		   //주소 수정
		   @RequestMapping(value="delivery/mupdate", method=RequestMethod.GET)
		   public String update() {

		      return "management/mupdate";
		   }
		   @RequestMapping(value="delivery/mupdate", method=RequestMethod.POST)
		   public String update(ManagementDTO managementDTO,RedirectAttributes rttr) {
		      int r = deliveryService.update(managementDTO);
		      String userid = managementDTO.getUserid();
		      if(r>0) {
		         rttr.addFlashAttribute("msg", "수정에 성공하였습니다.");
		      }
		      return "redirect:management?userid="+ userid;
		   }
		   
		   //주소 삭제
		   @RequestMapping(value="delivery/delete", method=RequestMethod.GET)
		   public String delete(@RequestParam("mcode") int mcode, HttpSession session, RedirectAttributes rttr) {
		      int r = deliveryService.delete(mcode);
		      UserDTO userDTO = (UserDTO)session.getAttribute("user");
		      String userid = userDTO.getUserid();
		      
		      if(r>0) {
		         rttr.addFlashAttribute("msg", "삭제에 성공하였습니다.");
		      }
		      return "redirect:management?userid="+ userid;
		   }
}
