package kr.co.dong.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.user.UserDTO;

@Controller
public class CartController {

	@Inject
	private CartService cartService;

	private static final Logger logger = LoggerFactory.getLogger(CartService.class);

//	장바구니 페이지로 이동
	@RequestMapping(value = "cart/cartlist", method = RequestMethod.GET)
	public String MoveCart(Model model, HttpServletRequest request, @RequestParam("customerid")String customerid, HttpSession session) {
		
		cartService.CartClear(customerid);
		
		System.out.println("======================="+customerid);
		if(customerid.isEmpty()) {
			String non_userIP = session.getId();
			customerid = non_userIP;
			System.out.println(customerid+"구매자 아이디는??");
		}
		
		System.out.println("======================="+customerid);
		List<CartDTO> cartList = cartService.CartList(customerid);		
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}

	
//	수량 변경	cart/numchange
	@ResponseBody
	@RequestMapping(value = "cart/numchange", method = RequestMethod.POST)
	public String numchange(CartDTO cartDTO, HttpSession session){
		String msg = "";	
		UserDTO userDTO = (UserDTO)session.getAttribute("user");
		cartDTO.setCustomerid(userDTO.getUserid());
		cartService.CartNumChange(cartDTO); // 구매수량과 유저아이디를 조건으로 하여 해당 상품을 찾은 후 수량 변경
		return msg;
	}
	
//	선택 구매	cart/buycart
	@ResponseBody
	@RequestMapping(value = "cart/buycart", method = RequestMethod.POST)
	public HashMap<String, Object> BuyCart(Model model,
	     @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
	 logger.info("buy cart");
	 HashMap<String, Object> map = new HashMap<String, Object>();
	 
	 int sumPrice = 0;
	 int cartcode = 0;
	 int countArr = chArr.size();
	 List<Integer> list = new ArrayList<Integer>();
	 int j = 0;
	  
	 for(String i : chArr) {
		   cartcode = Integer.parseInt(i);
		   int price = cartService.BuyCart(cartcode).getCprice();
		   int count = cartService.BuyCart(cartcode).getCbuycount();	
//		   System.out.println("가격은 : "+price + "개수는" + count);
		   cartService.CartStatusUpdate(cartcode);
		   sumPrice += price*count;
		   list.add(cartcode);
		   j++;
	 }   
	 map.put("sumPrice", sumPrice);
	 map.put("countArr", countArr);
	 
	 System.out.println("sumPrice : "+ sumPrice);
	 System.out.println("countArr : "+ countArr);
	  
	 return map;
	}

//	선택 삭제	cart/cdelete
	@ResponseBody
	@RequestMapping(value = "cart/deletecart", method = RequestMethod.POST)
	public int DeleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
	 logger.info("delete cart");
	 
	 int result = 0;
	 int cartcode = 0;
	  
	  for(String i : chArr) {   
		   cartcode = Integer.parseInt(i);
		   System.out.println(cartcode +"카트코드는 ??");
		   cartService.DeleteCart(cartcode);
	  }   
	  result = 1;
	 return result;  
	}
}
