package kr.co.dong.Product;

public class ProductDTO {
	private int pcode; //상품번호
	private String pname; //상품명
	private int pprice; //상품가격
	private int pbuycount; //상품 구매 수량
	private int pcount; //상품 재고수량
	private String pdate; // 상품 등록일
	private String plimit; //상품 등록 마감일
	private String pimage; //상품 이미지
	private int ptcodemain; //상품 대분류코드
	private int ptcodesub; //상품 중분류 코드 
	private String pcontent; //상품설명
	private String puserid; //상품 입력 아이디
	private int pdel; //상품 삭제 여부 
	
	public int getPtcodemain() {
		return ptcodemain;
	}
	public void setPtcodemain(int ptcodemain) {
		this.ptcodemain = ptcodemain;
	}

	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPbuycount() {
		return pbuycount;
	}
	public void setPbuycount(int pbuycount) {
		this.pbuycount = pbuycount;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPlimit() {
		return plimit;
	}
	public void setPlimit(String plimit) {
		this.plimit = plimit;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPtcodesub() {
		return ptcodesub;
	}
	public void setPtcodesub(int ptcodesub) {
		this.ptcodesub = ptcodesub;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPuserid() {
		return puserid;
	}
	public void setPuserid(String puserid) {
		this.puserid = puserid;
	}
	public int getPdel() {
		return pdel;
	}
	public void setPdel(int pdel) {
		this.pdel = pdel;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice + ", pbuycount=" + pbuycount
				+ ", pcount=" + pcount + ", pdate=" + pdate + ", plimit=" + plimit + ", pimage=" + pimage
				+ ", ptcodemain=" + ptcodemain + ", ptcodesub=" + ptcodesub + ", pcontent=" + pcontent + ", puserid="
				+ puserid + ", pdel=" + pdel + "]";
	}
}

	