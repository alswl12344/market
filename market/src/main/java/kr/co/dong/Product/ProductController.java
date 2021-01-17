package kr.co.dong.Product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hamcrest.core.SubstringMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.ImgDTO;
import kr.co.dong.board.PagingVO;
import kr.co.dong.cart.CartDTO;
import kr.co.dong.cart.CartService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	ProductService productService;

	@Autowired
	CartService cartService;

//	// 상품 목록
//	@RequestMapping(value = "Product/plist", method = RequestMethod.GET)
//	public ModelAndView plist() {
//
//		ModelAndView mav = new ModelAndView();
//		List<ProductDTO> plist = productService.plist();
//		mav.addObject("plist", plist);
//		mav.setViewName("product/plist");
//
//		return mav;
//
//	}

	// 삭제 상품 목록
	@RequestMapping(value = "Product/pdellist", method = RequestMethod.GET)
	public ModelAndView pdellist() {

		ModelAndView mav = new ModelAndView();
		List<ProductDTO> pdellist = productService.pdellist();
		mav.addObject("pdellist", pdellist);
		mav.setViewName("product/pdellist");

		return mav;

	}

	// 상품 상세보기
	@RequestMapping(value = "Product/pdetail", method = RequestMethod.GET)
	public String pdetail(@RequestParam("pcode") int pcode, Model model) {
		int imgfromno = pcode;
		ProductDTO productDTO = productService.pdetail(pcode);
		List<ImgDTO> imgDTO = productService.pdetailimg(imgfromno); // 상품에 등록된 이미지를 불러오기

		model.addAttribute("Image", imgDTO); // img를 포함하는 리스트를 모델에 담아 같이 넘김
		model.addAttribute("Product", productDTO);
		model.addAttribute("Product", productService.pdetail(pcode));

		return "product/pdetail";
	}

	// 상품 등록 GET
	@RequestMapping(value = "Product/pinsert", method = RequestMethod.GET)
	public String pinsert() {

		return "product/pinsert";

	}

	// 상품등록 POST
	@RequestMapping(value = "Product/pinsert", method = RequestMethod.POST)
	public String pinsert(ProductDTO productDTO, RedirectAttributes rttr, MultipartHttpServletRequest mtfRequest)
			throws Exception {

		// 파일 실제저장위치, 이미지 불러올 위치에 대한 기본 경로 정의
		String realpath = "C:\\Users\\YONSAI\\git\\market10\\market\\src\\main\\webapp\\resources\\uploadimage\\";
		String viewpath = "../resources/uploadimage/";

//		1. 입력받은 섬네일 이미지 정보 처리
		MultipartFile thumbnail = mtfRequest.getFile("Thumbnail"); // 섬네일 이미지를 받은 input 박스의 name = pimage
		String originalName = thumbnail.getOriginalFilename(); // 섬네일 원본 파일 명

		String thumbrealpath = realpath + System.currentTimeMillis() + originalName; // 실제 경로 + 현재 시간 + 파일이름 으로 데이터 중복
																						// 방지
		String thumbviewpath = viewpath + System.currentTimeMillis() + originalName; // 상대 경로 + 현재 시간 + 파일이름
		thumbnail.transferTo(new File(thumbrealpath)); // realpath 경로에 파일 생성
		productDTO.setPimage(thumbviewpath);

//		2. 이미지 다중 업로드 정보 처리
		List<MultipartFile> fileList = mtfRequest.getFiles("file"); // 다중 이미지를 받는 input 박스 name = file

		String imgfrom = "Product"; // 상품 등록에서 넣는 이미지라는 것을 명시하기 위해 imgfrom 컬럼값으로 Product 입력
		int imgfromno = productService.MaxProduct() + 1; // Product 테이블의 몇번 상품에 입력된 이미지인지 확인을 위해 pcode를 확인 후 1을 더한다
		System.out.println(imgfromno+"이미지 번호는 ??");

		for (MultipartFile mf : fileList) {// 다중 이미지를 받은 경우 순차대로 for문을 통해 db 저장 및 파일 생성

			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String imgrealpath = realpath + System.currentTimeMillis() + originFileName; // 실제 경로 + 현재 시간 + 파일이름 으로 데이터
																							// 중복 방지
			String imgviewpath = viewpath + System.currentTimeMillis() + originFileName; // 상대 경로 + 현재 시간 + 파일이름
			mf.transferTo(new File(imgrealpath)); // realpath 경로에 파일 생성

			System.out.println("저장할 파일 실제 경로는  " + imgrealpath);

			ImgDTO imgDTO = new ImgDTO(imgfrom, imgfromno, imgrealpath, imgviewpath); // DB에 저장할 imgDTO 생성
			productService.pimageinsert(imgDTO); // imgDTO DB 저장 서비스 호출
		}

		int r = productService.pinsert(productDTO); // 입력한 내용 DB 저장하는 서비스 호출
		if (r > 0) {
			rttr.addFlashAttribute("msg", "상품 등록 성공");
		}
		return "redirect:ProductPaging";

	}

	// 상품 수정 GET

	@RequestMapping(value = "Product/pupdate", method = RequestMethod.GET)
	public String pupdate(@RequestParam("pcode") int pcode, Model model) {

		ProductDTO prodto = productService.pdetail(pcode);

		model.addAttribute("prodto", prodto);
		return "product/pupdate";
	}

	// 상품 수정 POST
	@RequestMapping(value = "Product/pupdate", method = RequestMethod.POST)
	public String pupdate(ProductDTO productDTO, RedirectAttributes rttr) {

		int r = productService.pupdate(productDTO);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "상품 수정 성공");
			return "redirect:product/ProductPaging";

		}
		// 수정에 성공하면 수정된 상품 목록으로

		return "redirect:update?pcode=" + productDTO.getPcode();
	}

	// 상품 삭제

	@RequestMapping(value = "Product/pdelete", method = RequestMethod.GET)
	public String pdelete(@RequestParam("pcode") int pcode, RedirectAttributes rttr) {
		int r = productService.pdelete(pcode);
		if (r > 0) {
			rttr.addFlashAttribute("msg", "상품 삭제 성공");

			return "redirect: ProductPaging";
		}

		return "redirect:detail?pcode=" + pcode;
	}

	// 상품 재등록

	@RequestMapping(value = "Product/pdeldelete", method = RequestMethod.GET)
	public String pdeldelete(@RequestParam("pcode") int pcode, RedirectAttributes rttr) {
		int r = productService.pdeldelete(pcode);
		if (r > 0) {
			rttr.addFlashAttribute("msg", "상품 재등록 성공");

			return "redirect: ProductPaging";
		}

		return "redirect:detail?pcode=" + pcode;
	}

	// 상품 페이징 처리
	@RequestMapping(value = "Product/ProductPaging", method = RequestMethod.GET)
	public String ProductPaging(PagingPVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = productService.countProduct();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}

		pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getkeyWord());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", productService.selectProduct(pvo));

		return "product/ProductPaging";
	}


