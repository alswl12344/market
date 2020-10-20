package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

public interface BoardDAO {

	// 글 목록 
	public List<BoardDTO> ListAll();

	// 글 작성
	public int Insert(BoardDTO boardDTO);

	// 선택 조회
	public BoardDTO ListDetail(int bno);
	
	// 조회수 증가
	public int RreadCnt(int bno); 
	
	// 글 수정 처리
	public int Update(BoardDTO dto);
	
	// 글 삭제 처리
	public int Delete(int bno);

	// 게시물 번호에 해당하는 댓글 번호를 가져오는 메소드
	public List<BoardReply> GetDetail(int bno);
	
	// 댓글 보기
	public BoardReply ReplyDetail(int reno);
	
	// 댓글 작성
	public int Reply(BoardReply boardReply);

	// 댓글 수정
	public int ReplyUpdate(BoardReply boardr);
	
	// 댓글 삭제
	public int ReplyDelete(int reno);

	// 게시글 총 갯수
	public int CountBoard();
	
	// 페이징 처리 게시글 조회
	public List<BoardDTO> SelectBoard(PagingVO vo);
	
	// 카테고리 불러오기
	public String SelectCategory(int bcategory);
	
}
