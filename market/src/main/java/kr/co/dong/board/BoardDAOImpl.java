package kr.co.dong.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession; 
	private static final String nameSpace= "kr.co.dong.board";

	// 글 목록
	@Override
	public List<BoardDTO> ListAll() {
		return sqlSession.selectList(nameSpace + ".listall");
	}
	
	// 글 작성
	@Override
	public int Insert(BoardDTO boardDTO) {
		return sqlSession.insert(nameSpace + ".insert", boardDTO);
	}

	// 선택 조회
	@Override
	public BoardDTO ListDetail(int bno) {
		return sqlSession.selectOne(nameSpace + ".detail", bno);
	}
	
	// 조회수
	@Override
	public int RreadCnt(int bno) {
		return sqlSession.update(nameSpace + ".rreadCnt", bno);
	}

	// 글 수정
	@Override
	public int Update(BoardDTO dto) {
		return sqlSession.update(nameSpace + ".update", dto);
	}

	// 글 삭제
	@Override
	public int Delete(int bno) {
		return sqlSession.delete(nameSpace + ".delete", bno);
	}

	// 댓글 번호 가져오기
	@Override
	public List<BoardReply> GetDetail(int bno) {
		return sqlSession.selectList(nameSpace+".detail1", bno);
	}

	// 댓글 보기
	@Override
	public BoardReply ReplyDetail(int reno) {
		return sqlSession.selectOne(nameSpace+".replydetail", reno);
	}
	
	// 댓글 작성
	@Override
	public int Reply(BoardReply boardReply) {
		return sqlSession.insert(nameSpace+".reply", boardReply);
	}
	
	// 댓글 수정
	@Override
	public int ReplyUpdate(BoardReply boardr) {
		return sqlSession.update(nameSpace+".replyupdate", boardr);
	}

	// 댓글 삭제
	@Override
	public int ReplyDelete(int reno) {
		return sqlSession.delete(nameSpace+".replydelete", reno);
	}

	// 게시글 총 갯수
	@Override
	public int CountBoard() {
		return sqlSession.selectOne(nameSpace+".countBoard");
	}

	// 페이징 처리 게시글 조회
	@Override
	public List<BoardDTO> SelectBoard(PagingVO vo) {
		return sqlSession.selectList(nameSpace+".selectBoard", vo);
	}

	@Override
	public String SelectCategory(int bcategory) {
		return sqlSession.selectOne(nameSpace+".selectCategory", bcategory);
	}

	
}
