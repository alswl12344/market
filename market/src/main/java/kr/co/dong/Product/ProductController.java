package kr.co.dong.Product;

import java.io.File;
import java.io.IOException;
import java.util.List;

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

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	ProductService productService;

	
	// 상품 목록
	@RequestMapping(value = "Product/plist", method = RequestMethod.GET)
	public ModelAndView plist() {

		ModelAndView mav = new ModelAndView();
		List<ProductDTO> plist = productService.plist();		
		mav.addObject("plist", plist);
		mav.setViewName("product/plist");

		return mav;

	}

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
		int imgfromno  = pcode;
		ProductDTO productDTO = productService.pdetail(pcode);
		List<ImgDTO> imgDTO = productService.pdetailimg(imgfromno);		// 상품에 등록된 이미지를 불러오기	
	    

		model.addAttribute("Image", imgDTO); 	// img를 포함하는 리스트를 모델에 담아 같이 넘김
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
	public String pinsert(ProductDTO productDTO, RedirectAttributes rttr, MultipartHttpServletRequest mtfRequest) throws Exception  {

		// 파일 실제저장위치, 이미지 불러올 위치에 대한 기본 경로 정의
        String realpath = "C:\\Users\\YONSAI\\git\\market10\\market\\src\\main\\webapp\\resources\\images\\";
        String viewpath = "../resources/images/";
		
//		1. 입력받은 섬네일 이미지 정보 처리
		MultipartFile thumbnail = mtfRequest.getFile("Thumbnail"); // 섬네일 이미지를 받은 input 박스의 name = pimage
        String originalName = thumbnail.getOriginalFilename(); // 섬네일 원본 파일 명

        String thumbrealpath = realpath + System.currentTimeMillis() + originalName; //실제 경로 + 현재 시간 + 파일이름 으로 데이터 중복 방지
        String thumbviewpath = viewpath + System.currentTimeMillis() + originalName; //상대 경로 + 현재 시간 + 파일이름
        thumbnail.transferTo(new File(thumbrealpath)); //  realpath 경로에 파일 생성
        productDTO.setPimage(thumbviewpath);
        
//		2. 이미지 다중 업로드 정보 처리
		List<MultipartFile> fileList = mtfRequest.getFiles("file"); // 다중 이미지를 받는 input 박스 name = file 
        
		String imgfrom = "Product"; // 상품 등록에서 넣는 이미지라는 것을 명시하기 위해 imgfrom 컬럼값으로 Product 입력
        int imgfromno = productService.countProduct() + 1; // Product 테이블의 몇번 상품에 입력된 이미지인지 확인을 위해 pcode를 확인 후 1을 더한다
        
        for (MultipartFile mf : fileList) {// 다중 이미지를 받은 경우 순차대로 for문을 통해 db 저장 및 파일 생성 
        	
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);
            
            String imgrealpath = realpath + System.currentTimeMillis() + originFileName; //실제 경로 + 현재 시간 + 파일이름 으로 데이터 중복 방지
            String imgviewpath = viewpath + System.currentTimeMillis() + originFileName; //상대 경로 + 현재 시간 + 파일이름
            mf.transferTo(new File(imgrealpath)); //  realpath 경로에 파일 생성
            
            System.out.println("저장할 파일 실제 경로는  "+ imgrealpath);

            ImgDTO imgDTO =  new ImgDTO(imgfrom, imgfromno, imgrealpath, imgviewpath); // DB에 저장할 imgDTO 생성
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

			return "redirect: product/ProductPaging";
		}

		return "redirect:detail?pcode=" + pcode;
	}

	
	//상품 재등록
	
			@RequestMapping(value="Product/pdeldelete", method = RequestMethod.GET)
			public String pdeldelete(@RequestParam("pcode") int pcode, RedirectAttributes rttr) {
				int r = productService.pdeldelete(pcode);
				if(r>0) {
					rttr.addFlashAttribute("msg","상품 재등록 성공");
					
					return "redirect: product/ProductPaging";
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
			
					return "product/ProductPaging";
					

					
				}
			   
			   
//			 상품 페이징 검색 처리 
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
					return "product/ProductPagingSearch";
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
						cntPerPage = "5";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {
						cntPerPage = "5";
					}
				
					spvo = new PagingSortPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), ptcodemain);
				
					model.addAttribute("paging", spvo);
					model.addAttribute("viewAll", productService.productSortList(spvo));
					model.addAttribute("selptcode", ptcodemain);
					return "product/pCategory";
				}
			   
			   
			   // 상품 정렬 처리 POST 대분류
			   
			   @RequestMapping(value="Product/pCategory", method=RequestMethod.POST)
			   public String ProductSortList (PagingSortPVO spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcodemain") int ptcodemain)throws Exception  {
				   
				
				   // 전체 숫자
				   int total = productService.productSort(ptcodemain);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "5";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {
						cntPerPage = "5";
					}
			
					spvo = new PagingSortPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage),ptcodemain);
				
					model.addAttribute("paging", spvo);
					model.addAttribute("viewAll", productService.productSortList(spvo));
				
					logger.info("ptcodemain는: "+  ptcodemain);
					
					return "product/pCategory";
				}
			   
			   
			   
  // 상품 정렬 처리 GET 중분류
			   
			   @RequestMapping(value="Product/pCategory2", method=RequestMethod.GET)
			   public String ProductSortList2 (PagingSortPVO2 spvo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage, @RequestParam("ptcodesub") int ptcodesub, @RequestParam("ptcodemain") int ptcodemain)throws Exception  {
				   
				   logger.info("상품정렬서브코드: "+ptcodesub);
				   // 전체 숫자
				   int total = productService.productSort2(ptcodesub);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "5";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {
						cntPerPage = "5";
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
						cntPerPage = "5";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {
						cntPerPage = "5";
					}
			
					spvo = new PagingSortPVO2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), ptcodemain, ptcodesub);
				
					model.addAttribute("paging", spvo);
					model.addAttribute("viewAll", productService.productSortList2(spvo));
					
					logger.info("ptcodesub는: "+  ptcodesub);
					
					return "product/pCategory2";
				}
			   
			   
			   
			   
			   
			   
}