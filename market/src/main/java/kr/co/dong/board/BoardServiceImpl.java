/*
 * DAO 호출하기 
 */

package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

	@Override
	public List<BoardDTO> ListAll() {
		return boardDAO.ListAll();
	}

	@Override
	public int Insert(BoardDTO boardDTO) {
		return boardDAO.Insert(boardDTO);
	}

	@Override
	public BoardDTO ListDetail(int bno) {
		return boardDAO.ListDetail(bno);
	}

	@Override
	public int RreadCnt(int bno) {
		return boardDAO.RreadCnt(bno);
	}

	@Override
	public int Update(BoardDTO dto) {
		return boardDAO.Update(dto);
	}

	@Override
	public int Delete(int bno) {
		return boardDAO.Delete(bno);
	}

	@Override
	public List<BoardReply> GetDetail(int bno) {
		return boardDAO.GetDetail(bno);
	}

	@Override
	public BoardReply ReplyDetail(int reno) {
		return boardDAO.ReplyDetail(reno);
	}

	@Override
	public int Reply(BoardReply boardReply) {
		return boardDAO.Reply(boardReply);
	}

	@Override
	public int ReplyUpdate(BoardReply boardr) {
		return boardDAO.ReplyUpdate(boardr);
	}

	@Override
	public int ReplyDelete(int reno) {
		return boardDAO.ReplyDelete(reno);
	}

	@Override
	public int CountBoard() {
		return boardDAO.CountBoard();
	}

	@Override
	public List<BoardDTO> SelectBoard(PagingVO vo) {
		return boardDAO.SelectBoard(vo);
	}

	@Override
	public String SelectCategory(int bcategory) {
		return boardDAO.SelectCategory(bcategory);
	}
	
	
	
}
