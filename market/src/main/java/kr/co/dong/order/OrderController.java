package kr.co.dong.order;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.Product.ProductDTO;
import kr.co.dong.Product.ProductService;
import kr.co.dong.cart.CartDTO;
import kr.co.dong.cart.CartService;
import kr.co.dong.delivery.DeliveryService;
import kr.co.dong.delivery.ManagementDTO;
import kr.co.dong.user.UserDTO;
import kr.co.dong.user.UserService;
@Controller
public class OrderController {
	
	@Inject
	private CartService cartService;
	
	@Inject
	private DeliveryService deliveryService;
	
	@Inject
	private OrderService orderService;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private UserService userService;
	

	private static final Logger logger = LoggerFactory.getLogger(CartService.class);
	
//	결제페이지로 이동
	@RequestMapping(value = "order/order", method = RequestMethod.GET)
	public String MoveOrder(@RequestParam("sumPrice") int sumPrice, @RequestParam("countArr") int countArr, Model model, HttpSession session
			, @RequestParam("customerid")String customerid) {
		
		if (customerid.isEmpty()) {
			customerid = session.getId(); // 브라우저에서 부여한 세션 아이디 값을 customerid에 저장
			System.out.println("구매자 아이디는 : " + customerid);
		}
		
		if(countArr == 1) {
			model.addAttribute("countArr", " ");
		} else {
			model.addAttribute("countArr", "외" + (countArr-1) + "건");		
		}		
		List<CartDTO> orderlist = cartService.OrderingCart(customerid); // 장바구니 상품 중 결제가 진행중인 상품을 조회
		String productname = orderlist.get(0).getCname(); // 구매페이지에 표시할 대표상품명
		
		List<ManagementDTO> deliverylist = deliveryService.management(customerid);
		
		model.addAttribute("deliverylist", deliverylist); // 등록된 배달 주소지 목록 
		model.addAttribute("productname", productname); // 구매할 상품 명 
		model.addAttribute("orderlist", orderlist); // 결재가 진행중인 상품을 표시하기위한 리스트 
		model.addAttribute("sumPrice", sumPrice); //합계 가격
		
		
		return "order/order";
	}
	
//	구매할 상품의 재고수량 체크
	@ResponseBody
	@RequestMapping(value = "order/ordercountcheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String OrderCountCheck(OrderDTO orderDTO, HttpSession session) {
		String msg = ""; // 재고부족으로 인해 구매 불가할 시 품목에 대해서 안내하기 위한 변수
		
		/* 결제 테이블에 주문자를 입력하기 위해 세션에서 데이터를 얻어오는 과정 */
		  UserDTO userDTO_user = (UserDTO) session.getAttribute("user"); // 세션에서 아이디를 가져오기 위해 세션에 저장한 사용자 객체 호출 
	      String userid = userDTO_user.getUserid();
	      if(userid.isEmpty()) {  // 객체에 데이터가 없다면 
	         userid = session.getId();       						// 브라우저에서 임의 부여한 세션 객체의 아이디를 가져옴 (비회원) 
	      }else {
	         userid = userDTO_user.getUserid();     						// 사용자가 저장한 세션 객체의 userid를 가져옴 (회원)
	      }
	      orderDTO.setOrderuserid(userid); 							// 확인된 세션의 유저아이디 데이터를 orderDTO에 아이디 set
		
	      
//		1. 구매하려는 상품이 재고가 충분한지 확인 (부족하면 바로 구매 실패 리턴)
		List<CartDTO> orderinglist = cartService.OrderingCart(userid); 	// 장바구니 상품 중 결제가 진행중인 상품을 조회
		for(CartDTO cart : orderinglist) { 								// 진행중인 상품을 각각 1건씩 확인하는 for문
	    	 int pcode = cart.getPcode(); 								// 결제중인 상품코드를 확인
		     int cbuycount = cart.getCbuycount();						// 구매할 수량 확인
		     ProductDTO productDTO = productService.pdetail(pcode);		// 구매중인 상품에 대해 상품테이블에서 정보를 불러옴
		     int pcount = productDTO.getPcount();						// 현재 구매하려는 상품의 재고 수량을 확인
		     int pbuycount = productDTO.getPbuycount(); 				// 현재 구매하려는 상품의 누적 판매 수량을 확인
		     
		     if(pcount < pbuycount+cbuycount) { 						// 재고수량 < 누적구매수량 + 현재구매수량 
		    	 msg += productDTO.getPname() +"구매가능수량 : " + (pcount-pbuycount); // 재고가 부족한 상품명을 msg에 데이터 입력
		     }
		}
		if(msg.length()>2) {							// 재고가 부족하면 msg에 값이 입력되므로 2이상의 크기를 갖게 된다.
			System.out.println("재고부족" + msg);
		}				// 
		
		return JSONValue.toJSONString(msg);
	}
	
//	결제 버튼 클릭 
	@ResponseBody
	@RequestMapping(value = "order/order", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String Order(OrderDTO orderDTO, HttpSession session) {		
		System.out.println("getOrderprice "+orderDTO.getOrderprice());			
		System.out.println("getOrderpaytype "+orderDTO.getOrderpaytype());			
		System.out.println("getOrderreceivename "+orderDTO.getOrderreceivename());		
		System.out.println("getOrdermanagementaddress "+orderDTO.getOrdermanagementaddress());	
		
//		0. 데이터 처리에 필요한 값을 초기값 설정 (리턴할 메세지 변수 / 세션의 유저아이디 값 불러오기)
		String msg = ""; // 재고부족으로 인해 구매 불가할 시 품목에 대해서 안내하기 위한 변수
		if(orderDTO.getOrderpaytype() == 2) {
			orderDTO.setOrderstatus("입금완료");
		} else {
			orderDTO.setOrderstatus("입금대기");
		}
		
		/* 결제 테이블에 주문자를 입력하기 위해 세션에서 데이터를 얻어오는 과정 */
		  UserDTO userDTO_user = (UserDTO) session.getAttribute("user"); // 세션에서 아이디를 가져오기 위해 세션에 저장한 사용자 객체 호출 
	      String userid = userDTO_user.getUserid();
	      if(userid.isEmpty()) {  // 객체에 데이터가 없다면 
	         userid = session.getId();       						// 브라우저에서 임의 부여한 세션 객체의 아이디를 가져옴 (비회원) 
	      }else {
	         userid = userDTO_user.getUserid();     						// 사용자가 저장한 세션 객체의 userid를 가져옴 (회원)
	      }
	      orderDTO.setOrderuserid(userid); 							// 확인된 세션의 유저아이디 데이터를 orderDTO에 아이디 set		
	      
	    List<CartDTO> orderinglist = cartService.OrderingCart(userid); 	// 장바구니 상품 중 결제가 진행중인 상품을 리스트에 담아서 조회
		
//		1. 구매하려는 데이터를 ordertb 테이블에 인서트
	    System.out.println("orderaddress"+orderDTO.getOrdermanagementaddress());
	    System.out.println("orderstatus"+orderDTO.getOrderstatus());
		orderService.OrderConfirm(orderDTO); 									// 입력받은 결제 내역을 결제 테이블(ordertb)에 인서트
		System.out.println("결제내역 인서트 완료");
	    List<OrderDTO> ordercodeList = orderService.GetOrderNumber(orderDTO); 	// 인서트된 결제테이블의 주문번호(ordernumber)를 확인하기 위해 데이터 출력 
	    																		// (여러개의 상품을 한번에 결재할 수 있기 때문에 리스트로 받아옴) 
	    int ordernumber = ordercodeList.get(0).getOrdernumber(); 				// 방금 결제 처리된 상품들의 ordernumber 확인 
	    System.out.println("ordernumber는 " + ordernumber);
	    
	    
//		2. ordertb의 ordernumber(주문번호)를 장바구니 테이블의 해당상품에 업데이트 + 장바구니 테이블에서 해당상품의 상태를 구매 완료로 업데이트
	    for(CartDTO cart : orderinglist) { 					// 진행중인 상품을 각각 1건씩 확인하는 for문	
	    	 cart.setCartstatus(orderDTO.getOrderpaytype());// 결제타입이 무통장 입금이면 카트 상태값을 3으로 한다
	         cart.setOrdernumber(ordernumber); 				// 각각 cartDTO에  ordernumber set
	         cartService.OrderingCartComfirm(cart); 		// 해당 상품에 결제완료처리를 진행 (카트테이블 상품상태값:2 / 결제한 주문번호 입력)	   
	         System.out.println("주문번호 및 장바구니 상태 업데이트");
	    
//		3. 상품 테이블에 누적 구매수량을 증가 
		    int pcode = cart.getPcode(); 				// 결제중인 상품코드를 확인
			int cbuycount = cart.getCbuycount();		// 구매 수량 확인
			ProductDTO productDTO = new ProductDTO();	// 
			productDTO.setPcode(pcode);					// productDTO에 상품코드 입력
			productDTO.setPbuycount(cbuycount);			//             구매할 수량 입력
			productService.BuycountUpdate(productDTO);	// 해당 상품에 누적구매수량을 현재 구매할 수량만큼 증가 시킴
			System.out.println("누적 구매수량 업데이트");
	    }		
	    
//	    4. 구매한 금액만큼 보유 포인트 차감 (paytype 3은 무통장입금 : 포인트 차감 x)
	    if(orderDTO.getOrderpaytype() != 3) {
		    UserDTO userDTO_point = new UserDTO();	
		    userDTO_point.setUserid(userid);					// 사용자 id를 userDTO에 입력
		    userDTO_point.setPoint(orderDTO.getOrderprice());	// 구매금액을 userDTO에 입력
		    userService.PayPoint(userDTO_point);				// 유저 테이블에 보유포인트에서 구매 포인트를 차감
		    
		    UserDTO userPoint = userService.Mypage(userid);		
			session.setAttribute("point", userPoint.getPoint());// 유저포인트를 다시 세션에 업데이트
	    }
	    
		return JSONValue.toJSONString(msg); // 
	}
	
	@RequestMapping(value="order/moneycheck", method=RequestMethod.GET)
	public String MoneyCheck(@RequestParam("ordercode")int ordercode) {
		System.out.println("ordercode 받음" + ordercode);
		System.out.println("입금확인 메서드 확인");
		orderService.MoneyCheck(ordercode);
		return "redirect:../delivery/dviewuser";
	}
}
