package kr.co.dong.Product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dong.ImgDTO;


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
	public List<ImgDTO> pdetailimg(int imgfromno) {
		// TODO Auto-generated method stub
		return productDAO.pdetailimg(imgfromno);
	}
	
	@Override
	public int pinsert(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return productDAO.pinsert(productDTO);
	}
	

	@Override
	public int pimageinsert(ImgDTO imgDTO) {
		// TODO Auto-generated method stub
		return productDAO.pimageinsert(imgDTO);
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
	public int pdeldelete(int pcode) {
		// TODO Auto-generated method stub
		return productDAO.pdeldelete(pcode);
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
	public int countProduct2(PagingPVO pvo) {
		// TODO Auto-generated method stub
		return productDAO.countProduct2(pvo);
	}

	@Override
	public List<ProductDTO> selectProduct(PagingPVO pvo) {
		// TODO Auto-generated method stub
		return productDAO.selectProduct(pvo);
	}
	
	@Override
	public List<ProductDTO> psearchlist(PagingPVO pvo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.psearchlist(pvo);
	}

	@Override
	public int productSort(int ptcodemain) {
		// TODO Auto-generated method stub
		return productDAO.productSort(ptcodemain);
	}

	@Override
	public List<ProductDTO> productSortList(PagingSortPVO spvo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.productSortList(spvo);
	}




	

}
