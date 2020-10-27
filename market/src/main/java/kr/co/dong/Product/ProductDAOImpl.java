/*
 * 상품 전체 목록보기
 * 상품 등록하기
 * 상품 정렬하기
 * 상품 검색하기
 * 상품 수정하기
 * 상품 삭제하기
 * */



package kr.co.dong.Product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.dong.ImgDTO;
import kr.co.dong.board.PagingVO;
import kr.co.dong.cart.CartDTO;


@Repository

public class ProductDAOImpl implements ProductDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="kr.co.dong.Product";
	
	@Override
	public List<ProductDTO> plist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".plist");
	}
	

	@Override
	public ProductDTO pdetail(int pcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".pdetail", pcode);
	}


	@Override
	public int pinsert(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".pinsert", productDTO);
		
	}

	@Override
	public List<ProductDTO> psort(int ptcode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".psort", ptcode);
	}

	@Override
	public ProductDTO psearch(String pname) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".psearch", pname);
	}

	@Override
	public int pupdate(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".pupdate", productDTO);
	}

	@Override
	public int pdelete(int pcode) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".pdelete", pcode);
	}


	@Override
	public List<ProductDTO> pdellist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".pdellist");
	}


	@Override
	public int countProduct() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".countProduct");
	}


	@Override
	public List<ProductDTO> selectProduct(PagingPVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectProduct", pvo);
	}


	@Override
	public int pimageinsert(ImgDTO imgDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".pimageinsert", imgDTO);
	}


	@Override
	public List<ImgDTO> pdetailimg(int imgfromno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".pdetailimg", imgfromno);
	}


	@Override
	public int AddCart(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".AddCart", cartDTO);
	}





	}