//	상품 페이징 검색 처리 
	@RequestMapping(value = "Product/ProductPagingSearch", method = RequestMethod.GET)
	public String ProductPagingSearch(PagingPVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "keyWord", required = false) String keyWord) throws Exception {
		int total = productService.countProduct2(pvo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}
		pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyWord);
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", productService.psearchlist(pvo));
		return "product/ProductPagingSearch";
	}

	// 상품 검색 처리 POST

	@RequestMapping(value = "Product/ProductPagingSearch", method = RequestMethod.POST)
	public String ProductPagingSearch1(PagingPVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "keyWord", required = false) String keyWord) throws Exception {
		logger.info("키워드1 " + pvo.getkeyWord());
		logger.info("키: " + keyWord);
		int total = productService.countProduct2(pvo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "15";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "15";
		}
		logger.info(cntPerPage);
		logger.info(nowPage);
		logger.info("키워드2 " + pvo.getkeyWord());
		pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyWord);
		logger.info("키워드3 " + pvo.getkeyWord());
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", productService.psearchlist(pvo));

		return "product/ProductPagingSearch";
	}
	   

	   // 상품 정렬 처리 GET 대분류
	   
	   @RequestMapping(value="Product/pCategory", method=RequestMethod.GET)
	   public String ProductSortList1 (PagingSortPVO spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcodemain") int ptcodemain)throws Exception  {
		   
		   logger.info("상품정렬코드: "+ptcodemain);
		   // 전체 숫자
		   int total = productService.productSort(ptcodemain);
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "15";
			}
		
			spvo = new PagingSortPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), ptcodemain);
			model.addAttribute("selptcode", ptcodemain);
			model.addAttribute("paging", spvo);
			model.addAttribute("viewAll", productService.productSortList(spvo));
			
			return "product/pCategory";
		}
	   
	   
	   // 상품 정렬 처리 POST 대분류
	   
	   @RequestMapping(value="Product/pCategory", method=RequestMethod.POST)
	   public String ProductSortList (PagingSortPVO spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcodemain") int ptcodemain)throws Exception  {
		   
		
		   // 전체 숫자
		   int total = productService.productSort(ptcodemain);
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "15";
			}
	
			spvo = new PagingSortPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),ptcodemain);
		
			model.addAttribute("paging", spvo);
			model.addAttribute("viewAll", productService.productSortList(spvo));
			
			logger.info("ptcodemain는: "+  ptcodemain);
			
			return "pCategory";
		}
	   
	   
