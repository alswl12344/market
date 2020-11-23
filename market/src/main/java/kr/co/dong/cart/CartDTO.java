package kr.co.dong.cart;

import kr.co.dong.Product.ProductDTO;

public class CartDTO {
	private int cartcode; 		// 장바구니 테이블 컬럼의 PK, AI 설정할 코드
	private int ordernumber; 		// 결제 완료 시 결제코드가 들어올 컬럼
	private int pcode; 			// 장바구니에 담을 물건의 상품코드
	private int cbuycount;	 	// 구매할 수량 
	private int cprice;			// 상품가격
	private int cartstatus;			// 상품가격
	private String cimage;		// 구매할 상품의 썸네일 이미지
	private String cname;		// 구매할 상품의 썸네일 이미지	
	private String cuserid;		// 판매자 id 
	private String customerid;	// 구매자 id (구매자 id를 기준으로 select하여 장바구니를 출력할 수 있도록 함)	
	
	public CartDTO(){
		
	}		
	public CartDTO(ProductDTO productDTO, String customerid) {
		setPcode(productDTO.getPcode());
		setCimage(productDTO.getPimage());
		setCbuycount(productDTO.getPbuycount()); 
		setCprice(productDTO.getPprice()); 
		setCuserid(productDTO.getPuserid());
		setCustomerid(customerid);
		setCname(productDTO.getPname());
	}		
	

	
	public int getCartstatus() {
		return cartstatus;
	}
	public void setCartstatus(int cartstatus) {
		this.cartstatus = cartstatus;
	}
	public int getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(int ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getCartcode() {
		return cartcode;
	}
	public void setCartcode(int cartcode) {
		this.cartcode = cartcode;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getCbuycount() {
		return cbuycount;
	}

	public void setCbuycount(int cbuycount) {
		this.cbuycount = cbuycount;
	}

	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCuserid() {
		return cuserid;
	}
	public void setCuserid(String cuserid) {
		this.cuserid = cuserid;
	}
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cartcode=" + cartcode + ", pcode=" + pcode + ", cbuycount=" + cbuycount + ", cprice=" + cprice
				+ ", cimage=" + cimage + ", cuserid=" + cuserid + ", customerid=" + customerid + "]";
	}
	
	
}
