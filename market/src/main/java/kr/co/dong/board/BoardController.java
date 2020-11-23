package kr.co.dong.board;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	// test
	@RequestMapping(value="board/list", method=RequestMethod.GET)
	public ModelAndView ListAll() {
		ModelAndView mav = new ModelAndView();
		
		List<BoardDTO> listAll = boardService.ListAll();
		
		mav.addObject("list", listAll);
		mav.setViewName("board/list");
		return mav;
	}
	
	@RequestMapping(value="board/selectCategory",method=RequestMethod.POST)
	public ModelAndView Category(@RequestParam("bcategory") int bcategory) {
		ModelAndView mav = new ModelAndView();
		String category = boardService.SelectCategory(bcategory);
		return mav;
	}
	
	@RequestMapping(value="board/insert", method=RequestMethod.GET)
	public String MoveInsert() {
		return "board/insert";
	}
	
	@RequestMapping(value="board/insert", method=RequestMethod.POST)
	public String Insert(BoardDTO boardDTO,RedirectAttributes rttr) {
		int r = boardService.Insert(boardDTO);
		
		if(r>0) { //성공
			rttr.addFlashAttribute("msg", "글을 등록했습니다.");
		}
		return "redirect:paginglist";
	}
	
	// 상세 보기
	@RequestMapping(value="board/detail",method=RequestMethod.GET)
	public String Detail(@RequestParam("bno") int bno, Model model) {
		// 조회수 증가와 글읽기 ===> service에서 처리해야함.
		boardService.RreadCnt(bno);
		BoardDTO boardDTO = boardService.ListDetail(bno);
		model.addAttribute("board", boardDTO);
		return "board/detail";
	}
	
	// 글 수정
	@RequestMapping(value="board/update", method=RequestMethod.GET)
	public String MoveUpdate(int bno) {
		return "board/update";
	}
	
	@RequestMapping(value="board/update", method=RequestMethod.POST)
	public String Update(BoardDTO dto,RedirectAttributes rttr) {
		int r = boardService.Update(dto);
		if(r>0) {
			rttr.addFlashAttribute("msg", "수정되었습니다.");
		}
		return "redirect:paginglist";
	}

	// 글 삭제
	@RequestMapping(value="board/delete", method=RequestMethod.GET)
	public String Delete(@RequestParam("bno") int bno,RedirectAttributes rttr) {
		int r = boardService.Delete(bno);
		if(r>0) {
			rttr.addFlashAttribute("msg", "삭제되었습니다.");
		}
		return "redirect:paginglist";
	}
	
	// ajax 댓글을 위한 매핑, 댓글 목록
	@ResponseBody
	@RequestMapping(value="board/replylist",method=RequestMethod.POST)
	public List<BoardReply> ReplyList(@RequestParam("bno") int bno) {
		return boardService.GetDetail(bno);
	}
	
	// ajax 쓰기
	@ResponseBody
	@RequestMapping(value="board/reply", method=RequestMethod.POST)
	public int Reply(BoardReply boardReply) {
		return boardService.Reply(boardReply);
	}
	
	// ajax 댓글에 대한 매핑과 메소드 구현
	@ResponseBody
	@RequestMapping(value="board/replyUpdate", method=RequestMethod.POST)
	public Map<String,Object> ReplyUpdate(BoardReply boardr) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			boardService.ReplyUpdate(boardr);
			result.put("status","OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		return result;
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping(value="board/replyDelete", method=RequestMethod.POST)
	public Map<String,Object> ReplyDelete(int reno) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			boardService.ReplyDelete(reno);
			result.put("status","OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		return result;
	}
	
	
	// 페이징 처리
	@RequestMapping(value="board/paginglist", method=RequestMethod.GET)
	public String list(PagingVO vo, Model model, @RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = boardService.CountBoard();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("listAll", boardService.SelectBoard(vo));
		return "board/paginglist";
	}
	
}
