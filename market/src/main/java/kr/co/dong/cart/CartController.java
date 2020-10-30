package kr.co.dong.cart;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CartController {

	@Inject
	private CartService cartService;

	private static final Logger logger = LoggerFactory.getLogger(CartService.class);

//	장바구니 페이지로 이동
	@RequestMapping(value = "cart/cartlist", method = RequestMethod.GET)
	public String MoveCart(Model model, HttpServletRequest request, @RequestParam("customerid")String customerid) {
		
		System.out.println("======================="+customerid);
		if(customerid.isEmpty()) {
			String non_userIP = request.getRemoteAddr();
			customerid = non_userIP;			
		}
		
		System.out.println("======================="+customerid);
		List<CartDTO> cartList = cartService.CartList(customerid);		
		model.addAttribute("cartList", cartList);
		return "cart/cart";
	}

	
//	수량 변경	cart/numchange

//	선택 구매	cart/buy

//	선택 삭제	cart/cdelete

}
