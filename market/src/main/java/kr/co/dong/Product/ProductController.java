package kr.co.dong.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.board.PagingVO;



@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	ProductService productService;
	
	
	//상품 목록
	@RequestMapping(value="Product/plist", method = RequestMethod.GET)
	public ModelAndView plist() {
		
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> plist = productService.plist();
		mav.addObject("plist", plist);
		mav.setViewName("plist");
		
		return mav;
		
	}
	
	
	//삭제 상품 목록
		@RequestMapping(value="Product/pdellist", method = RequestMethod.GET)
		public ModelAndView pdellist() {
			
			ModelAndView mav = new ModelAndView();
			List<ProductDTO> pdellist = productService.pdellist();
			mav.addObject("pdellist", pdellist);
			mav.setViewName("pdellist");
			
			return mav;
			
		}
	
	
	
	
	//상품 상세보기
		@RequestMapping(value="Product/pdetail", method = RequestMethod.GET)
		public String pdetail (@RequestParam("pcode") int pcode, Model model) {
	
			ProductDTO productDTO = productService.pdetail(pcode);
			
			model.addAttribute("Product", productDTO);
			model.addAttribute("Product", productService.pdetail(pcode));
			
			return "pdetail";
		}
	
	//상품 등록 GET
		@RequestMapping(value="Product/pinsert", method = RequestMethod.GET)
		public String pinsert () {
			
			return "pinsert";
			
		}
	//상품등록 POST
		@RequestMapping(value="Product/pinsert", method=RequestMethod.POST)
		public String pinsert(ProductDTO productDTO, RedirectAttributes rttr) {
			
			int r = productService.pinsert(productDTO);
			if(r>0) {
				rttr.addFlashAttribute("msg", "상품 등록 성공");
			} 
			return "redirect:ProductPaging";
		}		
	
	
	//상품 수정 GET
		
		@RequestMapping(value="Product/pupdate", method= RequestMethod.GET)
		public String pupdate(@RequestParam("pcode") int pcode, Model model) {
			
			ProductDTO prodto = productService.pdetail(pcode);
			
			model.addAttribute("prodto", prodto);
			return "pupdate";
		}
	// 상품 수정 POST
		@RequestMapping(value="Product/pupdate", method= RequestMethod.POST)
		public String pupdate(ProductDTO productDTO, RedirectAttributes rttr) {
			
			int r = productService.pupdate(productDTO);
			
			if(r>0) {
				rttr.addFlashAttribute("msg", "상품 수정 성공");			
			return "redirect:ProductPaging";
			
			}
			//수정에 성공하면 수정된 상품 목록으로 
			
			return "redirect:update?pcode=" + productDTO.getPcode();
		}
	
		
	//상품 삭제
		
		@RequestMapping(value="Product/pdelete", method = RequestMethod.GET)
		public String pdelete(@RequestParam("pcode") int pcode, RedirectAttributes rttr) {
			int r = productService.pdelete(pcode);
			if(r>0) {
				rttr.addFlashAttribute("msg","상품 삭제 성공");
				
				return "redirect: ProductPaging";
			}
			
			return "redirect:detail?pcode=" + pcode;
					}
	
	//상품 재등록
		
		@RequestMapping(value="Product/pdeldelete", method = RequestMethod.GET)
		public String pdeldelete(@RequestParam("pcode") int pcode, RedirectAttributes rttr) {
			int r = productService.pdeldelete(pcode);
			if(r>0) {
				rttr.addFlashAttribute("msg","상품 재등록 성공");
				
				return "redirect: ProductPaging";
			}
			
			return "redirect:detail?pcode=" + pcode;
					}
		

	
		//상품 페이징 처리 
		   @RequestMapping(value="Product/ProductPaging", method=RequestMethod.GET)
		   public String ProductPaging(PagingPVO pvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage)
		   {
				int total = productService.countProduct();
				if(nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if(nowPage == null) {
					nowPage = "1";
				} else if(cntPerPage == null) {
					cntPerPage = "5";
				}
				pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), pvo.getkeyWord());
				model.addAttribute("paging", pvo);
				model.addAttribute("viewAll", productService.selectProduct(pvo));
				return "ProductPaging";
			}
		   
		   
//		 상품 페이징 검색 처리 
		   @RequestMapping(value="Product/ProductPagingSearch", method=RequestMethod.GET)
		   public String ProductPagingSearch(PagingPVO pvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage,  @RequestParam(value="keyWord", required=false)String keyWord) throws Exception
		   {
				int total = productService.countProduct2(pvo);
				if(nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if(nowPage == null) {
					nowPage = "1";
				} else if(cntPerPage == null) {
					cntPerPage = "5";
				}
				pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyWord);
				model.addAttribute("paging", pvo);
				model.addAttribute("viewAll", productService.psearchlist(pvo));
				return "ProductPagingSearch";
			}
		   
		   //상품 검색 처리 POST
		   
		   @RequestMapping(value="Product/ProductPagingSearch", method=RequestMethod.POST)
		   public String ProductPagingSearch1(PagingPVO pvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam(value="keyWord", required=false)String keyWord) throws Exception  {
			   logger.info("키워드1 "+pvo.getkeyWord());
			   logger.info("키: "+keyWord);
			   int total = productService.countProduct2(pvo);
				if(nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if(nowPage == null) {
					nowPage = "1";
				} else if(cntPerPage == null) {
					cntPerPage = "5";
				}
				logger.info(cntPerPage);
				logger.info(nowPage);
				  logger.info("키워드2 "+pvo.getkeyWord());
				pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), keyWord);
				logger.info("키워드3 "+pvo.getkeyWord());
				model.addAttribute("paging", pvo);
				model.addAttribute("viewAll", productService.psearchlist(pvo));
				
				return "ProductPagingSearch";
			}
		   
		   
		   
		   
		   
		   
		   // 상품 정렬 처리 GET
		   
		   @RequestMapping(value="Product/ProductPagingSort", method=RequestMethod.GET)
		   public String ProductSortList1 (PagingSortPVO spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcode") int ptcode)throws Exception  {
			   
			   logger.info("상품정렬코드: "+ptcode);
			   // 전체 숫자
			   int total = productService.productSort(ptcode);
				if(nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if(nowPage == null) {
					nowPage = "1";
				} else if(cntPerPage == null) {
					cntPerPage = "5";
				}
			
				spvo = new PagingSortPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), ptcode);
			
				model.addAttribute("paging", spvo);
				model.addAttribute("viewAll", productService.productSortList(spvo));
				
				return "ProductPagingSort";
			}
		   
		   
		   // 상품 정렬 처리 POST 
		   
		   @RequestMapping(value="Product/ProductPagingSort", method=RequestMethod.POST)
		   public String ProductSortList (PagingSortPVO spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcode") int ptcode)throws Exception  {
			   
			
			   // 전체 숫자
			   int total = productService.productSort(ptcode);
				if(nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "5";
				} else if(nowPage == null) {
					nowPage = "1";
				} else if(cntPerPage == null) {
					cntPerPage = "5";
				}
		
				spvo = new PagingSortPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), ptcode);
			
				model.addAttribute("paging", spvo);
				model.addAttribute("viewAll", productService.productSortList(spvo));
				
				logger.info("ptcode는: "+  ptcode);
				
				return "ProductPagingSort";
			}
		   
		   
		   
		   
		   
		   
		   
}