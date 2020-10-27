package kr.co.dong.Product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dong.ImgDTO;
import kr.co.dong.cart.CartDTO;


@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO productDAO;
	
	@Override
	public List<ProductDTO> plist() {
		// TODO Auto-generated method stub
		return productDAO.plist();
	}
	
	@Override
	public ProductDTO pdetail(int pcode) {
		// TODO Auto-generated method stub
		return productDAO.pdetail(pcode);
	}

	@Override
	public int pinsert(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return productDAO.pinsert(productDTO);
	}

	@Override
	public List<ProductDTO> psort(int ptcode) {
		// TODO Auto-generated method stub
		return productDAO.psort(ptcode);
	}

	@Override
	public ProductDTO psearch(String pname) {
		// TODO Auto-generated method stub
		return productDAO.psearch(pname);
	}

	@Override
	public int pupdate(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return productDAO.pupdate(productDTO);
	}

	@Override
	public int pdelete(int pcode) {
		// TODO Auto-generated method stub
		return productDAO.pdelete(pcode);
	}

	@Override
	public List<ProductDTO> pdellist() {
		// TODO Auto-generated method stub
		return productDAO.pdellist();
	}

	@Override
	public int countProduct() {
		// TODO Auto-generated method stub
		return productDAO.countProduct();
	}

	@Override
	public List<ProductDTO> selectProduct(PagingPVO pvo) {
		// TODO Auto-generated method stub
		return productDAO.selectProduct(pvo);
	}

	@Override
	public int pimageinsert(ImgDTO imgDTO) {
		// TODO Auto-generated method stub
		return productDAO.pimageinsert(imgDTO);
	}

	@Override
	public List<ImgDTO> pdetailimg(int imgfromno) {
		// TODO Auto-generated method stub
		return productDAO.pdetailimg(imgfromno);
	}

	@Override
	public int AddCart(CartDTO cartDTO) {
		// TODO Auto-generated method stub
		return productDAO.AddCart(cartDTO);
	}



	

}