//상품 정렬 처리 GET 중분류
	   
	   @RequestMapping(value="Product/pCategory2", method=RequestMethod.GET)
	   public String ProductSortList2 (PagingSortPVO2 spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcodesub") int ptcodesub, @RequestParam("ptcodemain") int ptcodemain)throws Exception  {
		   
		   logger.info("상품정렬서브코드: "+ptcodesub);
		   // 전체 숫자
		   int total = productService.productSort2(ptcodesub);
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "15";
			}
		
			spvo = new PagingSortPVO2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), ptcodemain, ptcodesub);
		
			model.addAttribute("paging", spvo);
			model.addAttribute("viewAll", productService.productSortList2(spvo));
		
			
			return "product/pCategory2";
		}
	   
	   
	   // 상품 정렬 처리 POST 중분류
	   
	   @RequestMapping(value="Product/pCategory2", method=RequestMethod.POST)
	   public String ProductSortList21 (PagingSortPVO2 spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcodesub") int ptcodesub, @RequestParam("ptcodemain") int ptcodemain)throws Exception  {
		   
		
		   // 전체 숫자
		   int total = productService.productSort2(ptcodesub);
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "15";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {
				cntPerPage = "15";
			}
	
			spvo = new PagingSortPVO2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), ptcodemain, ptcodesub);
		
			model.addAttribute("paging", spvo);
			model.addAttribute("viewAll", productService.productSortList2(spvo));
			
			logger.info("ptcodesub는: "+  ptcodesub);
			
			return "pCategory2";
		}
	


	   

	// 상품 장바구니 담기
		@RequestMapping(value = "Product/addcart", method = RequestMethod.GET)
		public String AddCart(@RequestParam("pcode") int pcode, @RequestParam("customerid") String customerid, @RequestParam("pbuycount") int pbuycount,
				HttpServletRequest request, RedirectAttributes redirectAttributes, Model model, HttpSession session) {
			System.out.println("입력받은 아이디는1 : " + customerid);
			System.out.println("입력받은 pcode1 : " + pcode);
			System.out.println("입력받은 pbuycount1 : " + pbuycount);
			
			ProductDTO productDTO = productService.pdetail(pcode); // 다시 상품 상세보기 페이지로 돌아갈 때 사용할 데이터를 만듦
			productDTO.setPbuycount(pbuycount);
//			===비회원 장바구니 기능 시작 === 
			if (customerid.isEmpty()) {
				String non_userIP = session.getId(); // 브라우저에서 부여한 세션 아이디 값을 non_userIP에 저장
				customerid = non_userIP; // customerid 변수 값을 ip주소 값으로 연결
				System.out.println("구매자 아이디는2 : " + customerid);
			}
			CartDTO cartDTO = new CartDTO(productDTO, customerid); // 입력받은 값을 cart 테이블에 저장하기 위해 cartDTO 데이터 생성
			System.out.println("cartDTO 만들기 성공 ");
			System.out.println("데이터 확인 pcode :" + cartDTO.getPcode());
			System.out.println("데이터 확인 customerid :" + cartDTO.getCustomerid());
			System.out.println("데이터 확인 cuserid :" + cartDTO.getCuserid());
			int chk = cartService.CheckCart(cartDTO);
			System.out.println("중복검사 성공 ");
			if (chk >= 1) { // 만약 장바구니에 넣으려는 상품이 이미 장바구니에 있다면
				System.out.println("상품 개수 추가 ");
				cartService.BuyCountUpdate(cartDTO); // 구매하려는 수량값만큼 장바구니 상품 수량 증가
			} else {
				System.out.println("상품 추가 ");
				cartService.AddCart(cartDTO); // 장바구니에 없는 상품이면 해당 상품을 장바구니에 추가
			}
			redirectAttributes.addAttribute("pcode", pcode); // redirect시킬 때 pcode를 get방식 조건값으로 넣어주는 코드
			return "redirect:/Product/pdetail";
		}

	
	

	   
	   //상품 댓글 작성하기
	   
	// ajax 댓글을 위한 매핑, 댓글 목록
		@ResponseBody
		@RequestMapping(value="Product/pReplylist",method=RequestMethod.POST)
		public List<ProductReply> ReplyList(@RequestParam("pcode") int pcode) {
			return productService.pGetDetail(pcode);
		}
		
		// ajax 쓰기
		@ResponseBody
		@RequestMapping(value="Product/pReply", method=RequestMethod.POST)
		public int pReply(ProductReply productReply) {
			return productService.pReply(productReply);
		}
		
		// ajax 댓글에 대한 매핑과 메소드 구현
		@ResponseBody
		@RequestMapping(value="Product/pReplyUpdate", method=RequestMethod.POST)
		public Map<String,Object> pReplyUpdate(ProductReply productReply) {
			Map<String, Object> result = new HashMap<String, Object>();
			try {
				productService.pReplyUpdate(productReply);
				result.put("status","OK");
			} catch (Exception e) {
				e.printStackTrace();
				result.put("status", "fail");
			}
			return result;
		}
		
		// 댓글 삭제
		@ResponseBody
		@RequestMapping(value="Product/pReplyDelete", method=RequestMethod.POST)
		public Map<String,Object> pReplyDelete(int preno) {
			Map<String, Object> result = new HashMap<String, Object>();
			try {
				productService.pReplyDelete(preno);
				result.put("status","OK");
			} catch (Exception e) {
				e.printStackTrace();
				result.put("status", "fail");
			}
			return result;
		}
}