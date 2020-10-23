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

        List<MultipartFile> fileList = mtfRequest.getFiles("file"); // 다중 이미지를 받는 input 박스 name = file 
        String src = mtfRequest.getParameter("src"); // src = 사용자 입력값
        System.out.println("src value : " + src);
        
        String imgfrom = "Product"; // 상품 등록에서 넣는 이미지라는 것을 명시하기 위해 imgfrom 컬럼값으로 Product 입력
        int imgfromno = productService.countProduct() + 1; // Product 테이블의 몇번 상품에 입력된 이미지인지 확인을 위해 pcode를 확인 후 1을 더한다
        
        String realpath = "C:\\Users\\YONSAI\\git\\market22\\market\\src\\main\\webapp\\resources\\images\\";
        String viewpath = "../resources/images/";

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
		return "redirect:plist";

	}
	
	@RequestMapping(value = "Product/pinsert2", method = RequestMethod.POST)
    public String requestupload2(MultipartHttpServletRequest mtfRequest) {
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String src = mtfRequest.getParameter("src");
        System.out.println("src value : " + src);

        String path = "C:\\Users\\YONSAI\\git\\market22\\market\\src\\main\\webapp\\resources\\images\\";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String saveFile = path + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(saveFile));
                System.out.println("saveFile : " + saveFile);
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return "redirect:/";
    }

	
	// 상품 정렬(Sort)

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
			return "redirect:plist";

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

			return "redirect: plist";
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
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", productService.selectProduct(pvo));
		return "product/ProductPaging";
	}

	// 상품 페이징 검색 처리
	@RequestMapping(value = "Product/ProductPagingSearch", method = RequestMethod.GET)
	public String ProductPagingSearch(PagingPVO pvo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		int total = productService.countProduct();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		pvo = new PagingPVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pvo);
		model.addAttribute("viewAll", productService.selectProduct(pvo));
		return "product/ProductPaging";
	}
}
